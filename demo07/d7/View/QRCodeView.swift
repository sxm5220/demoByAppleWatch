//
//  QRCodeView.swift
//  d7
//
//  Created by 宋晓明 on 2024/5/8.
//

import SwiftUI

struct QRCodeView: View {
    
    let movie: Movie
    
    var body: some View {
        GeometryReader { reader in
            if let image = QRCode.generate(movie: movie, size: reader.size) {
                Image(uiImage: image)
            }else{
                Image(systemName: "xmark.circle")
            }
        }
    }
}

#Preview {
    QRCodeView(movie: Movie.forPreview())
        .frame(width: 200,height: 200)
}
