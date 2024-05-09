//
//  Team.swift
//  d8 Watch App
//
//  Created by 宋晓明 on 2024/5/9.
//

import Foundation
struct Team: Equatable {
  let name: String
  
  var logoName: String {
    return name.replacingOccurrences(of: " ", with: "-").lowercased()
  }
}
