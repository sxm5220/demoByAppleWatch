//
//  AppView.swift
//  demo07 Watch App
//
//  Created by 宋晓明 on 2025/9/26.
//

import SwiftUI

struct AppView: View {
    // Variables
    @State private var selected = "Grid View"
    let options = ["Grid View", "List View"]
    
    var body: some View {
        List {
            ForEach(options,id: \.self) { option in
                Button {
                    selected = option
                } label: {
                    HStack {
                        Label(option, systemImage: option == "Grid View" ? "circle.hexagongrid.fill" : "list.bullet")
                        Spacer()
                        Image(systemName: "\(selected == option ? "checkmark" : "")")
                            .foregroundStyle(.green)
                    }
                }

            }
        }
        .navigationTitle("App View")
    }
}

#Preview {
    AppView()
}
