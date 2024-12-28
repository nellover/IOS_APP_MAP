import SwiftUI

struct PermissionScreen: View {
    @StateObject private var locationManager = LocationManager()  

    var body: some View {
        VStack {
            if locationManager.isLocationAuthorized {
                
                HomeScreen_()
            } else {
                
                VStack(spacing: 20) {
                    Text("We need access to your location")
                        .font(.title)
                        .padding()
                    Text("Please enable location services to proceed.")
                        .font(.body)
                        .padding()

                    // Button to guide user to Settings
                    Button(action: {
                        if let appSettings = URL(string: UIApplication.openSettingsURLString) {
                            UIApplication.shared.open(appSettings)
                        }
                    }) {
                        Text("Go to Settings")
                            .font(.headline)
                            .foregroundColor(.blue)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 8).fill(Color.blue.opacity(0.1)))
                    }
                }
                .padding()
                .onAppear {
          
                    locationManager.checkLocationAuthorization()
                }
            }
        }
        .onChange(of: locationManager.isLocationAuthorized) { isAuthorized in
            if isAuthorized {
                
            }
        }
    }
}

struct PermissionScreen_Previews: PreviewProvider {
    static var previews: some View {
        PermissionScreen()
    }
}
