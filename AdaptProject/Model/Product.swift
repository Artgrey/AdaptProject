//
//  Products.swift
//  AdaptProject
//
//  Created by Krivenkis on 2022-02-28.
//

import Foundation

struct Product: Decodable, Identifiable {
    
    var id: Int
    var description: String
    var price: Int
    var currency: String
    var createdAt: Int
    var pictures: [Pictures]
}
