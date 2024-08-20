import {LatLngBounds} from "../../data/models/latLngBounds";
import {LightParkingLot} from "../../data/models/lightParkingLot";
import {LatLng} from "../../data/models/latLng";

export interface IGetLightParkingLot {
    page: number;
    pageSize: number;
    center: LatLng;
    area?: LatLngBounds;
    keyword?: string;
}

export interface ParkingLotRepository {
    getLightParkingLotsFromDistance<T extends IGetLightParkingLot>(parameters: T): Promise<Array<LightParkingLot>>;

    getLightParkingLotsFromPopularity<T extends IGetLightParkingLot>(parameters: T): Promise<Array<LightParkingLot>>;
}