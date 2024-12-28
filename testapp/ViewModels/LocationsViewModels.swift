//
//  LocationsViewModels.swift
//  testapp
//
//  Created by Orangeodc10 on 24/12/2024.
//

import Foundation
import SwiftUI

class LocationsViewModels: ObservableObject{
    
    @Published var locations : [LocationModel]
    init(){
        self.locations = locationsListe
    }

}

