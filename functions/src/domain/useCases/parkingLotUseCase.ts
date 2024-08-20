import {ParkingLotRepository} from "../repositories/parkingLotRepository";
import {LightParkingLot} from "../../data/models/lightParkingLot";
import {Sorting} from "../../utils/sortings/sorting";
import {LatLngBounds} from "../../data/models/latLngBounds";
import {LatLng} from "../../data/models/latLng";

export class ParkingLotUseCase {
    parkingLotRepository: ParkingLotRepository;

    constructor(parkingLotRepository: ParkingLotRepository) {
        this.parkingLotRepository = parkingLotRepository;
    }

    async getLightParkingLotsFromArea(sorting: Sorting, page: number, pageSize: number, center: LatLng, area: LatLngBounds): Promise<Array<LightParkingLot>> {
        switch (sorting) {
            case Sorting.DISTANCE: return await this.parkingLotRepository.getLightParkingLotsFromDistance({
                page: page, pageSize: pageSize, center: center, area: area,
            });
            case Sorting.POPULARITY: return await this.parkingLotRepository.getLightParkingLotsFromPopularity({
                page: page, pageSize: pageSize, center: center, area: area,
            });
            default: throw new Error('올바르지 않은 sorting값 입니다.');
        }
    }

    async getLightParkingLotsFromKeyword(sorting: Sorting, page: number, pageSize: number, center: LatLng, keyword: string) {
        switch (sorting) {
            case Sorting.DISTANCE: return await this.parkingLotRepository.getLightParkingLotsFromDistance({
                page: page, pageSize: pageSize, center: center, keyword: keyword,
            });
            case Sorting.POPULARITY: return await this.parkingLotRepository.getLightParkingLotsFromPopularity({
                page: page, pageSize: pageSize, center: center, keyword: keyword
            });
            default: throw new Error('올바르지 않은 sorting값 입니다.');
        }
    }
}