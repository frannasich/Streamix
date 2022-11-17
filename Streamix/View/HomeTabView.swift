//
//  HomeTabView.swift
//  Streamix
//
//  Created by Francisco Tomas Nasich on 17/11/2022.
//

import SwiftUI

struct HomeTabView: View {
    
    enum Tab: Int {
        case movie
        case discover
    }
    
    @State private var selectedTab = Tab.movie
    
    var body: some View {
        TabView(selection: $selectedTab) {
            MoviesView().tabItem {
                Text("Movies")
                Image(systemName: "film")
            }
            DiscoverView().tabItem {
                Text("Discover")
                Image(systemName: "square.stack")
            }
        }
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
    }
}
