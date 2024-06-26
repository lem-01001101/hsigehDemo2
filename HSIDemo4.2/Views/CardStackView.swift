//
//  CardStackView.swift
//  HSIDemo4.2
//
//  Created by Magtibay , Leo Jacinto  Malaluan on 6/26/24.
//

import SwiftUI

struct CardStackView: View {

    @State var hasScrolled = false
    @Namespace var namespace
    @State var show = false
    @State var ShowStatusBar = true
    
    var body: some View {

        ScrollView {
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
        }
        .coordinateSpace(name: "scroll")

        .safeAreaInset(edge: .top, content: {
            Color.clear.frame(height: 70)
        })
        .overlay (
            NavigationBar(title: "Virtual Platform", hasScrolled: $hasScrolled)
        )
        if show {
            CardView(namespace: namespace, show: $show)
        }
    }
    
    var cardStackView: some View {
        Text("aa")
    }

}

#Preview {
    CardStackView()
}
