//
//  serviceMainView.swift
//  d1 Watch App
//
//  Created by 宋晓明 on 2024/5/13.
//

import SwiftUI

struct serviceMainView: View {
    @StateObject var jokeService = JokeService()
    var body: some View {
        ZStack {
            Text(jokeService.joke)
                .font(.title)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            VStack {
                Spacer()
                Button(action: {
                    Task {
                        try? await jokeService.fetchJoke()
                    }
                }) {
                    Text("Fetch a joke")
                        .padding(.bottom)
                        .opacity(jokeService.isFetching ? 0 : 1)
                        .overlay {
                            if jokeService.isFetching { ProgressView() }
                        }
                }
            }
        }
    }
}

#Preview {
    serviceMainView()
}
