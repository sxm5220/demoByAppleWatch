//
//  d2.swift
//  demo07 Watch App
//
//  Created by 宋晓明 on 2025/9/28.
//

import SwiftUI

struct d2: View {
    @ObservedObject var data = ReadData()
    var body: some View {
        TabView {
            Section {
                NavigationStack {
                    List(data.elements) { item in
                        NavigationLink {
                            ElementView(element:item)
                        } label: {
                            VStack(alignment: .leading) {
                                HStack {
                                    Text(item.symbol)
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .fontDesign(.rounded)
                                    
                                    Spacer()
                                    
                                    VStack(alignment: .trailing) {
                                        Text(item.name)
                                            .fontDesign(.rounded)
                                            .fontWeight(.semibold)
                                            .font(.subheadline)
                                        
                                        Text(String(item.atomicMass))
                                            .fontDesign(.rounded)
                                            .opacity(0.7)
                                            .font(.caption)
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }

                    }
                    .padding(.horizontal,5)
                }
            }
            .containerBackground(.mint.gradient, for: .tabView)
        }
        .navigationTitle("Periodic Table")
    }
}

#Preview {
    d2()
}
