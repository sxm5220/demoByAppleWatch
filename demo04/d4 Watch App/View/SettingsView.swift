//
//  SettingsView.swift
//  d4 Watch App
//
//  Created by 宋晓明 on 2024/4/29.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("lineCount") var lineCount: Int = 1
    @State private var value: Float = 1.0
    
    func update() {
        lineCount = Int(value)
    }
    
    var body: some View {
        VStack(spacing: 8){
            HeaderView(title: "Settings")
            
            Text("Lines: \(lineCount)".uppercased())
                .fontWeight(.bold)
            
            Slider(value: Binding(get: {
                self.value
            }, set: { newValue in
                print("newValue::\(newValue)")
                if (newValue != 0) {
                    self.value = newValue
                    update()
                }
            }),in: 0...4,step: 1)
            .accentColor(.accentColor)
        }
        .onAppear(){
            self.value = Float(lineCount)
        }
    }
}

#Preview {
    SettingsView()
}
