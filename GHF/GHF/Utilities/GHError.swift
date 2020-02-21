//
//  GHError.swift
//  GHF
//
//  Created by Felipe on 04-01-20.
//  Copyright © 2020 Felipe. All rights reserved.
//

import Foundation

enum GHError: String, Error{
    
    case invalidUsername    = "This username created an invalid request. Please try again"
    case unableToComplete   = "Unabled to complete your request. Please check your internet connection"
    case invalidResponse    = "Invalid reponse from the server. Please try again"
    case invalidData        = "The data received from the server was invalid. Please try again."
    case unableToFavorite   = "There was an error favoriting this user. Please try again"
    case alreadyInFavorites = "You've already favorited this user. You must really like them!"
}
