//
//  ContentView.swift
//  d2 Watch App
//
//  Created by 宋晓明 on 2024/4/28.
//

import SwiftUI

//Identifiable是一个协议，用于标识类型的实例，协议要求该类型具有一个名为 id 的属性，用于唯一标识该实例
struct feed: Identifiable {
    var id = UUID()
    var name: String
    var header: String
    var postImg: String
    var location: String
}

var Feeds = [feed(name: "Han meimei",header:"head1", postImg: "post1", location: "Beijing"),
             feed(name: "Li lei",header:"head2", postImg: "post2", location: "Beijing"),
             feed(name: "Li bai",header:"head3", postImg: "post3", location: "Beijing"),
             feed(name: "Wang li",header:"head4", postImg: "post4", location: "Beijing")]

struct PostUI: View {
    @State var postData: feed
    @State var isLike = false
    @State var isLikeScale = CGFloat(0.5)
    
    var body: some View {
        VStack(spacing: 10){
            Spacer()
            HStack(spacing: 10){
                Image(postData.header)
                    .resizable()
                    .frame(width: 35,height: 35)
                    .cornerRadius(35 * 0.5)
                
                VStack(alignment: .leading){
                    Text(postData.name)
                        .foregroundColor(.white)
                        .font(.caption)
                        .fontWeight(.bold)
                    
                    Text(postData.location)
                        .foregroundColor(.gray)
                        .font(.system(size: 13))
                }
                Spacer()
            }
            let screenSize = WKInterfaceDevice.current()
            Image(postData.postImg)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height:screenSize.screenBounds.width / 2.0)
                .clipped()
            HStack(alignment: .center, spacing: 30){
                
                Image(systemName: isLike ? "heart.fill" : "heart")
                    .font(.title)
                    .foregroundColor(isLike ? Color.red : Color.white)
                    .scaleEffect(isLikeScale)
                    .onTapGesture {
                        isLikeScale = 0.8
                        withAnimation(.easeInOut){
                            isLikeScale = 0.5
                            isLike.toggle()
                        }
                    }
                
                Image(systemName: "text.bubble")
                    .font(.title3)
                
                Image(systemName: "paperplane")
                    .font(.title3)
            }
            Spacer()
        }
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack{
                ScrollView{
                    ForEach(Feeds) { feed in
                        PostUI(postData: feed)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
