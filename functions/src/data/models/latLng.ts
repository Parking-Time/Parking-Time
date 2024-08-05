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

    static fromJson(json: {[key: string]: any}): LatLng {
        return new LatLng({
            latitude: json['latitude'],
            longitude: json['longitude'],
        });
    }

    toJson(): {[key: string]: any} {
        return {latitude: this.latitude, longitude: this.longitude};
    }
}