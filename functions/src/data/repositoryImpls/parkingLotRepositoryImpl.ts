import {IGetLightParkingLot, ParkingLotRepository} from "../../domain/repositories/parkingLotRepository";
import {firestore} from "firebase-admin";
import Firestore = firestore.Firestore;
import {LightParkingLot} from "../models/lightParkingLot";
import QueryDocumentSnapshot = firestore.QueryDocumentSnapshot;
import {getDistance} from "geolib";

export class ParkingLotRepositoryImpl implements ParkingLotRepository {
    static readonly parkingLots = 'parking_lots';
    static readonly amountDayWeeks = 'amount_day_weeks';
    static readonly parkingLotImages = 'parking_lot_images';

    db: Firestore;

    constructor(fireStore: FirebaseFirestore.Firestore) {
        this.db = fireStore;
    }

    async getLightParkingLotsFromDistance(parameters: IGetLightParkingLot): Promise<Array<LightParkingLot>> {
        const startAt = (parameters.page-1) * parameters.pageSize;
        const endAt = startAt + parameters.pageSize;

        const query = parameters.area !== undefined ?
            this.db
                .collection(ParkingLotRepositoryImpl.parkingLots)
                .where('location.latitude', '>=', parameters.area.southwest.latitude)
                .where('location.latitude', '<=', parameters.area.northeast.latitude)
                .where('location.longitude', '>=', parameters.area.southwest.longitude)
                .where('location.longitude', '<=', parameters.area.northeast.longitude) :
            this.db
                .collection(ParkingLotRepositoryImpl.parkingLots)
                .where(
                    'keyword',
                    'array-contains',
                    parameters.keyword?.toLowerCase()!
                );

        const snapshots = (await query.get()).docs;

        const results: Array<LightParkingLot> = [];

        for (const snapshot of snapshots) {
            results.push(await this.getLightParkingLot(snapshot));
        }

        results.sort((a, b) => {
            const distanceA = getDistance(
                { latitude: parameters.center.latitude, longitude: parameters.center.longitude },
                { latitude: a.location.latitude, longitude: a.location.longitude },
            );
            const distanceB = getDistance(
                { latitude: parameters.center.latitude, longitude: parameters.center.longitude },
                { latitude: b.location.latitude, longitude: b.location.longitude },
            );
            return distanceA - distanceB;
        });

        return results.slice(startAt, endAt);
    }

    async getLightParkingLotsFromPopularity(parameters: IGetLightParkingLot): Promise<Array<LightParkingLot>> {
        const startAt = (parameters.page-1) * parameters.pageSize;

        let query = parameters.area !== undefined ?
            this.db
                .collection(ParkingLotRepositoryImpl.parkingLots)
                .where('location.latitude', '>=', parameters.area.southwest.latitude)
                .where('location.latitude', '<=', parameters.area.northeast.latitude)
                .where('location.longitude', '>=', parameters.area.southwest.longitude)
                .where('location.longitude', '<=', parameters.area.northeast.longitude) :
            this.db
                .collection(ParkingLotRepositoryImpl.parkingLots)
                .where(
                    'keyword',
                    'array-contains',
                    parameters.keyword?.toLowerCase()!
                );
        query = query.orderBy('view_count', 'asc').startAt(startAt).limit(parameters.pageSize);

        const snapshots = (await query.get()).docs;

        const results: Array<LightParkingLot> = [];

        for (const snapshot of snapshots) {
            results.push(await this.getLightParkingLot(snapshot));
        }
        return results;
    }

    private async getLightParkingLot(snapshot: QueryDocumentSnapshot): Promise<LightParkingLot> {
        const jsonObj = snapshot.data();

        const amountDayWeeksSnapShots = await this.db
            .collection(ParkingLotRepositoryImpl.amountDayWeeks)
            .where('parking_lot', '==', jsonObj['id'])
            .get();

        if (!amountDayWeeksSnapShots.empty) {
            jsonObj['amount_day_weeks'] = amountDayWeeksSnapShots.docs[0].data();
        }

        const parkingLotImageSnapShots = await this.db
            .collection(ParkingLotRepositoryImpl.parkingLotImages)
            .where('parking_lot', '==', jsonObj['id'])
            .get();

        if (!parkingLotImageSnapShots.empty) {
            jsonObj['image'] = parkingLotImageSnapShots.docs[0].data()['image_url'];
        }

        return LightParkingLot.fromJson(jsonObj);
    }

}