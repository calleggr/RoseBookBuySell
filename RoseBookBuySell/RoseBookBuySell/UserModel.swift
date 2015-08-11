//
//  UserModel.swift
//  RoseBookBuySell
//
//  Created by Gregory Callegari on 8/11/15.
//  Copyright (c) 2015 Gregory Callegari. All rights reserved.
//

import Foundation

class User {
    var id : Int
    var username : String
    var email : String
    
    init(id: Int, username: String, email: String) {
        self.id = id
        self.username = username
        self.email = email
    }

}