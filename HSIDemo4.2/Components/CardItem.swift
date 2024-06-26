//
//  CardItem.swift
//  HSIDemo4.2
//
//  Created by Magtibay , Leo Jacinto  Malaluan on 6/26/24.
//

import SwiftUI

struct CardItem: View {
    var namespace: Namespace.ID
    @Binding var show: Bool
    var card: Card = cards[0]
    
    var body: some View {
        VStack {
            Spacer()
            VStack(alignment: .leading, spacing: 12) {
                Text(card.title)
                    .font(.largeTitle.weight(.bold))
                    .matchedGeometryEffect(id: "title\(card.id)", in: namespace)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(card.subtitle.uppercased())
                    .font(.footnote.weight(.semibold))
                    .matchedGeometryEffect(id: "subtitle\(card.id)", in: namespace)
                Text(card.text)
                    .lineLimit(1)
                    .font(.footnote)
                    .matchedGeometryEffect(id: "text\(card.id)", in: namespace)
            }
            .padding(20)
            .background(
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .blur(radius: 30)
                    .matchedGeometryEffect(id: "blur\(card.id)", in: namespace)
            )
        }
        .foregroundStyle(.white)
        /*
        .background(
            Image(card.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .matchedGeometryEffect(id: "image\(card.id)", in: namespace)
        )*/
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
        .frame(height: 300)
        .padding(20)
    }
}


struct CardItem_Previews: PreviewProvider {
    @Namespace static var namespace

    static var previews: some View {
        CardItem(namespace: namespace, show: .constant(true))
    }
}
