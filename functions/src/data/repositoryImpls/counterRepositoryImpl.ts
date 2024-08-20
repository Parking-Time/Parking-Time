import {firestore} from "firebase-admin";
import Firestore = firestore.Firestore;
import {CounterRepository} from "../../domain/repositories/counterRepository";

export class CounterRepositoryImpl implements CounterRepository {
    static readonly counters: string = 'counters';

    fireStore: Firestore;

    constructor(fireStore: FirebaseFirestore.Firestore) {
        this.fireStore = fireStore;
    }

    async createNewId(collectionName: string): Promise<number | null> {
        const counterRef = this.fireStore
            .collection(CounterRepositoryImpl.counters)
            .doc(`${collectionName}.counter`);

        try {
            return await this.fireStore.runTransaction(async (transaction) => {
                const counterDoc = await transaction.get(counterRef);

                if (!counterDoc.exists) {
                    transaction.set(counterRef, {count: 1});
                    return 1;
                }

                const currentCount = counterDoc.data()?.count ?? 0;
                const newCount = currentCount + 1;

                transaction.update(counterRef, {count: newCount});
                return newCount;
            });
        } catch (error) {
            return null;
        }
    }
}