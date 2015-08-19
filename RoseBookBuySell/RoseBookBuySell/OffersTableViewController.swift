//
//  OffersTableViewController.swift
//  RoseBookBuySell
//
//  Created by greg on 7/20/15.
//  Copyright (c) 2015 Gregory Callegari. All rights reserved.
//

import UIKit

var currentOffer : Offer?

class OffersTableViewController: UITableViewController {
    
    let ShowDetailSegueIdentifier = "OffersBackToListings"
    let listCell = "OffersCell"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Done, target: self, action: "goBack")
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.71, green: 0.04, blue: 0.22, alpha: 1.0)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
    }
    
    
    override func viewWillAppear(animated: Bool) {
        //API HERE to generate the list
        self.navigationItem.title = "Offers for \(myOffers![0].book_title)"
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(listCell, forIndexPath: indexPath) as! OffersTableViewCell
        
        // Configure the cell...
  
        cell.nameLabel.text = myOffers![indexPath.row].user_name
        cell.offerLabel.text = "$"+myOffers![indexPath.row].price.description
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
        return myOffers!.count
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        currentOffer = myOffers![indexPath.row]
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == ShowDetailSegueIdentifier{
    
        }
    }



}
