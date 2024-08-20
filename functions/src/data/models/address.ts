export interface IAddress {
    sido: string;
    sgg: string;
    umd: string;
    ri: string;
    addressLine: string;
}

export class Address implements IAddress {
    sido: string;
    sgg: string;
    umd: string;
    ri: string;
    addressLine: string;

    constructor(parameters: IAddress) {
        this.sido = parameters.sido;
        this.sgg = parameters.sgg;
        this.umd = parameters.umd;
        this.ri = parameters.ri;
        this.addressLine = parameters.addressLine;
    }

    static fromJson(json: {[key: string]: any}): Address {
        return new Address({
            sido: json['sido'] ?? '',
            sgg: json['sgg'] ?? '',
            umd: json['umd'] ?? '',
            ri: json['ri'] ?? '',
            addressLine: json['address_line'] ?? '',
        });
    }

    toJson(): {[key: string]: any} {
        return {
            sido: this.sido,
            sgg: this.sgg,
            umd: this.umd,
            ri: this.ri,
            address_line: this.addressLine,
        };
    }
}
