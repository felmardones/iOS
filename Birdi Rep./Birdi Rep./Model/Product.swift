//
//  Products.swift
//  Birdi Rep.
//
//  Created by Felipe on 28-02-20.
//  Copyright © 2020 Felipe. All rights reserved.
//

import Foundation


struct Product: Codable, Hashable{
    let id: Int
    let product: String
    let imageUrl:String
    
    enum CodingKeys: String, CodingKey {
        case id       = "id"
        case imageUrl = "image_url"
        case product
    }
}



