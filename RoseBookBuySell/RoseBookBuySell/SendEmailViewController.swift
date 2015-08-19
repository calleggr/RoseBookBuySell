//
//  SendEmailViewController.swift
//  RoseBookBuySell
//
//  Created by greg on 7/20/15.
//  Copyright (c) 2015 Gregory Callegari. All rights reserved.
//

import UIKit
import SwiftyJSON

class SendEmailViewController: UIViewController {

    @IBAction func makeofferPressed(sender: AnyObject) {
        showDialog()
    }
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var editionLabel: UILabel!
    @IBOutlet weak var courseLabel: UILabel!
    @IBOutlet weak var deptLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var thisList : Listing?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismiss")
        view.addGestureRecognizer(tap)
        
        titleLabel.text = thisList?.book.title
        editionLabel.text = thisList?.book.edition
        courseLabel.text = thisList?.book.course_number
        deptLabel.text = thisList?.book.department
        priceLabel.text = "$\(thisList!.price)"
    }
    
    func dismiss(){
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func showDialog(){
        var alert = UIAlertController(title: "Make an Offer!", message: "", preferredStyle: UIAlertControllerStyle.Alert)
        var send = UIAlertAction(title: "Send Offer", style: UIAlertActionStyle.Default) { (UIAlertAction) -> Void in
            let text = alert.textFields![0] as! UITextField
            self.sendOffer(text.text)
        }
        var cancel = UIAlertAction(title: "Cancel", style: .Cancel) { (_) -> Void in
            println("Canceled")
        }
        
        alert.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "Enter Offer Here"
        }
        alert.addAction(cancel)
        alert.addAction(send)
        presentViewController(alert, animated: true, completion: nil)
    }
    
    
    func sendOffer(price: String){
        if let priceInt = price.toInt() {
            self.view.userInteractionEnabled = false
            var spinner = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.WhiteLarge)
            spinner.center = self.view.center
            spinner.startAnimating()
            self.view.addSubview(spinner)
            handleCreateOffer(priceInt, thisList!.id, { (json : JSON?) -> Void in
                if (json != nil){
                    self.view.userInteractionEnabled = true
                    spinner.stopAnimating()
                    self.performSegueWithIdentifier("GoBackToListings", sender: self)
                } else {
                    self.view.userInteractionEnabled = true
                    spinner.stopAnimating()
                    let alert = UIAlertView()
                    alert.title = "Error Sending Offer"
                    alert.message = "Check all fields are correct or please try again later"
                    alert.addButtonWithTitle("Ok")
                    alert.show()
                }
            })
        } else {
            let alert = UIAlertView()
            alert.title = "Please enter a number for price"
            alert.addButtonWithTitle("Ugh Fine")
            alert.show()
        }
    }
}
