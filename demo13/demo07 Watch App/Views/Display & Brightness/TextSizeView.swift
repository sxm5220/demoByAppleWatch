//
//  TextSizeView.swift
//  demo07 Watch App
//
//  Created by 宋晓明 on 2025/9/26.
//

import SwiftUI

struct TextSizeView: View {
    // Variables
    @State private var textSize = 2.0
    
    var body: some View {
        List {
            Section(content: {
                // TODO: Finalize Slider
                Slider(
                    value: $textSize,
                    in: 0...9,
                    step: 1
                ) {
                    Text("Text Size")
                } minimumValueLabel: {
                    Image(systemName: "textformat.size")
                } maximumValueLabel: {
                    Image(systemName: "textformat.size")
                }
                .tint(.green)
                .background(Color(.black).opacity(0.9))
                .padding(.horizontal, -10)
            }, footer: {
                Text("Apps that support Dyanmic Type will adjust to your preferred reading size.")
                    .foregroundStyle(.primary)
                    .font(.subheadline)
            })
        }
        .navigationTitle("Text Size")
    }
}

#Preview {
    TextSizeView()
}
