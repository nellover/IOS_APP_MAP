//
//  MapView.swift
//  testapp
//
//  Created by Orangeodc1 on 24/12/2024.
//

import SwiftUI
import MapKit

struct MapView: View {
    var coordinate : CLLocationCoordinate2D
    
    private var region: MKCoordinateRegion{
        MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
        )
    }
    
    var body: some View {
        Map(position: .constant(.region(region)))
    }
}
#Preview {
    MapView(coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275))
}
