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
    var isSelect: Bool
}

var superheros = [Superhero(name: "A", bgColor: Color.blue,isSelect: true),
                  Superhero(name: "B", bgColor: Color.green,isSelect: false),
                  Superhero(name: "C", bgColor: Color.red,isSelect: false),
                  Superhero(name: "D", bgColor: Color.yellow,isSelect: false),
                  Superhero(name: "E", bgColor: Color.cyan,isSelect: false)]

var watchOSControls = [
    Superhero(name: "wifi", bgColor: .blue,isSelect: false),
    Superhero(name: "iphone.radiowaves.left.and.right", bgColor: .gray.opacity(0.15),isSelect: false),
    Superhero(name: "battery.25", bgColor: .gray.opacity(0.15),isSelect: false),
    Superhero(name: "bell.slash.fill", bgColor: .red,isSelect: false),
    Superhero(name: "bed.double.fill", bgColor: .gray.opacity(0.15),isSelect: false),
    Superhero(name: "moon", bgColor: .purple,isSelect: false),
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
                    Button(action: {}, label: {
                        HStack{
                            Image(systemName: self.getIcon(superhero.isSelect))
                            Text(superhero.name)
                            .padding()
                        }
                     })
                    .frame(maxWidth: .infinity,maxHeight: .infinity)
                    .background(superhero.isSelect ? superhero.bgColor : Color.gray.opacity(0.3))
                    .cornerRadius(10)
                }
                .listRowBackground(Color.clear)
                
               /* LazyVGrid(columns: colums, spacing: 10){
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
                    .padding(.horizontal)*/
            }
        }
    }
    
    func getIcon(_ status: Bool) -> String {
        if status {
            return "checkmark.circle.fill"
        }
        return "circle"
    }
}

#Preview {
    ListView()
}
