//
//  ContentView.swift
//  d7
//
//  Created by 宋晓明 on 2024/5/8.
//

import SwiftUI

struct PurchasedTicketsListView: View {
    @ObservedObject private var ticketOffice = TicketOffice.shared
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(ticketOffice.purchased) { movie in
                    NavigationLink( value: movie) {
                        MovieRow(movie: movie)
                    }
                    .listRowBackground(Color.gray.opacity(0.4))
                }
                .onDelete(perform: delete)
                
                NavigationLink(value: "movie_list") {
                    Image("purchase_tickets")
                        .resizable()
                        .scaledToFit()
                        .padding()
                }
                .isDetailLink(false)
                .listRowBackground(Color.red)
                .padding(.top)
            }
            .navigationBarTitle("Purchased Tickets")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: Movie.self) { movie in
                MovieDetailsView(movie: movie)
            }
            .navigationDestination(for: String.self){ _ in
                MoviesListView()
            }
        }
    }
    
    private func delete(at offsets: IndexSet) {
        withAnimation {
            TicketOffice.shared.delete(at: offsets)
        }
    }
}

#Preview {
    PurchasedTicketsListView()
}
