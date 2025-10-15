//
//  D3SettingsView.swift
//  demo07 Watch App
//
//  Created by 宋晓明 on 2025/9/29.
//

import SwiftUI

struct D3SettingsView: View {
    @AppStorage("lineCount") var lineCount: Int = 1
    @State private var value: Float = 1.0
    
    func update() {
        lineCount = Int(value)
    }
    
    var body: some View {
        VStack(spacing: 10) {
            D3HeaderView(title: "Settings")
            Text("Lines:\(lineCount)".uppercased()).bold()
            
            Slider(value: Binding(get: {
                self.value
            }, set: { newValue in
                self.value = newValue
                self.update()
            }), in: 1...4,step: 1)
            .foregroundColor(.accentColor)
        }
    }
}

#Preview {
    D3SettingsView()
}
