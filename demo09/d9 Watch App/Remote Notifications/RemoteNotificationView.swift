//
//  RemoteNotificationView.swift
//  d9 Watch App
//
//  Created by 宋晓明 on 2024/5/9.
//

import SwiftUI

struct RemoteNotificationView: View {
    @State private var showDetails = false

    let model: RemoteNotificationModel

    var body: some View {
      ScrollView {
        Text(model.title)
          .font(.title2)

        Text(model.date, style: .date)
          .font(.caption2)

        if showDetails {
          Divider()
            .padding(.top)
          Text(model.details)
            .font(.body)
          Divider()
        }

        Toggle("Show details", isOn: $showDetails)
          .padding(.top)
      }
    }
}

#Preview {
    RemoteNotificationView(model: RemoteNotificationModel(
        title: "Lorem Ipsum",
        details: """
          Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do \
          eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim \
          ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut \
          aliquip ex ea commodo consequat. Duis aute irure dolor in \
          reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla \
          pariatur. Excepteur sint occaecat cupidatat non proident, sunt in \
          culpa qui officia deserunt mollit anim id est laborum.
          """,
        date: Date.now))
}
