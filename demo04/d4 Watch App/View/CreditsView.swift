//
//  CreditsView.swift
//  d4 Watch App
//
//  Created by 宋晓明 on 2024/4/29.
//

import SwiftUI

struct CreditsView: View {
    @State private var randomNumber: Int = Int.random(in: 1..<4)
    
    private var randomImage: String {
        return "developer-no\(randomNumber)"
    }
    
    var body: some View {
        VStack(spacing: 3) {
            
            Image(randomImage)
                .resizable()
                .scaledToFit()
                .layoutPriority(1)
                .cornerRadius(100)
            
            HeaderView(title: "Credits")
            
            Text("Robert Petras")
                .foregroundColor(.primary)
                .fontWeight(.bold)
            
            Text("Developer")
                .font(.footnote)
                .foregroundColor(.secondary)
                .fontWeight(.light)
        }
    }
}

#Preview {
    CreditsView()
}
