//
//  CustomImputField.swift
//  Twitter
//
//  Created by Andrei Mareși on 16.06.2022.
//

import SwiftUI

struct CustomImputField: View {
    let image: String
    let placeholderText: String
    @Binding var text: String
    var body: some View {
        VStack{
            HStack {
                Image(systemName: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(.darkGray))
                
                TextField(placeholderText, text: $text)
            
            }
            Divider()
                .background(Color(.darkGray))
        }
    }
}

struct CustomImputField_Previews: PreviewProvider {
    static var previews: some View {
        CustomImputField(image: "envelope", placeholderText: "Email", text: .constant(""))
    }
}
