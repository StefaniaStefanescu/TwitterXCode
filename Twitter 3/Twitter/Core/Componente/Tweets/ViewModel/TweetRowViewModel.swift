//
//  TweetRowViewModel.swift
//  Twitter
//
//  Created by Andrei Mareși on 20.06.2022.
//

import Foundation

class TweetRowViewModel: ObservableObject {
    
    
    @Published var tweet: Tweet
    private let service = TweetService()
    init(tweet: Tweet){
        self.tweet = tweet
        checkIfUserLikedTweet()
    }
    func likeTweet() {
        service.likeTweet(tweet) {
            self.tweet.didlike = true
        }
    }
    
    func unlikeTweet(){
        service.unlikeTweet(tweet) {
            self.tweet.didlike = false
        }
    }
    func checkIfUserLikedTweet(){
        service.checkIfUserLikedTweet(tweet) { didlike in
            if didlike {
                self.tweet.didlike = true
            }
        }
    }
}
