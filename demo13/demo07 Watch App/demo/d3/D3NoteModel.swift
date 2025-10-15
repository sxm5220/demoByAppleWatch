//
//  NoteModel.swift
//  demo07 Watch App
//
//  Created by 宋晓明 on 2025/9/29.
//

import Foundation

struct D3NoteModel: Codable, Identifiable {
    let id: UUID
    let text: String
}
