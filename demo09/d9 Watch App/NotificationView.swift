//
//  NotificationView.swift
//  d9 Watch App
//
//  Created by 宋晓明 on 2024/5/9.
//

import SwiftUI

struct NotificationView: View {
    let message: String
    let image: Image
    
    var body: some View {
        ScrollView {
            Text(message)
                .font(.headline)
            
            image
                .resizable()
                .scaledToFit()
        }
    }
}

#Preview {
    NotificationView(message: "Awww",
                     image: Image("cat\(Int.random(in: 1...20))"))
}
