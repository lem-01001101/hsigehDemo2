//
//  AccountView.swift
//  HSIDemo4.2
//
//  Created by Magtibay , Leo Jacinto  Malaluan on 6/26/24.
//

import SwiftUI
import SplineRuntime

struct AccountView: View {
    @State var isDeleted = false
    @State var isPinned = false
    
    var body: some View {
        /*
        let url = URL(string: "https://build.spline.design/n0hKmNcXQ8ekeVcCNWVu/scene.splineswift")!
        try? SplineView(sceneFileURL: url).ignoresSafeArea(.all)
        */
        
         NavigationStack {
            List {
                profile
                
                menu

                links
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Account")
         }
    }
    
    var profile: some View {
        VStack (spacing: 8) {
            Image(systemName: "person.crop.circle.fill.badge.checkmark")
                .symbolVariant(.circle.fill)
                .font(.system(size: 32))
                .symbolRenderingMode(.palette)
                .foregroundStyle(.blue, .blue.opacity(0.3))
                .padding()
                .background(Circle().fill(.ultraThinMaterial))
                .background(
                        //HexagonView()
                        //.offset(x:-50, y:-100)

                )
                .background(
                    //BlobView()
                )
            Text("Leo Magtibay")
                .font(.title.weight(.semibold))
            HStack {
                Image(systemName: "location")
                    .imageScale(.small)
                Text("Los Angeles")
                    .foregroundColor(.secondary)
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
    
    var menu: some View {
        Section {
            NavigationLink(destination: HomeView()) {
                    Label("Settings", systemImage: "gear")
            }
            NavigationLink { HomeView() } label: {
                Label("Billing", systemImage: "creditcard")
            }
            NavigationLink { HomeView() } label: {
                Label("Help", systemImage: "questionmark")
            }
        }
        .listRowSeparatorTint(.blue)
        .listRowSeparator(.hidden)
     
    }
    
    var links: some View {
        Section {
             if !isDeleted {
                Link(destination: /*@START_MENU_TOKEN@*/URL(string: "https://www.apple.com")!/*@END_MENU_TOKEN@*/) {
                     HStack {
                        Label("Website", systemImage: "house")
                         Spacer()
                         Image(systemName: "link")
                             .foregroundColor(.secondary)
                     }
                }
                .swipeActions (edge: .leading, allowsFullSwipe: false) {
                    Button(action: { isDeleted = true } ) {
                        Label("Delete", systemImage: "trash")
                    }
                    .tint(.red)
                    pinButton
                }
            }
            
            Link(destination: URL(string:"https://www.youtube.com")!) {
                 HStack {
                    Label("YouTube", systemImage: "tv")
                     Spacer()
                     Image(systemName: "link")
                         .foregroundColor(.secondary)
                 }
            }
            .swipeActions {
                pinButton
            }
       }
        .accentColor(.primary)
        .listRowSeparator(.hidden)
    }
    
    var pinButton: some View {
        Button { isPinned.toggle() } label: {
            if isPinned {
                Label("unpin", systemImage: "pin.slash")
            }
            else {
                Label("Pin", systemImage: "pin")
            }
        }
        .tint(isPinned ? .gray : .yellow)
    }
}

#Preview {
    AccountView()
}
