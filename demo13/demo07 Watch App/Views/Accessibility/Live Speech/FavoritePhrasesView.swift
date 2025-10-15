//
//  FavoritePhrasesView.swift
//  demo07 Watch App
//
//  Created by 宋晓明 on 2025/9/26.
//

import SwiftUI

struct FavoritePhrasesView: View {
    // Variables
    @State private var showingCreatePhrasesSheet = false
    
    var body: some View {
        List {
            Button("Add a phrase", action: { showingCreatePhrasesSheet.toggle() })
                .sheet(isPresented: $showingCreatePhrasesSheet, content: {
                    List {
                        Button("Create a phrase", action: {})
                            .toolbar {
                                ToolbarItem(placement: .topBarTrailing, content: {
                                    Button(action: { showingCreatePhrasesSheet.toggle() }, label: {
                                        Image(systemName: "checkmark")
                                            .foregroundStyle(.blue)
                                    })
                                })
                            }
                    }
                })
        }
        .navigationTitle("Favorite Phrases")
    }
}

#Preview {
    NavigationStack{
        FavoritePhrasesView()
    }
}
