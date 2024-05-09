//
//  d8App.swift
//  d8 Watch App
//
//  Created by 宋晓明 on 2024/5/9.
//

import SwiftUI

@main
struct d8_Watch_AppApp: App {
    // swiftlint:disable weak_delegate
    @WKExtensionDelegateAdaptor(ExtensionDelegate.self)
    private var extensionDelegate
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
              ContentView()
            }
            .environmentObject(Season.shared)
        }
    }
}
