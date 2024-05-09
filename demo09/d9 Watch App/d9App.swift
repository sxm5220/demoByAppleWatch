//
//  d9App.swift
//  d9 Watch App
//
//  Created by 宋晓明 on 2024/5/9.
//

import SwiftUI

@main
struct d9_Watch_AppApp: App {
    @WKExtensionDelegateAdaptor(ExtensionDelegate.self)
    private var extensionDelegate

    private let local = LocalNotifications()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
              ContentView()
            }
        }
        
        WKNotificationScene(
          controller: NotificationController.self,
          category: LocalNotifications.categoryIdentifier
        )

        WKNotificationScene(
          controller: RemoteNotificationController.self,
          category: RemoteNotificationController.categoryIdentifier
        )
    }
}
