
//
//  ListingModel.swift
//  RoseBookBuySell
//
//  Created by Gregory Callegari on 8/11/15.
//  Copyright (c) 2015 Gregory Callegari. All rights reserved.
//

import Foundation

class Listing {
    var id : Int
    var price : Int
    var user_id: Int
    var book: Book
    
    init(id: Int, price: Int, user_id: Int, book: Book){
        self.id = id
        self.price = price
        self.user_id = user_id
        self.book = book
    }
    
}