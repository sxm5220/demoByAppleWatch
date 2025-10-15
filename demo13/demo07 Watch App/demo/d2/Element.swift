//
//  Element.swift
//  demo07 Watch App
//
//  Created by 宋晓明 on 2025/9/28.
//

import Foundation
import Combine

struct imageModel: Codable {
    enum CodingKeys: String, CodingKey {
            case title
            case url
            case attribution
        }
    
    var title: String
    var url: String
    var attribution: String
    
}

struct Element: Codable, Identifiable {
    enum CodingKeys: CodingKey {
        case name
        case appearance
        case atomicMass
        case boil
        case category
        case density
        case discoveredBy
        case melt
        case molar_heat
        case namedBy
        case number
        case period
        case group
        case phase
        case source
        case summary
        case symbol
        case shells
        case image
    }
    
    var id = UUID().uuidString
    var name: String
    var appearance: String?
    var atomicMass: Double
    var boil: Double?
    var category: String
    var density: Double?
    var discoveredBy: String?
    var melt: Double?
    var molar_heat: Double?
    var namedBy: String?
    var number: Int
    var period: Int
    var group: Int
    var phase: String
    var source: String?
    var summary: String?
    var symbol: String
    var shells: [Int]
    var image: imageModel?
}

class ReadData: ObservableObject {
    
    @Published var elements = [Element]()
    
    init(){
        loadData()
    }
    
    func loadData() {
        guard let url = Bundle.main.url(forResource: "elements", withExtension: "json") else { return }
        do {
           let data = try Data(contentsOf: url)
            let elements = try JSONDecoder().decode([Element].self, from: data)
            print("elements:\(elements)")
            self.elements = elements
        } catch {
            print("Failed to decode JSON: \(error)")
        }
    }
}
