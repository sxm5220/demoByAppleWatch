//
//  Movie.swift
//  d7
//
//  Created by 宋晓明 on 2024/5/8.
//

import SwiftUI

struct Movie: Identifiable, Equatable {
    let id: Int
    let time: String
    let title: String
    let synopsis: String
    let poster: String
    let director: String
    let actors: String
    
    static func == (lhs: Movie, rhs: Movie) -> Bool {
        return lhs.id == rhs.id
    }
    
    static func forPreview() -> Self {
        .init(
            id: 23523,
            time: "3:00 PM",
            title: "Africa Screams",
            synopsis: """
        Basic crazy Abbott and Costello movie that also features \
        a couple of the three stooges. Black & White.
        """,
            poster: "africa_screams",
            director: "Charles Barton",
            actors: "Bud Abbot, Lou Costello")
    }
    
#if os(watchOS)
    func qrCodeImage() -> Image? {
        let path = QRCode.url(for: id).path
        if let image = UIImage(contentsOfFile: path) {
            return Image(uiImage: image)
        } else {
            return Image(systemName: "xmark.circle")
        }
    }
#endif
}

extension Movie: Decodable {
    private enum CodingKeys: String, CodingKey {
        case id, title, director, actors, synopsis, poster, hour
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try values.decode(Int.self, forKey: .id)
        title = try values.decode(String.self, forKey: .title)
        synopsis = try values.decode(String.self, forKey: .synopsis)
        poster = try values.decode(String.self, forKey: .poster)
        director = try values.decode(String.self, forKey: .director)
        
        let names = try values.decode([String].self, forKey: .actors)
        actors = names.joined(separator: ", ")
        
        let hour = try values.decode(Int.self, forKey: .hour)
        
        let date = Calendar.current.date(from: .init(hour: hour)) ?? Date()
        time = date.formatted(.dateTime.hour().minute())
    }
}

extension Movie: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
