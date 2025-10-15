//
//  ClearRow.swift
//  demo07 Watch App
//
//  Created by 宋晓明 on 2025/9/26.
//

import SwiftUI

struct ClearRow: View {
    var title: String = "Title"
    var subtitle: String = "Subtitle"
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
            Text(subtitle)
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .listRowBackground(Color.clear)
    }
}

#Preview {
    ClearRow()
}
