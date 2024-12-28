//
//  LocationItem.swift
//  testapp
//
//  Created by Orangeodc10 on 24/12/2024.
//

import SwiftUI

struct LocationItem: View {
    let name: String
    let cityname: String
    let imageNames : String

    var body: some View {
        HStack {
            Image(imageNames)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(25)
            
            VStack(alignment: .leading){
                Text(name)
                Text(cityname)
                    .font(.system(size:20))
            }
            
        }
    }
}

struct LocationItem_Previews: PreviewProvider {
    static var previews: some View {
        LocationItem(name: "Colosseum", cityname: "Rome", imageNames: "rome-trevifountain-1")
        
    }
}
