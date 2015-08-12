//
//  ListingsTableViewController.swift
//  RoseBookBuySell
//
//  Created by greg on 7/20/15.
//  Copyright (c) 2015 Gregory Callegari. All rights reserved.
//

import UIKit

class ListingsTableViewController: UITableViewController {
    
    let ShowDetailSegueIdentifier = "listingsBackToHome"
    let listCell = "ListingCell"
    var demoCourse : [String] = []
    var demoBook : [String] = []
    var demoPrice : [String] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Done, target: self, action: "goBack")
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
        return demoBook.count
    }

    

    override func viewWillAppear(animated: Bool) {
        //API HERE to generate the list
        demoCourse=["CSSE 220", "MA 374", "CSSE 484"]
        demoBook=["Big Java", "Fundamentalst of thermophysics", "iOS Dev"]
        demoPrice=["$230", "$100", "$998"]
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(listCell, forIndexPath: indexPath) as! ListingTableViewCell
        
        // Configure the cell...
        
        cell.bookLabel.text = demoBook[indexPath.row]
        cell.courseLabel.text = demoCourse[indexPath.row]
        cell.priceLabel.text = demoPrice[indexPath.row]
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
        if segue.identifier == ShowDetailSegueIdentifier{
            
        }
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    

}
