import SwiftUI
import MapKit

struct FullMap: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922),
        span: MKCoordinateSpan(latitudeDelta: 20, longitudeDelta: 20)
    )
    

    
    @StateObject var viewModel = MapViewModel()
        
        var body: some View {
            VStack {
                Map(coordinateRegion: viewModel.binding,showsUserLocation: true,userTrackingMode: .constant(.follow))
                    .edgesIgnoringSafeArea(.all)
                    .onAppear(perform: {
                        viewModel.checkIfLocationIsEnabled()
                    })
                
            }
            
        }
}

#Preview {
    FullMap()
}
