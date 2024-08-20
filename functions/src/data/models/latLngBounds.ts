import {LatLng} from "./latLng";

export interface ILatLngBounds {
    southwest: LatLng;
    northeast: LatLng;
}

export class LatLngBounds implements ILatLngBounds {
    southwest: LatLng;
    northeast: LatLng;

    constructor(parameters: ILatLngBounds) {
        this.southwest = parameters.southwest;
        this.northeast = parameters.northeast;
    }
}