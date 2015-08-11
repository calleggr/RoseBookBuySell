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


class LoginPageViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismiss")
        view.addGestureRecognizer(tap)
        password.secureTextEntry = true
        println(currentUser?.username)

    }
    
    func dismiss(){
        view.endEditing(true)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func clickedSignIn(sender: AnyObject) {
        _handleLogin(username.text, password: password.text, callback: { (user : User?) -> Void in
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
            //ADD API CALL TO LOG IN HERE
            return true
        }
        
        // by default, transition
        return true
    }
    
    // MARK: -Private helper methods
    
    func _handleLogin(username: String, password: String, callback: (User?) -> ()){
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
