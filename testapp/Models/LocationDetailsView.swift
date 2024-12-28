import SwiftUI
import MapKit

struct LocationDetailsView: View {
    var LocationId: UUID
    @ObservedObject var locationViewModels = LocationDetailsViewModels()
    
    var body: some View {
        VStack(alignment: .leading) {
        
            MapView(coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275))
                .frame(height: 200)
            
            Text(locationViewModels.location.name)
                .font(.system(size: 20, weight: .bold))
            
            Text(locationViewModels.location.cityname)
                .font(.system(size: 20))
                .foregroundColor(.gray)
            
            Divider()
            
            Text("About the move")
                .font(.system(size: 20))
            
            Text(locationViewModels.location.description)
                .font(.system(size: 20))
            
            Text("Location Images")
                .font(.system(size: 20, weight: .bold))
                .padding(.top, 10)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(locationViewModels.location.imageNames, id: \.self) { imageName in
                        Image(imageName)  
                            .resizable()
                            .scaledToFill()
                            .frame(width: 300, height: 300)
                            .cornerRadius(8)
                            .clipped()
                    }
                }
                .padding(.horizontal)
            }
        }
        
        
        Link("Learn more about \(locationViewModels.location.name)", destination: URL(string: locationViewModels.location.link)!)
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.blue)
                .padding(.top, 10)
        
        
        
    }
        
    
    
    }

#Preview {

    LocationDetailsView(LocationId: UUID())
}
