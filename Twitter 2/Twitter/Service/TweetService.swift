//
//  TweetService.swift
//  Twitter
//
//  Created by Andrei Mareși on 20.06.2022.
//

import Firebase
import FirebaseStorage
import FirebaseFirestore

struct TweetService{
    
    func uploadTweet(caption: String, completion: @escaping(Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let data = ["uid":uid, "caption": caption, "likes": 0, "timestamp": Timestamp(date: Date())] as [String: Any]
        
        
        Firestore.firestore().collection("tweets").document()
            .setData(data) { error in
                if let error = error {
                    print("DEBUG: failed to upload tweet with error: \(error.localizedDescription)")
                    completion(false)
                    return
                }
                completion(true)
            }
        
        
    }
    
    func fetchTweets(completion: @escaping([Tweet]) -> Void){
        Firestore.firestore().collection("tweets").order(by: "timestamp", descending: true).getDocuments { snapshot , error in
            guard let documents = snapshot?.documents else { return }
            
            let tweets = documents.compactMap({ try? $0.data(as: Tweet.self) })
            completion(tweets)
            //documents.forEach { doc in
                //print(doc.data())
                
            //}
        }
    }
    
    func fetchTweets(forUid uid: String, completion: @escaping([Tweet]) -> Void){
        Firestore.firestore().collection("tweets").whereField("uid", isEqualTo: uid).getDocuments { snapshot , error in
            guard let documents = snapshot?.documents else { return }
            let tweets = documents.compactMap({ try? $0.data(as: Tweet.self) })
            completion(tweets.sorted(by: { $0.timestamp.dateValue() > $1.timestamp.dateValue() } ))
            //documents.forEach { doc in
                //print(doc.data())
                
            //}
        }
    }
}
