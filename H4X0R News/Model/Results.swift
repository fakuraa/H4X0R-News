//
//  Results.swift
//  H4X0R News
//
//  Created by Fadil Kurniawan on 25/05/24.
//

import Foundation

struct Results : Decodable {
    let hits:[Post]
}

struct Post : Decodable, Identifiable{
    var id: String {
        return objectID ?? ""
    }
    let objectID : String?
    let points : Int?
    let title : String?
    let url : String?
}
