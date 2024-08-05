import {Address} from "./address";
import {AmountDayWeeks} from "./amount_day_weeks";
import {LatLng} from "./latLng";

export interface ILightParkingLot {
    id: number;
    acceptableQuantity: number;
    openTime?: number | null;
    closeTime?: number | null;
    name: string;
    address: Address;
    location: LatLng;
    viewCount: number;
    amountDayWeeks?: AmountDayWeeks | null;
    image: string;
    types: number[];
}

export class LightParkingLot implements ILightParkingLot {
    id: number;
    acceptableQuantity: number;
    openTime: number | null;
    closeTime: number | null;
    name: string;
    address: Address;
    location: LatLng;
    viewCount: number;
    amountDayWeeks: AmountDayWeeks | null;
    image: string;
    types: number[];

    constructor(parameters: ILightParkingLot) {
        this.id = parameters.id;
        this.acceptableQuantity = parameters.acceptableQuantity;
        this.openTime = parameters.openTime ?? null;
        this.closeTime = parameters.closeTime ?? null;
        this.name = parameters.name;
        this.address = parameters.address;
        this.location = parameters.location;
        this.viewCount = parameters.viewCount;
        this.image = parameters.image;
        this.types = parameters.types;
        this.amountDayWeeks = parameters.amountDayWeeks ?? null;
    }

    static fromJson(json: {[key: string]: any}): LightParkingLot {
        return new LightParkingLot({
            id: json['id'],
            acceptableQuantity: json['acceptable_quantity'],
            name: json['name'],
            address: Address.fromJson(json['address']),
            location: LatLng.fromJson(json['location']),
            viewCount: json['view_count'],
            image: json['image'],
            types: json['types'],
            openTime: json['open_time'],
            closeTime: json['close_time'],
            amountDayWeeks: AmountDayWeeks.fromJson(json['amount_day_weeks']),
        });
    }

    toJson(): {[key: string]: any} {
        return {
            id: this.id,
            acceptable_quantity: this.acceptableQuantity,
            open_time: this.openTime,
            close_time: this.closeTime,
            name: this.name,
            address: this.address.toJson(),
            location: this.location.toJson(),
            view_count: this.viewCount,
            amount_day_weeks: this.amountDayWeeks?.toJson(),
            image: this.image,
            types: this.types,
        };
    }
}
