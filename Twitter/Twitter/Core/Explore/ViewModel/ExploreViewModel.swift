//
//  ExploreViewModel.swift
//  Twitter
//
//  Created by Andrei Mareși on 19.06.2022.
//

import Foundation
 
class ExploreViewModel: ObservableObject {
    
    @Published var users = [User]()
    let service = UserService()
    
    init() {
        fetchUsers()
    }
    func fetchUsers() {
        service.fetchUsers { users in
            self.users = users
            print("DEBUG: users are: \(users)")
            
        }
    }
}
