//
//  TweetFilterViewModel.swift
//  Twitter
//
//  Created by Andrei Mareși on 16.06.2022.
//

import Foundation
enum TweetFilterViewModel: Int, CaseIterable{
    case tweets
    case replies
    case media
    case likes
    //case media
    
    var title: String{
        switch self{
            case .tweets: return "Tweets"
            case .replies: return "Replies"
            case .media: return "Media"
            case .likes: return "Likes"
            //case .media: return "Media"
        }
        
    }
}
