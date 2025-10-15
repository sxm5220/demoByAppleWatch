//
//  ElementView.swift
//  demo07 Watch App
//
//  Created by 宋晓明 on 2025/9/28.
//

import SwiftUI

struct ElementView: View {
    var element: Element
    
    var body: some View {
        TabView {
            Section {
                ZStack {
                    AsyncImage(url: URL(string: element.image?.url as? String ?? "")) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .edgesIgnoringSafeArea(.all)//忽略安全区域，覆盖整个屏幕

                            } placeholder: {
                                ProgressView() // 加载时的占位视图
                            }
                    
                    VStack(alignment: .leading) {
                        HStack {
                            if element.phase == "Gas" {
                                Image(systemName: "wind")
                                    .opacity(0.7)
                            } else if element.phase == "Solid" {
                                Image(systemName: "cube")
                                    .opacity(0.7)
                            } else if element.phase == "Liquid" {
                                Image(systemName: "drop")
                                    .opacity(0.7)
                            }
                            
                            Text(element.phase)
                                .opacity(0.7)
                        }
                        Text(element.name)
                            .font(.title)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .fontDesign(.rounded)
                        HStack {
                            Text(element.symbol)
                                .fontDesign(.rounded)
                            Text("•")
                            Text(String(element.atomicMass))
                                .fontDesign(.rounded)
                            Text("(g/mol)")
                                .fontDesign(.rounded)
                        }
                        .font(.caption)
                        .opacity(0.7)
                    }
                    .containerBackground(.mint.gradient, for: .tabView)
                }
            }
            Section {
                List {
                    InfoView(title: "Name", value: element.name, unit: "", phase: element.phase)
                    InfoView(title: "Phase", value: element.phase, unit: "", phase: element.phase)
                    InfoView(title: "Category", value: element.category, unit: "", phase: element.phase)
                    InfoView(title: "Atomic Mass", value: String(element.atomicMass ), unit: "g/mol", phase: element.phase)
                    InfoView(title: "Boiling Point", value: String(element.boil ?? 0), unit: "ºF", phase: element.phase)
                    InfoView(title: "Density", value: String(element.density ?? 0), unit: "g/l", phase: element.phase)
                    InfoView(title: "Molar Heat", value: String(element.molar_heat ?? 0), unit: "mol x K", phase: element.phase)
                    InfoView(title: "Named By", value: element.namedBy ?? "", unit: "", phase: element.phase)
                    InfoView(title: "Number", value: String(element.number), unit: "", phase: element.phase)
                    InfoView(title: "Period", value: String(element.period), unit: "", phase: element.phase)
                    InfoView(title: "Group", value: String(element.group), unit: "", phase: element.phase)
                    InfoView(title: "Appearance", value: element.appearance ?? "", unit: "", phase: element.phase)
                    InfoView(title: "Summary", value: element.summary ?? "", unit: "", phase: element.phase)
                }
                .padding(.horizontal,5)
                .containerBackground(.mint.gradient, for: .tabView)
            }
        }
        .tabViewStyle(.verticalPage)
        .navigationTitle(element.name)
    }
}

#Preview {
    let item = ReadData().elements[0]
    ElementView(element: item)
}

struct InfoView: View {
    let title: String
    let value: String
    let unit: String
    let phase: String
    
    var body: some View {
        if value.isEmpty == false {
            VStack(alignment: .leading) {
                Text(title)
                    .opacity(0.7)
                HStack{
                    if (title == "Phase") {
                        if phase == "Gas" {
                            Image(systemName: "wind")
                                .opacity(0.7)
                        } else if phase == "Solid" {
                            Image(systemName: "cube")
                                .opacity(0.7)
                        } else if phase == "Liquid" {
                            Image(systemName: "drop")
                                .opacity(0.7)
                        }
                    }
                    Text(value)
                        .font(.title3)
                    if unit.isEmpty == false {
                        Text("(" + unit + ")")
                            .font(.title3)
                    }
                }
            }
        }
    }
}
