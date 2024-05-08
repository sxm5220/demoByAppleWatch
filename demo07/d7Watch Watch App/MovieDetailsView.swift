//
//  MovieDetailsView.swift
//  d7Watch Watch App
//
//  Created by 宋晓明 on 2024/5/8.
//

import SwiftUI

struct MovieDetailsView: View {
    let movie: Movie
    
    @ObservedObject private var ticketOffice = TicketOffice.shared
    
    var body: some View {
        ScrollView {
            MovieInfoView(movie: movie)
            
            if !ticketOffice.isPurchased(movie) {
                PurchaseTicketView(movie: movie)
            } else {
                movie.qrCodeImage()
            }
        }
    }
}

#Preview {
    MovieDetailsView(movie: Movie.forPreview())
}
