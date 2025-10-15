//
//  RowLabel.swift
//  demo07 Watch App
//
//  Created by 宋晓明 on 2025/9/26.
//

import SwiftUI

struct RowLabel: View {
    var title: String
    var subtitle: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
            Text(subtitle)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    RowLabel(title: "This is title", subtitle: "This is subtitle.")
}
