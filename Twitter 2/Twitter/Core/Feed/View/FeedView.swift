//
//  FeedView.swift
//  Twitter
//
//  Created by Andrei Mareși on 15.06.2022.
//

import SwiftUI

struct FeedView: View {
    @State private var shownewtweetView = false
    @ObservedObject var viewModel = FeedViewModel()
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            ScrollView{
                LazyVStack{
                    ForEach(viewModel.tweets ) { tweet in
                        TweetsRowView(tweet: tweet)
                            .padding()
                    }
                }
            }
            //.navigationTitle("Home")
            //.navigationBarTitleDisplayMode(.inline)
            Button{
                shownewtweetView.toggle()
            } label: {
                Image(systemName: "pencil")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 28, height: 28)
                    .padding()
                   

            }
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            .fullScreenCover(isPresented: $shownewtweetView) {
                NewTweetView()
            }
            //.navigationTitle("Home")
            //.navigationBarTitleDisplayMode(.inline)
        }
       // .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
