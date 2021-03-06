//
//  ProfileView.swift
//  Twitter
//
//  Created by Andrei Mareși on 15.06.2022.
//

import SwiftUI

struct ProfileView: View {
    @State private var selectedOpt: TweetFilterViewModel = .tweets
    @Namespace var animation
    @Environment(\.presentationMode) var mode
    var body: some View {
        VStack(alignment: .leading) {
         headerView
         actionButtons
         userInfoDetail
         tweetFilterBar
         tweetsscrollview
            
         Spacer()
                
            
            
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
//iau componentele si le fac variabile sa nu am
//cod aglomerat
extension ProfileView{
    
    var headerView: some View {
        ZStack(alignment: .bottomLeading) {
            Color(.systemBlue)
                .ignoresSafeArea()
            VStack{
                Button{
                    mode.wrappedValue.dismiss()
                } label:{
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 16)
                        .foregroundColor(.white)
                        .offset(x:16, y:12)
                    
                }
             Circle()
                .frame(width: 72, height: 72)
                .offset(x:16,y:24)
             
             }
        }
        .frame(height: 96)
        
    }
    var actionButtons: some View {
        HStack(spacing: 12){
            Spacer()
            Image(systemName: "bell.badge")
                .font(.title3)
                .padding(6)
                .overlay(Circle().stroke(Color.gray,lineWidth: 0.75))
            Button{
                
            } label: {
                Text("Edit Profile")
                    .font(.subheadline).bold()
                    .frame(width: 120, height: 32)
                    .foregroundColor(.black)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 0.75))
            }
        }
        .padding(.trailing)
    }
    
    var userInfoDetail: some View {
        VStack(alignment: .leading, spacing: 4){
            HStack{
                 Text("Nia")
                    .font(.title2).bold()
                 Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(Color(.systemBlue))
                
            }
            Text("@unknown")
                .font(.subheadline)
                .foregroundColor(.gray)
            Text("i'm bored")
                .font(.subheadline)
                .padding(.vertical)
            
            HStack(spacing: 24) {
                HStack{
                    Image(systemName: "mappin.and.ellipse")
                    Text("Bucharest, Romania")
                    
                }
                //Spacer()
                HStack{
                    Image(systemName: "link")
                    Text("www.unknown.com")
                }
                
            }
            .font(.caption)
            .foregroundColor(.gray)
            UserStatsView()
            .padding(.vertical)
        }
        .padding(.horizontal)
    }
    
    var tweetFilterBar: some View{
        HStack{
            ForEach(TweetFilterViewModel.allCases, id: \.rawValue){
                item in
                VStack{
                    //boldare
                    Text(item.title)
                        .font(.subheadline)
                        .fontWeight(selectedOpt == item ? .semibold: .regular)
                        .foregroundColor(selectedOpt == item ? .black : .gray)
                    
                    if selectedOpt == item {
                        Capsule()
                            .foregroundColor(Color(.systemBlue))
                            .frame(height: 3)
                        
                    } else {
                        Capsule()
                            .foregroundColor(Color(.clear))
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "filter", in: animation)
                    }
                    
                }
                .onTapGesture{
                    withAnimation(.easeInOut){
                        self.selectedOpt=item
                    }
                }
            }
            
        }
        .overlay(Divider().offset(x: 0 , y: 16))
    }
    
    var tweetsscrollview: some View{
        
           ScrollView {
               LazyVStack {
                   ForEach(0 ... 9, id: \.self) { _ in
                       
                       TweetsRowView()
                           .padding()
                   }
               }
           }
    }
}
