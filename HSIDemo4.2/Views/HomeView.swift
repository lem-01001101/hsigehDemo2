//
//  HomeView.swift
//  HSIDemo4.2
//
//  Created by Magtibay , Leo Jacinto  Malaluan on 6/26/24.
//

import SwiftUI

struct HomeView: View {
    @State var hasScrolled = false
    @Namespace var namespace
    @State var show = false
    @State var ShowStatusBar = true
    @State var selectedID = UUID()
    
    var body: some View {
         ZStack {
             //Color("Background").ignoresSafeArea()
             
             ScrollView {
                 
                scrollDetection
                 
                 if !show {
                     TabView {
                         ForEach(cards) { card in
                              GeometryReader { proxy in
                                  let minX = proxy.frame(in: .global).minX
                                  
                                 CardItem(namespace: namespace, show: $show, card: card)
                                      .onTapGesture {
                                          withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                                              show.toggle()
                                              ShowStatusBar = false
                                              selectedID = card.id
                                          }
                                      }
                                      .padding(.vertical, 40)
                                      .rotation3DEffect(.degrees(minX / -10), axis: (x:0 , y:1, z:0))
                                      .shadow(color: Color("Shadow").opacity(0.3) ,radius: 10, x: 0, y:10)
                                      .blur(radius: abs(minX / 40))
                                      .overlay(
                                          Image(card.image)
                                              .resizable()
                                              .aspectRatio(contentMode: .fit)
                                              .frame(height: 230)
                                              .offset(x: 32, y: -100)
                                              .offset(x: minX / 2)
                                      )
                             }
                             
                         }
                     }
                     .tabViewStyle(.page(indexDisplayMode: .never))
                     .frame(height: 430)
                     .background(Image("Blob 1").offset(x: 250, y: -100))
                 }
                 
                 VStack (spacing: 10) {
                     Text("Overview")
                         .font(.title)
                         .fontWeight(.semibold)
                         .offset(y: -10)
                     
                     Text("Our primary objective is to create a dynamic Virtual Immersive Platform. This platform serves as a digital twin, skillfully recreating the experience one can have in our physical facility and transferring it to a virtual space. In doing so, we aim to blur the boundaries between physical and virtual spaces. It is not merely a platform; it is a digital ecosystem, accessible to anyone, anywhere 24/7, providing access to our premier STEAHM programs.")
                 }
                 .padding()
                 .padding(.horizontal, 10)
                 .offset(y: -60)
                 
             }
             .coordinateSpace(name: "scroll")

             .safeAreaInset(edge: .top, content: {
                 Color.clear.frame(height: 70)
             })
             .overlay (
                 NavigationBar(title: "Virtual Platform", hasScrolled: $hasScrolled)
             )
             if show {
                 ForEach(cards) { card in
                     if card.id == selectedID {
                         CardView(namespace: namespace, show: $show, card: card)
                             .zIndex(1)
                     }
                     
                 }
             }
             
             
         }
         .statusBar(hidden: !ShowStatusBar)
         .onChange(of: show) { oldValue, newValue in
              withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                 ShowStatusBar = !newValue
             }
         }
    }
    
    var scrollDetection : some View {
        GeometryReader { proxy in
            //Text("\(proxy.frame(in: .named("scroll")).minY)")
            Color.clear.preference(key: ScrollPreferenceKey.self, value:
                                       proxy.frame(in: .named("scroll")).minY)
        }
        .frame(height: 0)
        .onPreferenceChange(ScrollPreferenceKey.self ,perform: { value in
            withAnimation(.easeInOut) {
                if value < 0 {
                    hasScrolled = true
                } else {
                    hasScrolled = false
                }
            }
            
            
        })
    }
    
    var featured: some View {
        TabView {
            ForEach(FeaturedCards) { card in
                GeometryReader { proxy in
                    let minX = proxy.frame(in: .global).minX
                    
                    FeaturedItem(card: card)
                        .padding(.vertical, 40)
                        .rotation3DEffect(.degrees(minX / -10), axis: (x:0 , y:1, z:0))
                        .shadow(color: Color("Shadow").opacity(0.3) ,radius: 10, x: 0, y:10)
                        .blur(radius: abs(minX / 40))
                        .overlay(
                            Image(card.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 230)
                                .offset(x: 32, y: -80)
                                .offset(x: minX / 2)
                        )
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: 430)
        .background(Image("Blob 1").offset(x: 250, y: -100))
    }
    
    var linearGradient: LinearGradient {
        LinearGradient(colors: [.clear,
                                .yellow.opacity(0.3), .clear],
                       startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}

#Preview {
    HomeView()
}
