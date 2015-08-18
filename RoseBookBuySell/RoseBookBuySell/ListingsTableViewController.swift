//
//  ListingsTableViewController.swift
//  RoseBookBuySell
//
//  Created by greg on 7/20/15.
//  Copyright (c) 2015 Gregory Callegari. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ListingsTableViewController: UITableViewController {
    
    let ShowDetailSegueIdentifier = "listingsBackToHome"
    let listCell = "ListingCell"
    
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
                    if (string == "invalid username or password"){
                        callback(nil)
                    } else {
                        callback(json)
                    }
                }
            }
        }
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Done, target: self, action: "goBack")
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor.blackColor()
        //self.navigationController?.navigationBar.backgroundColor = UIColor(red: 0.71, green: 0.04, blue: 0.22, alpha: 1.0)
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.71, green: 0.04, blue: 0.22, alpha: 1.0)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
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
        return listings!.count
    }

    

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
//        var book = Book(id: 1, listing_id: 1, title: "DEMO BOOk TitLE", edition: "7th edition", course_number: "csse-484", department: "Computer Science and stuff")
//        
//        var listing = Listing(id: 1, price: 30, user_id: 1, book: book)
//        
//        listings?.append(listing)
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(listCell, forIndexPath: indexPath) as! ListingTableViewCell
        
        // Configure the cell...
        var currentListing = listings![indexPath.row]
        println("table")
        cell.bookLabel.text = currentListing.book.title
        cell.courseLabel.text = currentListing.book.course_number
        cell.priceLabel.text = currentListing.price.description
        cell.bookLabel.preferredMaxLayoutWidth = CGRectGetWidth(cell.bookLabel.superview!.frame)/3
        cell.layer.cornerRadius = 8.0
        cell.layer.masksToBounds = true
        cell.layer.borderColor = UIColor(red: 0.71, green: 0.04, blue: 0.22, alpha: 1.0).CGColor
        cell.layer.borderWidth = 1.5
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowBookDetail"{
            let index = self.tableView.indexPathForSelectedRow()
            var list = listings![index!.row]
            println(list.book.title)
            (segue.destinationViewController as! SendEmailViewController).thisList = list
        }
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    

}
