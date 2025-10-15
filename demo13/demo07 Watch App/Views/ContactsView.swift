//
//  ContactsView.swift
//  demo07 Watch App
//
//  Created by 宋晓明 on 2025/9/26.
//

import SwiftUI

struct ContactsView: View {
    var body: some View {
        List {
            NavigationLink("My Info"){
                List {
                    Text("**No Contacts**")
                        .frame(maxWidth: .infinity)
                        .listRowBackground(Color.clear)
                }
                .navigationTitle("Select My Info")
            }
        }
        .navigationTitle("Contacts")
    }
}

#Preview {
    NavigationStack{
        ContactsView()
    }
}
