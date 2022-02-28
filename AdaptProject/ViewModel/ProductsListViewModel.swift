//
//  ProductsListViewModel.swift
//  AdaptProject
//
//  Created by Krivenkis on 2022-02-28.
//
import Combine
import SwiftUI

class ProductsListViewModel: ObservableObject {
    
    @Published var products: [Product] = []
    private var cancellable: AnyCancellable?
    var maxProductCount = 0
    
    init() {
        loadProductData()
    }
    
    func loadProductData(_ productsNumber: Int = 10) {
        guard let url = URL(string: "https://api.tradono.com/users/1904056/feed") else {
            print("Invalid URL")
            return
        }
       
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { $0.data }
            .decode(type: [Product].self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .catch { _ in Just(self.products) }
            .sink { [weak self] in
                let data = $0
                self?.maxProductCount = data.count
                self?.products.removeAll()
                data.indices.forEach { i in
                    if i < productsNumber {
                        self?.products.append(data[i])
                    }
                }
            }
    }
}
