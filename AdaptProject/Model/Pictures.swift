//
//  Pictures.swift
//  AdaptProject
//
//  Created by Krivenkis on 2022-02-28.
//

import Foundation

struct Pictures: Decodable, Identifiable {
    var id: Int
    var classifiedId: Int
    var picture: String
    var sortOrder: Int
}
