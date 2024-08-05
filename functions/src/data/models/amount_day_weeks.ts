export interface IAmountDayWeeks {
    mon?: AmountDay;
    tue?: AmountDay;
    thu?: AmountDay;
    wed?: AmountDay;
    fri?: AmountDay;
    sat?: AmountDay;
    sun?: AmountDay;
    parkingLot: number;
}

export class AmountDayWeeks implements IAmountDayWeeks {
    mon?: AmountDay;
    tue?: AmountDay;
    thu?: AmountDay;
    wed?: AmountDay;
    fri?: AmountDay;
    sat?: AmountDay;
    sun?: AmountDay;
    parkingLot: number;

    constructor(parameters: IAmountDayWeeks) {
        this.mon = parameters.mon;
        this.tue = parameters.tue;
        this.thu = parameters.thu;
        this.wed = parameters.wed;
        this.fri = parameters.fri;
        this.sat = parameters.sat;
        this.sun = parameters.sun;
        this.parkingLot = parameters.parkingLot;
    }

    static fromJson(json: {[key: string]: any}): AmountDayWeeks {
        return new AmountDayWeeks({
            mon: json['mon'] != undefined ? AmountDay.fromJson(json['mon']) : undefined,
            tue: json['tue'] != undefined ? AmountDay.fromJson(json['tue']) : undefined,
            thu: json['thu'] != undefined ? AmountDay.fromJson(json['thu']) : undefined,
            wed: json['wed'] != undefined ? AmountDay.fromJson(json['wed']) : undefined,
            fri: json['fri'] != undefined ? AmountDay.fromJson(json['fri']) : undefined,
            sat: json['sat'] != undefined ? AmountDay.fromJson(json['sat']) : undefined,
            sun: json['sun'] != undefined ? AmountDay.fromJson(json['sun']) : undefined,
            parkingLot: json['parking_lot']
        });
    }

    toJson(): {[key: string]: any} {
        return {
            mon: this.mon?.toJson() ?? null,
            tue: this.tue?.toJson() ?? null,
            thu: this.thu?.toJson() ?? null,
            wed: this.wed?.toJson() ?? null,
            fri: this.fri?.toJson() ?? null,
            sat: this.sat?.toJson() ?? null,
            sun: this.sun?.toJson() ?? null,
            parking_lot: this.parkingLot
        };
    }
}

export class AmountDay {
    basicAmount: number;
    freeTime: number;
    stackAmount: number;
    stackTime: number;

    constructor(basicAmount: number, freeTime: number, stackAmount: number, stackTime: number) {
        this.basicAmount = basicAmount;
        this.freeTime = freeTime;
        this.stackAmount = stackAmount;
        this.stackTime = stackTime;
    }

    static fromJson(json: {[key: string]: any}): AmountDay {
        return new AmountDay(
            json['basic_amount'],
            json['free_time'],
            json['stack_amount'],
            json['stack_time']
        );
    }

    toJson(): {[key: string]: any} {
        return {
            basic_amount: this.basicAmount,
            free_time: this.freeTime,
            stack_amount: this.stackAmount,
            stack_time: this.stackTime
        };
    }
}