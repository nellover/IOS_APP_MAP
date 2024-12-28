import SwiftUI
import CoreLocation
import MapKit

struct LocationListView: View {
    @ObservedObject var locationViewModel = LocationsViewModels()
    
    var body: some View {
        NavigationView {
            List(locationViewModel.locations) { location in
                
                NavigationLink{
                    LocationDetailsView(LocationId: location.id)
                } label: {
                    LocationItem(name: location.name, cityname: location.cityname, imageNames: location.imageNames[0])
                }
            }
            .navigationTitle("Locations")
        }
    }
}

struct LocationListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationListView()
    }
}
