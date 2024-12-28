//
//  HomeScreen .swift
//  testapp
//
//  Created by Orangeodc1 on 25/12/2024.
//

import SwiftUI

struct HomeScreen_: View {
    var body: some View {
        TabView{ 
            LocationListView()
                .tabItem{Label("Locations",systemImage: "list.dash")}
            
            FullMap()
                .tabItem{Label("Map",systemImage: "map")}
        }
        
    }
}
#Preview {
    HomeScreen_()
}

