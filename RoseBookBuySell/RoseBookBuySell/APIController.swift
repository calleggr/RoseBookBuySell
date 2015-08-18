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

//  Undeployed at the moment, so all calls are to localhost
let url = "http://localhost:3000/"


/*
 API calls to the User contoller
*/
func handleLogin(username: String, password: String, callback: (User?) -> ()){
    Alamofire.request(.POST, url + "user/login", parameters: ["username":username, "password":password]).responseJSON { (req, res, json, error) in
        if(error != nil) {
            NSLog("Error in POST login: \(error)")
            println(req)
            println(res)
            callback(nil)
        }
        else {
            NSLog("Success in POST login")
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
    Alamofire.request(.POST, url + "user/create", parameters: ["user": ["username":username, "password":password, "email":email]]).responseJSON { (req, res, json, error) in
        if(error != nil) {
            NSLog("Error in POST create account: \(error)")
            println(req)
            println(res)
            callback(nil)
        }
        else {
            NSLog("Success in POST create account")
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

/*
 API calls to the Listing controller
*/

func handleGetListings(callback: (JSON?) -> ()){
    Alamofire.request(.GET, url + "listing/find_all/" + currentUser!.id.description).responseJSON { (req, res, json, error) in
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

func handleGetMyListings(callback: (JSON?) -> ()){
    Alamofire.request(.GET, url + "listing/find_user_id/" + currentUser!.id.description).responseJSON { (req, res, json, error) in
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

func handleCreateListing(price: Int, book: Book, callback: (JSON?) -> ()){
    Alamofire.request(.POST, url + "listing/create", parameters: ["listing" : ["user_id" : currentUser!.id, "price" : price], "book" : ["title":book.title, "course_number" : book.course_number, "department" : book.department, "edition" : book.edition]]).responseJSON { (req, res, json, error) in
        if(error != nil) {
            NSLog("Error in POST create listing: \(error)")
            println(req)
            println(res)
            callback(nil)
        } else {
            NSLog("Success POST create listing")
            var json = JSON(json!)
            if let string = json.rawString(){
                if (string == "failed to save book" || string == "failed to save listing"){
                    callback(nil)
                } else {
                    callback(json)
                }
            }
        }
    }
}

