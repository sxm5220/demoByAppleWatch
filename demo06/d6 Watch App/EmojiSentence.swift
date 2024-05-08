//
//  EmojiSentence.swift
//  d6 Watch App
//
//  Created by 宋晓明 on 2024/5/8.
//

import SwiftUI

class EmojiSentence: ObservableObject {
    @Published var text = ""
    @Published var emoji = ""
    
    private var index = 0
    
    private let sentences = [
        (text: "Not my cup of tea", emoji: "🙅‍♀️ ☕️"),
        (text: "Talk to the hand", emoji: "🎙 ✋"),
        (text: "Not the brightest bulb", emoji: "🚫 😎 💡"),
        (text: "When pigs fly", emoji: "⏰ 🐷 ✈️"),
        (text: "Boy who cried wolf", emoji: "🚶😭🐺")
    ]
    
    init() {
        update()
    }
    
    func next() {
        index += 1
        if index == sentences.count {
            index = 0
        }
        update()
    }
    
    private func update() {
        text = sentences[index].text
        emoji = sentences[index].emoji
    }
}
