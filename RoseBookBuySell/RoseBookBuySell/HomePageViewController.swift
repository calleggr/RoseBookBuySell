//
//  HomePageViewController.swift
//  RoseBookBuySell
//
//  Created by greg on 7/20/15.
//  Copyright (c) 2015 Gregory Callegari. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class HomePageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pressedFindBooks(sender: AnyObject) {
        if (listings == nil){
            listings = []
        } else {
            listings!.removeAll(keepCapacity: true)
        }
        handleGetListings({ (json : JSON?) -> Void in
            if (json != nil) {
                for var i = 0; i < json!.count; ++i {
                    var book = Book(id: json![i]["book"]["id"].intValue, listing_id: json![i]["book"]["listing_id"].intValue, title: json![i]["book"]["title"].stringValue, edition: json![i]["book"]["edition"].stringValue, course_number: json![i]["book"]["course_number"].stringValue, department: json![i]["book"]["department"].stringValue)
                    var listing = Listing(id: json![i]["id"].intValue, price: json![i]["price"].intValue, user_id: json![i]["user_id"].intValue, book: book)
                    listings!.append(listing)
                }
                self.performSegueWithIdentifier("FindBooksSegue", sender: self)
            } else {
                let alert = UIAlertView()
                alert.title = "Error Finding Books"
                alert.message = "Please try agin later"
                alert.addButtonWithTitle("Ok")
                alert.show()
            }
        })
    }

    @IBAction func pressedSellBook(sender: AnyObject) {
        self.performSegueWithIdentifier("SellBookSegue", sender: self)
    }
    
    
    @IBAction func pressedSignOut(sender: AnyObject) {
        currentUser = nil
    }
    
    @IBAction func pressedMyListings(sender: AnyObject) {
        if (myListings == nil){
            myListings = []
        } else {
            myListings!.removeAll(keepCapacity: true)
        }
        handleGetMyListings({ (json : JSON?) -> Void in
            if (json != nil) {
                for var i = 0; i < json!.count; ++i {
                    var book = Book(id: json![i]["book"]["id"].intValue, listing_id: json![i]["book"]["listing_id"].intValue, title: json![i]["book"]["title"].stringValue, edition: json![i]["book"]["edition"].stringValue, course_number: json![i]["book"]["course_number"].stringValue, department: json![i]["book"]["department"].stringValue)
                    var listing = Listing(id: json![i]["id"].intValue, price: json![i]["price"].intValue, user_id: json![i]["user_id"].intValue, book: book)
                    myListings!.append(listing)
                }
                self.performSegueWithIdentifier("MyListingsSegue", sender: self)
            } else {
                let alert = UIAlertView()
                alert.title = "You have no listings!"
                alert.message = "Click sell a book to start making your own listings!"
                alert.addButtonWithTitle("Ok")
                alert.show()
            }
        })
    }
    
    
    override func shouldPerformSegueWithIdentifier(identifier: String!, sender: AnyObject!) -> Bool {
        if (identifier != nil) {
            if (identifier == "FindBooksSegue") {
                return true
            } else if (identifier == "MyListingsSegue") {
                return true
            }
        }
        // by default, transition
        return true
    }
}
