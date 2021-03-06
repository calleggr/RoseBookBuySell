//
//  LoginPageViewController.swift
//  RoseBookBuySell
//
//  Created by greg on 7/20/15.
//  Copyright (c) 2015 Gregory Callegari. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

var currentUser : User?
var listings : [Listing]?
var myListings : [Listing]?
var myOffers : [Offer]?


class LoginPageViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismiss")
        view.addGestureRecognizer(tap)
        username.selected = true
        password.secureTextEntry = true
        self.navigationController?.navigationBar.hidden = true

    }
    
    func dismiss(){
        view.endEditing(true)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func clickedSignIn(sender: AnyObject) {
        //self.performSegueWithIdentifier("LoggedInSegue", sender: self)
        handleLogin(username.text, password.text, { (user : User?) -> Void in
            if (user != nil) {
                currentUser = user!
                self.performSegueWithIdentifier("LoggedInSegue", sender: self)
            } else {
                let alert = UIAlertView()
                alert.title = "Error Signing In"
                alert.message = "Username or password was incorrect"
                alert.addButtonWithTitle("Ok")
                alert.show()
            }
        })
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String!, sender: AnyObject!) -> Bool {
        if identifier == "LoggedInSegue" {
            return true
        }
        
        // by default, transition
        return true
    }

}
