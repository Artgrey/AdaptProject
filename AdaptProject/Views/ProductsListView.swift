//
//  ProductsListView.swift
//  AdaptProject
//
//  Created by Krivenkis on 2022-02-28.
//

import SwiftUI

struct ProductsListView: View {
    
    @StateObject private var productsListViewModel = ProductsListViewModel()
    @State private var productsPerPage = 10
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Products")
                    .font(.system(size: 24))
                List {
                    ForEach(0..<productsListViewModel.products.count, id: \.self) { i in
                        NavigationLink(destination: ProductDetailsView(product: productsListViewModel.products[i])) {
                            ProductRow(product: productsListViewModel.products[i])
                        }
                        .onAppear {
                            if i + 1 == productsPerPage && productsListViewModel.maxProductCount > productsListViewModel.products.count {
                                productsPerPage += 10
                                productsListViewModel.loadProductData(productsPerPage)
                            }
                        }
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct ProductRow : View {
    
  var product: Product
    
  var body: some View {
    HStack {
        AsyncImage(url: URL(string:product.pictures.first?.picture ?? "")) { image in
           image.resizable()
       } placeholder: {
           Color.red
       }
        .clipped()
        .frame(width: 60, height: 80)
        .clipShape(RoundedRectangle(cornerRadius: 5))
        
      VStack {
        
        Text(product.description)
              .foregroundColor(Color.black)
              .lineLimit(3)
              .frame(maxWidth: .infinity, alignment: .leading)

        HStack {
            Text("\(product.createdAt.intToDate())")
                .font(.system(size: 14))
                .foregroundColor(Color.gray)
          Spacer()
            Text("Price: \(product.price) \(product.currency)")
                .font(.system(size: 14))
                .foregroundColor(.white)
                .padding(.vertical, 5)
                .padding(.horizontal, 10)
                .background(RoundedRectangle(cornerRadius: 10).fill(.green))

        }
        Spacer()
      }
    }.padding()
  }
}

struct ProductsListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsListView()
    }
}
