//
//  CardView.swift
//  HSIDemo4.2
//
//  Created by Magtibay , Leo Jacinto  Malaluan on 6/26/24.
//

import SwiftUI

struct CardView: View {
    var namespace: Namespace.ID
    @Binding var show: Bool
    var card: Card = cards[0]
    
    var body: some View {
        ZStack {
            ScrollView {
                cover
            }
            .background(Color("Background"))
            .ignoresSafeArea()
            
            Button {
                withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                    show.toggle()
                }
            } label:  {
                Image(systemName: "xmark")
                    .font(.body.weight(.bold))
                    .foregroundColor(.secondary)
                    .padding(8)
                    .background(.ultraThinMaterial, in: Circle())
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding(20)
            .ignoresSafeArea()
        }
    }
    
    var cover: some View {
        VStack {
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 500)
        .foregroundStyle(.black)
        .background(
            Image(card.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .matchedGeometryEffect(id: "image\(card.id)", in: namespace)
        )
        .background(
            Image(card.background)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: "background\(card.id)", in: namespace)
        )
        .mask(
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .matchedGeometryEffect(id: "mask\(card.id)", in: namespace)
        )
        .overlay(
            VStack(alignment: .leading, spacing: 12) {
                Text(card.title)
                    .font(.largeTitle.weight(.bold))
                    .matchedGeometryEffect(id: "title\(card.id)", in: namespace)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Divider()
                Text(card.subtitle.uppercased())
                    .font(.footnote.weight(.semibold))
                    .matchedGeometryEffect(id: "subtitle\(card.id)", in: namespace)
                Text(card.text)
                    .font(.footnote)
                    .matchedGeometryEffect(id: "text\(card.id)", in: namespace)

            }
                .padding(20)
                .background(
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                        .matchedGeometryEffect(id: "blur\(card.id)", in: namespace)
                )
                .offset(y: 250)
                .padding(20)
        )
    }
}

struct CourdView_Previews: PreviewProvider {
    @Namespace static var namespace

    static var previews: some View {
        CardView(namespace: namespace, show: .constant(true))
    }
}

