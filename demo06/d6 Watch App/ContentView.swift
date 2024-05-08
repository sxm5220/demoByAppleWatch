//
//  ContentView.swift
//  d6 Watch App
//
//  Created by 宋晓明 on 2024/5/8.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var sentence = EmojiSentence()
    
    @State private var number = 4099882324234234512345.0
    
    var body: some View {
        VStack {
            Image("Cookie")
                .resizable()
                .scaledToFit()
                .overlay(
                    Text(sentence.emoji)
                        .font(.title3)
                        .padding(.top,10)
                        .buttonStyle(.plain)
                )
            
            Text(sentence.text)
                .font(.caption)
                .padding(.top,20)
            
            Text("\(number, specifier: "%.1f")")
                .focusable()
                .digitalCrownRotation(
                    $number,
                    from: 0.0,
                    through: 12.0,
                    by: 0.1,
                    sensitivity: .high,
                    isContinuous: true,
                    isHapticFeedbackEnabled: false
                )
        }
        .onTapGesture {
            sentence.next()
        }
    }
}

#Preview {
    ContentView()
}
