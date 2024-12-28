import SwiftUI
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    // CLLocationManager instance
    private var locationManager = CLLocationManager()
    
    // Published properties to notify the view
    @Published var currentLocation: CLLocationCoordinate2D?
    @Published var isLocationAuthorized = false
    @Published var error: Error?

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
    }

    // Request location authorization
    func requestLocationPermission() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.requestWhenInUseAuthorization()
        } else {
            self.error = NSError(domain: "LocationError", code: 1, userInfo: [NSLocalizedDescriptionKey: "Location services are not enabled."])
        }
    }

    // Start updating the location
    func startUpdatingLocation() {
        if isLocationAuthorized {
            locationManager.startUpdatingLocation()
        }
    }

    // Stop updating the location
    func stopUpdatingLocation() {
        locationManager.stopUpdatingLocation()
    }

    // CLLocationManagerDelegate methods
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.currentLocation = location.coordinate
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.error = error
    }

    // Check the authorization status and handle accordingly
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
