//
//  ContentView.swift
//  d9 Watch App
//
//  Created by 宋晓明 on 2024/5/9.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List(1..<21) { i in
          Image("cat\(i)")
            .resizable()
            .scaledToFit()
        }
        .listStyle(CarouselListStyle())
    }
}

#Preview {
    ContentView()
}
