//
//  SideMenuView.swift
//  Twitter
//
//  Created by Andrei Mareși on 16.06.2022.
//

import SwiftUI

struct SideMenuView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 32){
                VStack(alignment: .leading) {
                    Circle()
                        .frame(width: 48, height: 48)
                    VStack(alignment: .leading,spacing: 4){
                        Text("Nia Stefanescu")
                            .font(.headline)
                        Text("@nia")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    UserStatsView()
                        .padding(.vertical)
                }
                .padding(.leading)
            
            //profile opt list
            ForEach(SideMenuViewModel.allCases, id: \.rawValue){
                viewModel in
                if viewModel == .profile {
                    NavigationLink {
                        ProfileView()
                    } label: {
                        SideMOptionRowView(viewModel: viewModel)
                    }
                } else if viewModel == .logout {
                    Button {
                        print("Trebuie facut logout-ul")
                    } label:{
                        SideMOptionRowView(viewModel: viewModel)
                    }
                }else {
                    SideMOptionRowView(viewModel: viewModel)
                }
            
                
            }
            //.padding(.vertical,4)
            
            Spacer()
        }
        
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}


