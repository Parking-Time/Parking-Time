import * as express from "express";
import {LocationUseCase} from "../../domain/useCases/locationUseCase";
import {ParkingLotUseCase} from "../../domain/useCases/parkingLotUseCase";
import {ApiUseCase} from "../../domain/useCases/apiUseCase";
import {Sorting} from "../../utils/sortings/sorting";
import {Meta, ResponseBody} from "../../data/models/response_body";
import {LatLng} from "../../data/models/latLng";
import {apiRouter} from "../../index";

export class ParkingLotService {
    locationUseCase: LocationUseCase;
    parkingLotUseCase: ParkingLotUseCase;
    apiUseCase: ApiUseCase;

    constructor(locationUseCase: LocationUseCase, parkingLotUseCase: ParkingLotUseCase, apiUseCase: ApiUseCase) {
        this.locationUseCase = locationUseCase;
        this.parkingLotUseCase = parkingLotUseCase;
        this.apiUseCase = apiUseCase;

        apiRouter.get("/parking_lots", this.getParkingLots.bind(this));
    }

    async getParkingLots(request: express.Request, response: express.Response): Promise<void> {
        try {
            const sorting = request.query['sorting'] as Sorting | null;
            const page = request.query['page'] !== undefined ?
                Number.parseInt(request.query['page'] as string) :
                null;
            const pageSize = request.query['page_size'] !== undefined ?
                Number.parseInt(request.query['page_size'] as string) :
                15;
            const latLng = request.query['center'] !== undefined ?
                (request.query['center'] as string).split(',') :
                null;
            const center = latLng !== null ? new LatLng({
                latitude: Number.parseFloat(latLng[0]),
                longitude: Number.parseFloat(latLng[1]),
            }) : null;
            const distance = request.query['distance'] != undefined ?
                Number.parseInt(request.query['distance'] as string) :
                null;
            const keyword = request.query['keyword'] as string | null;

            this.apiUseCase.nullCheckParameters([
                {key: 'sorting', value: sorting},
                {key: 'page', value: page},
                {key: 'center', value: center},
            ]);

            if (keyword == null) {
                this.apiUseCase.nullCheckParameters([{key: 'distance', value: distance}]);

                const area = this.locationUseCase.getExpandLatLngBoundsWithMeters(center!, distance!);
                const result = await this.parkingLotUseCase.getLightParkingLotsFromArea(sorting!, page!, pageSize, center!, area);

                response.status(200).json(
                    new ResponseBody({
                        status: 200,
                        body: result.map((value) => value.toJson()),
                        meta: new Meta({
                            page: page!,
                            pageSize: pageSize!,
                            count: result.length,
                        }),
                    }).toJson()
                );
            } else {
                const result = await this.parkingLotUseCase.getLightParkingLotsFromKeyword(sorting!, page!, pageSize, center!, keyword!);
                response.status(200).json(
                    new ResponseBody({
                        status: 200,
                        body: result.map((value) => value.toJson()),
                        meta: new Meta({
                            page: page!,
                            pageSize: pageSize!,
                            count: result.length,
                        }),
                    }).toJson()
                );
            }
        } catch (error) {
            if (error instanceof Error) {
                console.error(error.name, error.message, error.stack);
                console.log(`<br>`);
                console.log(`<br>`);
                response.status(400).json(new ResponseBody({
                    status: 400,
                    errorMessage: error.message,
                }));
            } else {
                console.error('An unknown error occurred.');
                console.log(`<br>`);
                console.log(`<br>`);
                response.status(400).json(new ResponseBody({
                    status: 400,
                    errorMessage: 'An unknown error occurred.',
                }));
            }
        }
    }
}