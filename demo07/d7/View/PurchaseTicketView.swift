//
//  PurchaseTicketView.swift
//  d7
//
//  Created by 宋晓明 on 2024/5/8.
//

import SwiftUI

struct PurchaseTicketView: View {
    
    @State private var isPresented = false
    let movie: Movie
    
    var body: some View {
        if TicketOffice.shared.isPurchased(movie) {
            EmptyView()
        }else{
            Button {
                isPresented = true
            } label: {
                Image("purchase_tickets")
                    .resizable()
                    .scaledToFit()
            }
            .actionSheet(isPresented: $isPresented){
                ActionSheet(title: Text("Purchase Ticket"),message: Text("Are you sure you want to purchase 1 ticket for \(TicketOffice.shared.ticketCost)?"),buttons: [
                    .cancel(),
                    .default(Text("Buy"), action: {
                        TicketOffice.shared.purchase(movie)
                    })
                ])
            }
        }
    }
}

#Preview {
    PurchaseTicketView(movie: Movie.forPreview())
}
