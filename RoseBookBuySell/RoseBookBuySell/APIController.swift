//
//  APIController.swift
//  RoseBookBuySell
//
//  Created by Gregory Callegari on 8/18/15.
//  Copyright (c) 2015 Gregory Callegari. All rights reserved.
//
//  This file contains all of the methods used to call the rails server

import Foundation
import Alamofire
import SwiftyJSON


func handleGetListings(callback: (JSON?) -> ()){
    Alamofire.request(.GET, "http://localhost:3000/listing/find_all/"+currentUser!.id.description).responseJSON { (req, res, json, error) in
        if(error != nil) {
            NSLog("Error in GET Listings: \(error)")
            println(req)
            println(res)
            callback(nil)
        }
        else {
            NSLog("Success GET Listings")
            var json = JSON(json!)
            if let string = json.rawString(){
                if (string == "there are no listings"){
                    callback(nil)
                } else {
                    callback(json)
                }
            }
        }
    }
}

func handleLogin(username: String, password: String, callback: (User?) -> ()){
    Alamofire.request(.POST, "http://localhost:3000/user/login", parameters: ["username":username, "password":password]).responseJSON { (req, res, json, error) in
        if(error != nil) {
            NSLog("Error: \(error)")
            println(req)
            println(res)
            callback(nil)
        }
        else {
            NSLog("Success")
            var json = JSON(json!)
            println(json)
            if let string = json.rawString(){
                if (string == "invalid username or password"){
                    callback(nil)
                } else {
                    callback(User(id: json["id"].intValue, username: json["username"].stringValue, email: json["email"].stringValue))
                }
            }
        }
    }
}

func handleCreateAccount(username: String, password: String, email: String, callback: (User?) -> ()){
    Alamofire.request(.POST, "http://localhost:3000/user/create", parameters: ["user": ["username":username, "password":password, "email":email]]).responseJSON { (req, res, json, error) in
        if(error != nil) {
            NSLog("Error: \(error)")
            println(req)
            println(res)
            callback(nil)
        }
        else {
            NSLog("Success")
            var json = JSON(json!)
            println(json)
            if let string = json.rawString(){
                if (string == "a user with that email or username already exists"){
                    callback(User(id: -1, username: "a user with that email or username already exists", email: "email"))
                } else if (string == "save failed"){
                    callback(nil)
                } else {
                    callback(User(id: json["id"].intValue, username: json["username"].stringValue, email: json["email"].stringValue))
                }
            }
        }
    }
}

func handleGetMyListings(callback: (JSON?) -> ()){
    Alamofire.request(.GET, "http://localhost:3000/listing/find_user_id/" + currentUser!.id.description).responseJSON { (req, res, json, error) in
        if(error != nil) {
            NSLog("Error in GET my listings: \(error)")
            println(req)
            println(res)
            callback(nil)
        } else {
            NSLog("Success GET My Listings")
            var json = JSON(json!)
            if let string = json.rawString(){
                if (string == "user has no listings"){
                    callback(nil)
                } else {
                    callback(json)
                }
            }
        }
    }
}

