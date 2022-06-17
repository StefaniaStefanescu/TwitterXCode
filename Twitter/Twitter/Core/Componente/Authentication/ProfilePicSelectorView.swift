//
//  ProfilePicSelectorView.swift
//  Twitter
//
//  Created by Andrei Mareși on 17.06.2022.
//

import SwiftUI

struct ProfilePicSelectorView: View {
    var body: some View {
        //Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        VStack{
            AuthHeaderView(big_title: "Creating account...", little_title: "Add a profile photo")
            Button {
                print("Pick image")
            } label: {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(Color(.systemBlue))
                    .scaledToFit()
                    .frame(width: 180, height: 180)
                    .padding(.top,44)
                    
            }

            Spacer()
        }
        .ignoresSafeArea()
    }
}

struct ProfilePicSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePicSelectorView()
    }
}
