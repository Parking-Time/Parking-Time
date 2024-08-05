export interface IResponseBody {
    status: number;
    errorMessage?: string;
    body?: {[key: string]: any} | Array<any>;
    meta?: Meta
}

export class ResponseBody implements IResponseBody {
    status: number;
    errorMessage?: string;
    body?: {[key: string]: any} | Array<any>;
    meta?: Meta;

    constructor(
        properties: IResponseBody
    ) {
        this.status = properties.status;
        this.errorMessage = properties.errorMessage;
        this.body = properties.body;
        this.meta = properties.meta;
    }

    toJson(): {[key: string]: any} {
        return {
            status: this.status,
            error_message: this.errorMessage ?? '',
            body: this.body ?? null,
            meta: this.meta?.toJson()
        };
    }
}

export interface IMeta {
    page: number;
    pageSize: number;
    count: number;
}

export class Meta implements IMeta {
    page: number;
    pageSize: number;
    count: number;

    constructor(parameters: IMeta) {
        this.page = parameters.page;
        this.pageSize = parameters.pageSize;
        this.count = parameters.count;
    }

    toJson(): {[key: string]: any} {
        return {
            page: this.page,
            page_size: this.pageSize,
            count: this.count,
        };
    }
}