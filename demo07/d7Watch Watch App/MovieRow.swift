//
//  MovieRow.swift
//  d7Watch Watch App
//
//  Created by 宋晓明 on 2024/5/9.
//

import SwiftUI

struct MovieRow: View {
    
    let movie: Movie
    
    var body: some View {
        Text(movie.title)
          .font(.subheadline)
          .foregroundColor(.white)
    }
}

#Preview {
    List {
        MovieRow(movie: Movie.forPreview())
            .listRowBackground(Color.blue)
    }
}
