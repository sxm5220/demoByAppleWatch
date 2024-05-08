//
//  MovieInfoView.swift
//  d7
//
//  Created by 宋晓明 on 2024/5/8.
//

import SwiftUI

struct MovieInfoView: View {
    let movie: Movie
    
    var body: some View {
        VStack(alignment: .leading,spacing: 8){
            Text(movie.title)
                .font(.headline)
                .foregroundColor(.white)
            
            Text("Time:\(movie.time)")
                .foregroundColor(.white)
            
            Text("Director:")
                .foregroundColor(.white)
            
            Text(movie.director)
                .foregroundColor(.white)
            
            Text("Actors:")
                .foregroundColor(.white)
            
            Text(movie.actors)
                .foregroundColor(.white)
        }
        .font(.subheadline)
    }
}

#Preview {
    MovieInfoView(movie: Movie.forPreview())
}
