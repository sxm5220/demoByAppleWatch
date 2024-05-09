//
//  RecordView.swift
//  d8 Watch App
//
//  Created by 宋晓明 on 2024/5/9.
//

import SwiftUI

struct RecordView: View {
    @EnvironmentObject private var season: Season
    let snapshotHandler: (() -> Void)?

    var body: some View {
      List(season.pastMatches().reversed()) {
        RecordRow(match: $0)
      }
      .listStyle(.carousel)
      .navigationBarTitle("Scores")
      .task {
        snapshotHandler?()
      }
    }
}

#Preview {
    RecordView(snapshotHandler: nil)
}
