//
//  Locations.swift
//  testapp
//
//  Created by Orangeodc10 on 23/12/2024.
//

import Foundation
import MapKit

struct LocationModel : Identifiable{
    let id :UUID
    let name:String
    let cityname:String
    let coordinates:CLLocationCoordinate2D?
    let description : String
    let imageNames : [String]
    let link :String
    
}
