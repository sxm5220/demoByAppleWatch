//
//  SiriHistoryView.swift
//  demo07 Watch App
//
//  Created by 宋晓明 on 2025/9/26.
//

import SwiftUI

struct SiriHistoryView: View {
    // Variables
    @State private var showingDeleteHistoryPrompt = false
    @State private var showingDeletedPrompt = false
    
    var body: some View {
        List {
            Section(content: {
                Button("Delete Siri History", action: { showingDeleteHistoryPrompt.toggle() })
                    .alert("Delete Siri & Dictation History", isPresented: $showingDeleteHistoryPrompt, actions: {
                        Button("Delete Siri History", role: .destructive, action: { showingDeletedPrompt.toggle() })
                        Button("Dismiss", role: .cancel, action: {})
                    }, message: {
                        Text("\nDelete Siri & Dictation interactions currently associated with this Apple Watch from Apple servers.")
                    })
                    .alert("Your Request Is Being Processed", isPresented: $showingDeletedPrompt, actions: {
                        Button("Dismiss", role: .none, action: {})
                    }, message: {
                        Text("Your Siri and Dictation history will be deleted.")
                    })
            }, footer: {
                Text("Delete Siri & Dictation interactions currently associated with this \nApple Watch from Apple servers.")
            })
        }
        .navigationTitle("Siri History")
    }
}

#Preview {
    NavigationStack{
        SiriHistoryView()
    }
}
