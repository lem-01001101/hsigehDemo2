//
//  TabBar.swift
//  HSIDemo4.2
//
//  Created by Magtibay , Leo Jacinto  Malaluan on 6/26/24.
//

import SwiftUI

struct TabBar: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    @State var color: Color = .teal
    @State var tabItemWidth: CGFloat = 0
    
    var body: some View {
        HStack {
          buttons
       }
        .padding(.horizontal, 8)
        .padding(.top, 14)
        .frame(height: 88, alignment: .top)
        .background(.ultraThinMaterial, in:
                      RoundedRectangle(cornerRadius: 34, style: .continuous))
        .background(
          background
        )
        .overlay(
          overlay
        )
        .strokeStyle(cornerRadius: 34)
        .frame(maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
    }
    
    var overlay: some View {
        HStack {
            if selectedTab == .mission { Spacer() }
            Rectangle()
                .fill(color)
                .frame(width: 28, height: 5)
                .cornerRadius(3)
                .frame(width: tabItemWidth)
                .frame(maxHeight: .infinity, alignment: .top)
            
            if selectedTab == .home { Spacer() }
 
        }
            .padding(.horizontal, 8)
    }
    
    var background: some View {
        HStack {
            if selectedTab == .mission { Spacer() }

            Circle().fill(color).frame(width: tabItemWidth)
            
            if selectedTab == .home { Spacer() }

        }
            .padding(.horizontal, 8)
    }
    
    var buttons: some View {
        ForEach(tabItems){ item in
              Button {
                  withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                      selectedTab = item.tab
                      color = item.color
                  }
              } label: {
                VStack (spacing: 0) {
                    Image(systemName: item.icon)
                        .symbolVariant(.fill)
                        .font(.body.bold())
                        .frame(width: 44, height: 29)
                    Text(item.text)
                        .font(.caption2)
                        .lineLimit(1)
                }
                .frame(maxWidth: .infinity)
            }
              .foregroundStyle(selectedTab == item.tab ? .primary : .secondary)
              .blendMode(selectedTab == item.tab ? .overlay : .normal)
              .overlay(
                  GeometryReader { proxy in
                      Color.clear.preference(key:
                                              TabPreferenceKey.self, value: proxy.size.width)
                  }
              )
              .onPreferenceChange(TabPreferenceKey.self) { value in
                 tabItemWidth = value
              }
        }
    }
}

#Preview {
    TabBar()
}
