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
        //println(currentUser!.username)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func _handleGetListings(callback: (JSON?) -> ()){
        Alamofire.request(.GET, "http://localhost:3000/listing/find_all").responseJSON { (req, res, json, error) in
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
                    if (string == "there are no listings"){
                        callback(nil)
                    } else {
                        callback(json)
                    }
                }
            }
        }
    }
    
    @IBAction func pressedFindBooks(sender: AnyObject) {
        //self.performSegueWithIdentifier("FindBooksSegue", sender: self)
        if (listings == nil){
            listings = []
        } else {
         listings!.removeAll(keepCapacity: true)   
        }
        _handleGetListings({ (json : JSON?) -> Void in
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

    @IBAction func pressedSignOut(sender: AnyObject) {
        currentUser = nil
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String!, sender: AnyObject!) -> Bool {
        if (identifier != nil) {
            if identifier == "FindBooksSegue" {
                return true
            }
        }
        // by default, transition
        return true
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
