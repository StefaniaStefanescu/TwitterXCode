//
//  TweetsRowView.swift
//  Twitter
//
//  Created by Andrei Mareși on 15.06.2022.
//

import SwiftUI
import Kingfisher

struct TweetsRowView: View {
    let tweet: Tweet
    
    var body: some View {
        VStack(alignment: .leading){
            
            //img de profil+ info user+tweet
            if let user = tweet.user
            {
                HStack(alignment: .top, spacing: 12){
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 56, height: 56)
                        .clipShape(Circle())
                        
                    //informatii user si tweet-uri
                    VStack(alignment: .leading, spacing: 4){
                        //user info
                       
                            HStack{
                                Text(user.fullname)
                                    .font(.subheadline).bold()
                                Text("@\(user.username)")
                                    .foregroundColor(.gray)
                                    .font(.caption)
                                Text("2d")
                                    .foregroundColor(.gray)
                                    .font(.caption)
                                
                            }
                        
                        Text(tweet.caption)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                        
                    }
                    
                    
                }
            }
            //action buttons
            HStack {
                Button{
                    
                } label:{
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                    
                }
                Spacer()   //sf symbols pt imagini
                Button{
                    
                } label:{
                    Image(systemName: "arrow.2.squarepath")
                        .font(.subheadline)
                    
                }
                Spacer()
                Button{
                    
                } label:{
                    Image(systemName: "heart")
                        .font(.subheadline)
                    
                }
                Spacer()
                Button{
                    
                } label:{
                    Image(systemName: "bookmark")
                        .font(.subheadline)
                    
                }
                
                .padding()
                .foregroundColor(.gray)
                //Divider()
                
                
            }
            .overlay(Divider().offset(x: 0 , y: 16))
            
            //.padding()
            
        }
    }
}

//struct TweetsRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        TweetsRowView()
//    }
//}
