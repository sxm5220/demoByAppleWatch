//
//  d3.swift
//  demo07 Watch App
//
//  Created by 宋晓明 on 2025/9/29.
//

import SwiftUI

struct d3: View {
    @AppStorage("lineCount") var lineCount: Int = 1
    @State private var notes: [D3NoteModel] = [D3NoteModel]()
    @State private var text: String = ""
    
    func getDocumentDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    
    func save() {
        do {
           let data = try JSONEncoder().encode(notes)
            let url = getDocumentDirectory().appendingPathComponent("notes")
            try data.write(to: url)
        } catch {
            print("Saving data has failed!!")
        }
    }
    
    func load() {
        DispatchQueue.main.async {
            do{
                let url = getDocumentDirectory().appendingPathComponent("notes")
                let data = try Data(contentsOf: url)
                notes = try JSONDecoder().decode([D3NoteModel].self, from: data)
            }catch{
                print("load data has failed!!")
            }
        }
    }
    
    func delete(offset: IndexSet) {
        withAnimation {
            notes.remove(atOffsets: offset)
            save()
        }
    }
    
    var body: some View {
        VStack {
            HStack(alignment: .center,spacing: 6) {
                TextField("Add New Note",text: $text)
                Button {
                    guard text.isEmpty == false else { return }
                    let note = D3NoteModel(id: UUID(), text: text)
                    notes.append(note)
                    text = ""
                    save()
                } label: {
                    Image(systemName: "plus.circle")
                        .font(.system(size: 42,weight: .semibold))
                }
                .fixedSize()
                .buttonStyle(.plain)
                .foregroundColor(.accentColor)
            }
            
            Spacer()
            if notes.count >= 1 {
                List {
                    ForEach(0..<notes.count,id: \.self) { i in
                        NavigationLink(destination: D3DetailView(note: notes[i], count: notes.count, index: i)) {
                            HStack {
                                Capsule()
                                    .frame(width: 4)
                                    .foregroundColor(.accentColor)
                                Text(notes[i].text)
                                    .lineLimit(lineCount)
                                    .padding(.leading,5)
                            }
                        }
                    }
                    .onDelete(perform: delete)
                }
            }else{
                Spacer()
                Image(systemName: "note.text")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
                    .opacity(0.3)
                    .padding(25)
                Spacer()
            }
        }
        .navigationTitle("Notes")
        .onAppear{
            load()
        }
    }
}

#Preview {
    d3()
}
