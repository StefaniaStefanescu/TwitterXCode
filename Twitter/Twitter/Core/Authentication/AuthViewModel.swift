//
//  AuthViewModel.swift
//  Twitter
//
//  Created by Andrei Mareși on 17.06.2022.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var didAuthuser = false
    
    init(){
        
        self.userSession = Auth.auth().currentUser //daca am un user logat, stochez sesiunea user-ului in variabila
        
        print("DEBUG: User session is \(self.userSession?.uid)")
    }
    func login(withEmail email: String, password: String){
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: failed to login user with error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user     //nu ma lasa sa pun poza de profil 
            
            print("DEBUG: login with email \(email)")
            
        }
    }
    
    func register(withEmail email:String, password: String, fullname: String, username: String){
        
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: failed to register user with error \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else { return }
            //self.userSession = user
            
            print("DEBUG: register user succeded!")
            //print("DEBUG: user is \(self.userSession) ")
            
            //key value store
            let data = ["email": email, "username": username.lowercased(), "fullname" : fullname, "uid": user.uid]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { _ in
                    self.didAuthuser = true
                }
            
        }
    }
    
    func signOut() {
        userSession = nil
        try? Auth.auth().signOut()
    }
    
}
