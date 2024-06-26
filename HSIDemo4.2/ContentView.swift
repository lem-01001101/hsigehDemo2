//
//  ContentView.swift
//  HSIDemo4.2
//
//  Created by Magtibay , Leo Jacinto  Malaluan on 6/26/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    
    var body: some View {
        ZStack(alignment: .bottom) {
                switch selectedTab {
                case .home:
                    HomeView()
                case .mission:
                    MissionViews()
                    //AccountView()
                    /*
                case .notifications:
                    AccountView()
                case .library:
                    AccountView()*/
                }
            
            TabBar()
         }
        .safeAreaInset(edge: .bottom, content: {
            Color.clear.frame(height: 44)
        })
    }
}

#Preview {
    ContentView()
}
