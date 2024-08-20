import functions = require("firebase-functions");
import express = require("express");

import {initializeApp} from "firebase-admin/app";
import {firestore} from "firebase-admin";
import {ParkingLotService} from "./presentation/services/parkingLotService";
import {LocationUseCase} from "./domain/useCases/locationUseCase";
import {ApiUseCase} from "./domain/useCases/apiUseCase";
import {ParkingLotUseCase} from "./domain/useCases/parkingLotUseCase";
import {ParkingLotRepositoryImpl} from "./data/repositoryImpls/parkingLotRepositoryImpl";

initializeApp();

const app = express();
export const apiRouter = express.Router();
const db = firestore();

app.use(express.json());
app.use("/api", apiRouter);

db.settings({ignoreUn1definedProperties: true});

exports.parking_time = functions.region("asia-northeast3").https.onRequest(app);

new ParkingLotService(
    new LocationUseCase(),
    new ParkingLotUseCase(new ParkingLotRepositoryImpl(db)),
    new ApiUseCase(),
);
