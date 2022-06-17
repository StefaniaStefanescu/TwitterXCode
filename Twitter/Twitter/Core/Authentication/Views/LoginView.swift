//
//  LoginView.swift
//  Twitter
//
//  Created by Andrei Mareși on 16.06.2022.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    var body: some View {
        //parent cont
        VStack{
            //header
            VStack(alignment: .leading){
                HStack { Spacer() } //sau Zstack
                Text("Hello.")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                Text("Welcome back")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                
            }
            .frame(height: 260)
            .padding(.leading)
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(RoundedShape(corners: [.bottomRight]))
            
            //text fields
            VStack(spacing: 40) {
                CustomImputField(image: "envelope", placeholderText: "Email", text: $email)
                CustomImputField(image: "lock", placeholderText: "Password", text: $email)
            }
            .padding(.horizontal,32)
            .padding(.top,44)
            
            HStack{
                Spacer()
                NavigationLink {
                    Text("Reset password...")
                } label:{
                    Text("Forgot password?")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.systemBlue))
                        .padding(.top)
                        .padding(.trailing,24)
                    
                }
            }
            Button{
                print("pressed")
            }label:{
                Text("Sign in")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
                    .padding()
            }
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            
            
            
            Spacer()
            NavigationLink{
                RegisterView()
                    .navigationBarHidden(true)
                
            } label: {
                HStack{
                    Text("You don't have an account yet?")
                        .font(.footnote)
                    Text("Sign Up")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }
            .padding(.bottom,32)
            .foregroundColor(Color(.systemBlue))
            
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}



//2h13
