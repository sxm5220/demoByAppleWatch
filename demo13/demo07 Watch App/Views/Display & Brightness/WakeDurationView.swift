//
//  WakeDurationView.swift
//  demo07 Watch App
//
//  Created by 宋晓明 on 2025/9/26.
//

import SwiftUI

struct WakeDurationView: View {
    // Variables
    @State private var onTapOption = "Wake for 15 Seconds"
    let options = ["Wake for 15 Seconds", "Wake for 70 Seconds"]
    
    var body: some View {
        List {
            Section(content: {
                ForEach(options, id: \.self) { option in
                    Button(action: {
                        onTapOption = option
                    }, label: {
                        HStack {
                            Text(option)
                            Spacer()
                            Image(systemName: "\(onTapOption == option ? "checkmark" : "")")
                                .foregroundStyle(.green)
                        }
                    })
                }
            }, header: {
                Text("On Tap")
            }, footer: {
                Text("Choose how long the Apple Watch display stays on when you tap to wake it.")
            })
        }
        .navigationTitle("Wake Duration")
    }
}

#Preview {
    WakeDurationView()
}
