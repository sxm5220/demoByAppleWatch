//
//  ContentView.swift
//  d3 Watch App
//
//  Created by 宋晓明 on 2024/4/28.
//

import SwiftUI

struct Apple: Identifiable {
    var id: Int
    var app: String
}

struct ContentView: View {
    @State var WWDC: [Apple] = [
        Apple(id: 0, app: "iPad Pro"),
        Apple(id: 1, app: "iPhone 15"),
        Apple(id: 2, app: "SwiftUI"),
        Apple(id: 3, app: "iMac"),
        Apple(id: 4, app: "Watch"),
        Apple(id: 5, app: "WWDC24"),
        Apple(id: 6, app: "Other"),
    ]
    
    var columns = Array(repeating: GridItem(.flexible(),spacing: 10), count: 2)
    @Namespace var namespace
    @State var selected: [Apple] = []
    
    var body: some View {
        NavigationView{
            ScrollView{
                if !self.WWDC.isEmpty {
                    LazyVGrid(columns: columns, spacing: 10){
                        ForEach(self.WWDC){ apple in
                            Text(apple.app)
                                .font(.system(size: 12))
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .frame(width: 60,height: 60)
                                .background(Color.pink)
                                .cornerRadius(10)
                                .matchedGeometryEffect(id: apple.id, in: self.namespace)
                                .onTapGesture {
                                    self.selected.append(apple)
                                    self.WWDC.removeAll{(app) -> Bool in
                                        return app.id == apple.id
                                    }
                                }
                            
                        }
                    }.padding()
                }
                HStack{
                    Text("WWDC Selected")
                        .font(.system(size: 12,weight: .semibold))
                    Spacer()
                }.padding(.horizontal)
                LazyVGrid(columns: columns, spacing: 10){
                    ForEach(self.selected){ apple in
                        Text(apple.app)
                            .font(.system(size: 12))
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .frame(width: 60,height: 60)
                            .background(Color.purple)
                            .cornerRadius(10)
                            .matchedGeometryEffect(id: apple.id, in: self.namespace)
                            .onTapGesture {
                                self.WWDC.append(apple)
                                self.selected.removeAll{(app) -> Bool in
                                    return app.id == apple.id
                                }
                            }
                        
                    }
                }.padding(.all)
            }.navigationTitle("Welcome WWDC24")
        }.animation(.easeOut)
    }
}

#Preview {
    ContentView()
}
