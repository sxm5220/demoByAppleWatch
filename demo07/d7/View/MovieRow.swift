//
//  MovieRow.swift
//  d7
//
//  Created by 宋晓明 on 2024/5/8.
//

import SwiftUI

struct MovieRow: View {
    
    let movie: Movie
    
    var body: some View {
        HStack(alignment: .top) {
            Image(movie.poster)
                .resizable()
                .scaledToFit()
                .frame(width: 70)
            
            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.headline)
                    .foregroundColor(.white)
                
                Text(movie.synopsis)
                    .font(.caption)
                    .foregroundColor(.white)
                    .lineLimit(5)
            }
        }
    }
}

#Preview {
    List {
        MovieRow(movie: Movie.forPreview())
            .listRowBackground(Color.blue)
    }
}
