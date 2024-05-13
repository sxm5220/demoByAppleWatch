//
//  RefreshableView.swift
//  d1 Watch App
//
//  Created by 宋晓明 on 2024/5/13.
//

import SwiftUI

struct RefreshableView: View {
    @StateObject var jokeService = JokeService()
    
    var body: some View {
        List {
            Text(jokeService.joke)
                .lineLimit(nil)
                .lineSpacing(5.0)
                .padding()
                .font(.title)
            Text("Pull to refresh")
                .font(.title2)
                .listRowSeparator(.hidden)
        }
        .task {
            try? await jokeService.fetchJoke()
        }
        .refreshable {
            try? await jokeService.fetchJoke()
        }
    }
}

#Preview {
    RefreshableView()
}
