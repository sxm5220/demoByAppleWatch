//
//  SpriteView.swift
//  d6 Watch App
//
//  Created by 宋晓明 on 2024/5/8.
//

import SwiftUI
import SpriteKit

struct SpriteDemoView: View {
    @State private var crownPosition = 0.0
    
    var body: some View {
        GeometryReader{ reader in
            SpriteView(scene: PongScene(size: reader.size, crownPosition: $crownPosition))
                .focusable()
                .digitalCrownRotation($crownPosition)
        }
    }
}

#Preview {
    SpriteDemoView()
}
