//
//  RemoteNotificationController.swift
//  d9 Watch App
//
//  Created by 宋晓明 on 2024/5/9.
//

import WatchKit
import SwiftUI
import UserNotifications

final class RemoteNotificationController: WKUserNotificationHostingController<RemoteNotificationView> {
  static let categoryIdentifier = "lorem"

  private var model: RemoteNotificationModel!

  override class var isInteractive: Bool { true}

  override var body: RemoteNotificationView {
    return RemoteNotificationView(model: model)
  }

  override func didReceive(_ notification: UNNotification) {
    let fmt = ISO8601DateFormatter()

    let content = notification.request.content
    let title = content.title
    let body = content.body

    guard
      let dateString = content.userInfo["date"] as? String,
      let date = fmt.date(from: dateString)
    else {
      model = RemoteNotificationModel(
        title: "Unknown",
        details: "Unknown",
        date: Date.now
      )

      return
    }

    model = RemoteNotificationModel(title: title, details: body, date: date)
  }
}

