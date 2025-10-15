//
//  ClockSoundsView.swift
//  demo07 Watch App
//
//  Created by 宋晓明 on 2025/9/26.
//

import SwiftUI

struct ClockSoundsView: View {
    @AppStorage("ClockSound") private var selected = "Bells"
    let options = ["Bells", "Birds"]
    
    var body: some View {
        List {
            ForEach(options,id: \.self) { option in
                Button {
                    selected = option
                } label: {
                    HStack {
                        Text(option)
                        Spacer()
                        Image(systemName: "\(selected == option ? "checkmark" : "")")
                            .foregroundStyle(.green)
                    }
                }
            }
        }
        .navigationTitle("Sounds")
    }
}

#Preview {
    NavigationStack {
        ClockSoundsView()
    }
}
