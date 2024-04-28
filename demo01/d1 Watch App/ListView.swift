//
//  ListView.swift
//  d1 Watch App
//
//  Created by 宋晓明 on 2024/4/28.
//

import SwiftUI

struct Superhero: Identifiable {
    var id = UUID()
    var name: String
    var bgColor: Color
}

var superheros = [Superhero(name: "A", bgColor: Color.blue),
                  Superhero(name: "B", bgColor: Color.green),
                  Superhero(name: "C", bgColor: Color.red),
                  Superhero(name: "D", bgColor: Color.yellow),
                  Superhero(name: "E", bgColor: Color.cyan)]

var watchOSControls = [
    Superhero(name: "wifi", bgColor: .blue),
    Superhero(name: "iphone.radiowaves.left.and.right", bgColor: .gray.opacity(0.15)),
    Superhero(name: "battery.25", bgColor: .gray.opacity(0.15)),
    Superhero(name: "bell.slash.fill", bgColor: .red),
    Superhero(name: "bed.double.fill", bgColor: .gray.opacity(0.15)),
    Superhero(name: "moon", bgColor: .purple),
]

let colums = [
    GridItem(.flexible()),
    GridItem(.flexible())
]

struct ListView: View {
    var body: some View {
        VStack{
            List{
                ForEach(superheros) { superhero in
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                     Text(superhero.name)
                     .padding()
                     })
                    .frame(maxWidth: .infinity,maxHeight: .infinity)
                    .background(superhero.bgColor)
                    .cornerRadius(10)
                }
                .listRowBackground(Color.clear)
                
                LazyVGrid(columns: colums, spacing: 10){
                    ForEach(watchOSControls) { item in
                        Image(systemName: item.name)
                            .font(.system(size: 25))
                            .padding([.top,.bottom],8)
                            .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .center)
                            .background(item.bgColor)
                            .cornerRadius(25)
                    }
                }.padding(.horizontal)
                   
                Text("Edit")
                    .font(.system(size: 25))
                    .padding([.top,.bottom],8)
                    .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .center)
                    .background(Color.gray.opacity(0.15))
                    .cornerRadius(25)
                    .padding(.horizontal)
            }
        }
    }
}

#Preview {
    ListView()
}
