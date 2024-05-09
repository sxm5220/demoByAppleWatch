//
//  ScheduleRow.swift
//  d8 Watch App
//
//  Created by 宋晓明 on 2024/5/9.
//

import SwiftUI

struct ScheduleRow: View {
    let match: Match
    var body: some View {
        HStack {
          Image(match.opponent.logoName)
            .resizable()
            .frame(maxWidth: 50)
            .scaledToFit()

          VStack(alignment: .leading) {
            Text(match.opponent.name)
              .font(.headline)
            Divider()
            Text(match.date.formatted(.dateTime.year().month().day()))
              .font(.subheadline)
            Text("\(match.date, style: .time)")
              .font(.subheadline)
          }
        }
    }
}

#Preview {
    ScheduleRow(match: Season.shared.nextMatch!)
}
