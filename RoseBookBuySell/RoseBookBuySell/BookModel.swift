//
//  BookModel.swift
//  RoseBookBuySell
//
//  Created by Gregory Callegari on 8/11/15.
//  Copyright (c) 2015 Gregory Callegari. All rights reserved.
//

import Foundation

class Book {
    var id : Int
    var listing_id : Int
    var title : String
    var edition : String
    var course_number : String
    var department : String
    
    
    init(id: Int, listing_id: Int, title: String, edition: String, course_number: String, department: String){
        self.id = id
        self.price = price
        self.listing_id = listing_id
        self.user_id = user_id
    }
    
}