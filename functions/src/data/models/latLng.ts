export interface ILatLng {
    latitude: number;
    longitude: number;
}

export class LatLng implements ILatLng {
    latitude: number;
    longitude: number;

    constructor(parameters: ILatLng) {
        this.latitude = parameters.latitude;
        this.longitude = parameters.longitude;
    }

    static fromJson(json: Array<number>): LatLng {
        return new LatLng({
            latitude: json[0],
            longitude: json[1],
        });
    }

    toJson(): Array<number> {
        return [this.latitude, this.longitude];
    }
}