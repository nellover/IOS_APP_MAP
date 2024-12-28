//
//  LocationDetailsViewModels.swift
//  testapp
//
//  Created by Orangeodc1 on 24/12/2024.
//

import Foundation
import SwiftUI

class LocationDetailsViewModels: ObservableObject{
    
    @Published var location : LocationModel
    
    init(){
        self.location = locationsListe[0]
    }
    
        func FilterLocation(LocationId: UUID)-> LocationModel{
            let filteredData = locationsListe.filter{
                $0.id == LocationId
            }
            self.location = filteredData[0]
            return  locationsListe[0]
        }
}
