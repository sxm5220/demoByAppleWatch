//
//  ContentView.swift
//  d7Watch Watch App
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
                        Text(movie.title)
                            .font(.subheadline)
                            .foregroundColor(Color.black)
                    }
                    .listRowBackground(Color.gray.opacity(0.4))
                }
                
                NavigationLink(value: "movies_list") {
                  Image("purchase_tickets")
                    .resizable()
                    .scaledToFit()
                    .padding()
                }
            }
            .navigationBarTitle("Purchased Tickets")
            .navigationDestination(for: Movie.self) { movie in
              MovieDetailsView(movie: movie)
            }
            .navigationDestination(for: String.self) { _ in
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
