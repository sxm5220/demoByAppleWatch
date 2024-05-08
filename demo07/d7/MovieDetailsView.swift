//
//  MovieDetailsView.swift
//  d7
//
//  Created by 宋晓明 on 2024/5/8.
//

import SwiftUI

struct MovieDetailsView: View {
    
    let movie: Movie
    
    @ObservedObject private var ticketOffice = TicketOffice.shared
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                Image(movie.poster)
                    .resizable()
                    .frame(width: 120,height: 200)
                    .scaledToFit()
                
                MovieInfoView(movie: movie)
            }
            Text(movie.synopsis)
                .font(.subheadline)
                .foregroundColor(.white)
            
            VStack(alignment: .center) {
                if ticketOffice.isPurchased(movie) {
                    QRCodeView(movie: movie)
                        .frame(width: 200,height: 200)
                        .padding(.top)
                    Spacer()
                }else{
                    Spacer()
                    PurchaseTicketView(movie: movie)
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
        }
        .padding()
        .background(Color.black)
        .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    MovieDetailsView(movie: Movie.forPreview())
}
