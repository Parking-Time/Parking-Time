import {LatLngBounds} from "../../data/models/latLngBounds";
import {LatLng} from "../../data/models/latLng";

export class LocationUseCase {

    getExpandLatLngBoundsWithMeters(center: LatLng, meters: number): LatLngBounds {
        const earthRadius = 6378137.0;

        const lat = center.latitude;
        const lng = center.longitude;

        const offsetLat = (meters / earthRadius) * (180 / Math.PI);
        const offsetLng = (meters / (earthRadius * Math.cos(Math.PI * lat / 180))) * (180 / Math.PI);

        const northEast: LatLng = new LatLng({latitude: lat + offsetLat, longitude: lng + offsetLng});

        const southWest: LatLng = new LatLng({latitude: lat - offsetLat, longitude: lng - offsetLng});

        return {
            northeast: northEast,
            southwest: southWest
        };
    }

}