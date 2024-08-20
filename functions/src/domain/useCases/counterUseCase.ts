import {CounterRepository} from "../repositories/counterRepository";

export class CounterUseCase {
    counterRepository: CounterRepository;

    constructor(counterRepository: CounterRepository) {
        this.counterRepository = counterRepository;
    }

    createNewId(collection: string): Promise<number | null> {
        return this.counterRepository.createNewId(collection);
    }
}