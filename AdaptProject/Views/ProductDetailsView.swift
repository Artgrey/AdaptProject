//
//  ProductDetailsView.swift
//  AdaptProject
//
//  Created by Krivenkis on 2022-02-28.
//

import SwiftUI

struct ProductDetailsView: View {
    
    var product: Product
    
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                HStack(spacing: 5) {
                    ForEach(product.pictures, id: \.sortOrder) { picture in
                        AsyncImage(url: URL(string:picture.picture)) { image in
                           image.resizable()
                       } placeholder: {
                           Color.red
                       }
                       .clipped()
                       .frame(width: UIScreen.main.bounds.height/4, height: UIScreen.main.bounds.height/3)
                       .clipShape(RoundedRectangle(cornerRadius: 5))
                    }
                }
            }
            
            ScrollView {
                Text(product.description).foregroundColor(.gray)
            }

            Spacer()
            
            HStack {
                Text("Created at: \( product.createdAt.intToDate())")
                    .font(.system(size: 14))
                    .foregroundColor(Color.black)
              Spacer()
                Text("Price: \(product.price) \(product.currency)")
                    .font(.system(size: 14))
                    .foregroundColor(.white)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 30)
                    .background(RoundedRectangle(cornerRadius: 10).fill(.green))

            }
            
            Spacer()
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
    }
}
