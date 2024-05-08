//
//  d7App.swift
//  d7
//
//  Created by 宋晓明 on 2024/5/8.
//

import SwiftUI

@main
struct d7App: App {
    init() {
        UINavigationBar.appearance().barTintColor = UIColor.black
        UITableView.appearance().backgroundColor = UIColor.blue
        UITableViewCell.appearance().backgroundColor = UIColor.red
    }
    
    var body: some Scene {
        WindowGroup {
            PurchasedTicketsListView()
        }
    }
}
