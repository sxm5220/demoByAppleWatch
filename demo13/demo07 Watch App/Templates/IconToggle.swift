//
//  IconToggle.swift
//  demo07 Watch App
//
//  Created by 宋晓明 on 2025/9/26.
//

import SwiftUI

struct IconToggle: View {
    @State var isEnabled = true
    var title: String = "Title"
    var icon: String = "Icon"
    
    var body: some View {
        Toggle(isOn: $isEnabled) {
            HStack {
                if icon.contains("com.") {
                    if let icon = UIImage.icon(forBundleID: icon) {
                        Image(uiImage: icon)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 20)
                    }
                } else {
                    Image(icon)
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(height: 20)
                }
                
                Text(title)
            }
        }
    }
}

#Preview {
    IconToggle()
}
