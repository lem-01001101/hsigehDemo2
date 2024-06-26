//
//  Tab.swift
//  HSIDemo4.2
//
//  Created by Magtibay , Leo Jacinto  Malaluan on 6/26/24.
//

import SwiftUI

struct TabItem: Identifiable {
    var id = UUID()
    var text: String
    var icon: String
    var tab: Tab
    var color: Color
}

var tabItems = [
    TabItem(text: "Platform", icon: "house", tab: .home, color: .teal),
    TabItem(text: "Mission", icon: "heart.rectangle", tab: .mission, color: .blue),
    //TabItem(text: "Notifications", icon: "bell", tab: .notifications, color: .red),
    //TabItem(text: "Library", icon: "rectangle.stack", tab: .library, color: .pink)
]

enum Tab: String {
    case home
    case mission
    //case notifications
    //case library
}

struct TabPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat){
        value = nextValue()
    }
}
