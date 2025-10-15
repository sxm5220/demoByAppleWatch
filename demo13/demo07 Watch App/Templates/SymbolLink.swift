//
//  SymbolLink.swift
//  demo07 Watch App
//
//  Created by 宋晓明 on 2025/9/26.
//

import SwiftUI

struct SymbolLink<Content: View>: View {
    var title = "12:00 AM to 12:00 AM"
    var subtitle = ""
    var icon = "com.apple.application-icon.siri"
    var color = Color.blue
    var content: Content
    
    var body: some View {
        NavigationLink {
            content
        } label: {
            HStack(spacing: 5) {
                if icon.contains("com.apple.graphic") || icon.contains("com.apple.application") {
                    if let icon = UIImage.icon(forUTI: icon) {
                        Image(uiImage: icon)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 20)
                    }
                }else if icon.contains("com.") {
                    if let icon = UIImage.icon(forBundleID: icon) {
                        Image(uiImage: icon)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 20)
                    }
                } else if UIImage(systemName: icon) != nil {
                    Image(systemName: icon)
                        .foregroundStyle(color)
                } else {
                    Image(icon)
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(height: 17)
                }
                
                VStack(alignment: .leading) {
                    Text(.init(title))
                    if !subtitle.isEmpty {
                        Text(.init(subtitle))
                            .foregroundStyle(.secondary)
                    }
                }
            }
        }

    }
}

#Preview {
    SymbolLink(content: EmptyView())
}
