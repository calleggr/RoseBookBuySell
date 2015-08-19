//
//  OfferModel.swift
//  RoseBookBuySell
//
//  Created by Gregory Callegari on 8/11/15.
//  Copyright (c) 2015 Gregory Callegari. All rights reserved.
//

import Foundation

class Offer {
    var id : Int
    var price : Int
    var listing_id : Int
    var user_id: Int
    var user_name: String
    var book_title: String
    
    init(id: Int, price: Int, listing_id: Int, user_id: Int, user_name: String, book_title: String){
        self.id = id
        self.price = price
        self.listing_id = listing_id
        self.user_id = user_id
        self.user_name = user_name
        self.book_title = book_title
    }
    
}
