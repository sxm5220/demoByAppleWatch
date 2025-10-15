//
//  D3CreditsView.swift
//  demo07 Watch App
//
//  Created by 宋晓明 on 2025/9/29.
//

import SwiftUI

struct D3CreditsView: View {
    @State private var randomImageNumber: Int = Int.random(in: 1..<4)
    
    private var randomImage: String {
        return "developer-no\(randomImageNumber)"
    }
    
    var body: some View {
        VStack(spacing: 5) {
            Image(randomImage)
                .resizable()
                .scaledToFit()
                .layoutPriority(1)
            
            D3HeaderView(title: "Credits")
            Text("By Symon")
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
    D3CreditsView()
}
