//
//  MyListingsTableViewController.swift
//  RoseBookBuySell
//
//  Created by greg on 7/20/15.
//  Copyright (c) 2015 Gregory Callegari. All rights reserved.
//

import UIKit
import SwiftyJSON

class MyListingsTableViewController: UITableViewController {
    
    let ShowDetailSegueIdentifier = "MyListingsBackToHome"
    let listCell = "MyListCell"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Done, target: self, action: "goBack")
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor.blackColor()
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.71, green: 0.04, blue: 0.22, alpha: 1.0)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
    }
    

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "My Listings"
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(listCell, forIndexPath: indexPath) as! MyListingsTableViewCell
        
        // Configure the cell...
        var listing = myListings![indexPath.row]
        cell.bookLabel.text = listing.book.title
        cell.priceLabel.text = "$"+listing.price.description
        cell.layer.cornerRadius = 8.0
        cell.layer.masksToBounds = true
        cell.layer.borderColor = UIColor(red: 0.71, green: 0.04, blue: 0.22, alpha: 1.0).CGColor
        cell.layer.borderWidth = 1.5
        
        return cell
    }

    func goBack() {
        self.performSegueWithIdentifier(ShowDetailSegueIdentifier, sender: self)
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return myListings!.count
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println(myListings![indexPath.row].id)
        if (myOffers == nil){
            myOffers = []
        } else {
            myOffers!.removeAll(keepCapacity: true)
        }
        handleGetMyOffers(myListings![indexPath.row].id, { (json : JSON?) -> Void in
            if (json != nil) {
                for var i = 0; i < json!.count; ++i {
                    var currentOffer = Offer(id: json![i]["id"].intValue, price: json![i]["price"].intValue, listing_id: json![i]["listing_id"].intValue, user_id: json![i]["user"].intValue, user_name: json![i]["user"]["username"].stringValue, book_title: json![i]["listing"]["book"]["title"].stringValue)
                    myOffers!.append(currentOffer)
                }
                self.performSegueWithIdentifier("ShowOffersSegue", sender: self)
            } else {
                let alert = UIAlertView()
                alert.title = "This listing has no offers!"
                alert.message = "You'll get an email when you get some!"
                alert.addButtonWithTitle("Ok")
                alert.show()
            }
        })
    }


    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == ShowDetailSegueIdentifier{
            
        }
    }
    

}
