//
//  D3DetailView.swift
//  demo07 Watch App
//
//  Created by 宋晓明 on 2025/9/29.
//

import SwiftUI

struct D3DetailView: View {
    let note: D3NoteModel
    let count: Int
    let index: Int
    
    @State private var isCreditsPresented: Bool = false
    @State private var isSettingsPresented: Bool = false
    
    var body: some View {
        VStack(alignment: .center,spacing: 3){
            D3HeaderView(title: "")
            Spacer()
            ScrollView(.vertical,showsIndicators: false) {
                Text(note.text)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
            }
            Spacer()
            
            HStack(alignment: .center) {
                Image(systemName: "gear")
                    .imageScale(.large)
                    .onTapGesture {
                        isSettingsPresented.toggle()
                    }
                    .sheet(isPresented: $isSettingsPresented) {
                        D3SettingsView()
                    }
                Spacer()
                Text("\(count) / \(index+1)")
                Spacer()
                Image(systemName: "info.circle")
                    .imageScale(.large)
                    .onTapGesture {
                        isCreditsPresented.toggle()
                    }
                    .sheet(isPresented: $isCreditsPresented) {
                        D3CreditsView()
                    }
            }
            .foregroundColor(.secondary)
        }
        .padding(5)
    }
}

#Preview {
    D3DetailView(note: D3NoteModel(id: UUID(), text: "Hello world!"), count: 5, index: 1)
}
