//
//  HexagonView.swift
//  HSIDemo4.2
//
//  Created by Magtibay , Leo Jacinto  Malaluan on 6/26/24.
//

import SwiftUI

struct HexagonView: View {
    var body: some View {
        Canvas { context, size in
            context.draw(Text("DesignCode"), at: CGPoint(x:50, y:20))
            context.fill(Path(ellipseIn: CGRect(x: 0, y: 0, width: 100, height: 100)), with: .color(.pink))
            context.draw(Image("Blob 1"), in: CGRect(x: 0, y: 0, width: 200, height: 200))
            context.draw(Image(systemName: "hexagon.fill"), in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        }
        .frame(width: 200, height: 212)
        .foregroundStyle(.linearGradient(colors: [.pink, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

#Preview {
    HexagonView()
}
