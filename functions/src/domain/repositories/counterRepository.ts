export interface CounterRepository {
    createNewId(collectionName: string): Promise<number | null>;
}