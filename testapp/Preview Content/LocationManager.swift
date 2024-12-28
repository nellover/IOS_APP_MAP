import SwiftUI
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {

    private var locationManager = CLLocationManager()
    
 
    @Published var currentLocation: CLLocationCoordinate2D?
    @Published var isLocationAuthorized = false
    @Published var error: Error?

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
    }

    
    func requestLocationPermission() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.requestWhenInUseAuthorization()
        } else {
            self.error = NSError(domain: "LocationError", code: 1, userInfo: [NSLocalizedDescriptionKey: "Location services are not enabled."])
        }
    }

    
    func startUpdatingLocation() {
        if isLocationAuthorized {
            locationManager.startUpdatingLocation()
        }
    }

    func stopUpdatingLocation() {
        locationManager.stopUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.currentLocation = location.coordinate
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.error = error
    }


    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            requestLocationPermission()
        case .restricted, .denied:
            self.isLocationAuthorized = false
        case .authorizedWhenInUse, .authorizedAlways:
            self.isLocationAuthorized = true
            startUpdatingLocation()
        @unknown default:
            break
        }
    }
}
