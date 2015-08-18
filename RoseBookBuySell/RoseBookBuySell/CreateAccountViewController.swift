//
//  CreateAccountViewController.swift
//  RoseBookBuySell
//
//  Created by greg on 7/20/15.
//  Copyright (c) 2015 Gregory Callegari. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class CreateAccountViewController: UIViewController {
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismiss")
        view.addGestureRecognizer(tap)
        username.selected = true
        password.secureTextEntry = true
        confirmPassword.secureTextEntry = true
    }
    
    func dismiss(){
        view.endEditing(true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func pressedDoneButton(sender: AnyObject) {
        if (password.text == confirmPassword.text) {
            handleCreateAccount(username.text, password.text, email.text, { (user : User?) -> Void in
                if (user != nil){
                    if (user!.username == "a user with that email or username already exists") {
                        let alert = UIAlertView()
                        alert.title = "Error Creating Account"
                        alert.message = "A user with that email or username already exists"
                        alert.addButtonWithTitle("Ok")
                        alert.show()
                    } else {
                    currentUser = user!
                    self.performSegueWithIdentifier("CreateAccountDoneSegue", sender: self)
                    }
                } else {
                    let alert = UIAlertView()
                    alert.title = "Error Creating Account"
                    alert.message = "Check passwords match or please try again later"
                    alert.addButtonWithTitle("Ok")
                    alert.show()
                }
            })
        } else {
            password.text = ""
            confirmPassword.text = ""
            let alert = UIAlertView()
            alert.title = "Passwords do not match"
            alert.message = "Please retype your password"
            alert.addButtonWithTitle("Ok")
            alert.show()
        }
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String!, sender: AnyObject!) -> Bool {
        if identifier == "CreateAccountDoneSegue" {
            return true
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
    
    
    
    func textFieldDidBeginEditing(textField: UITextField) {
        animateViewMoving(true, moveValue: 150)
    }
    func textFieldDidEndEditing(textField: UITextField) {
        animateViewMoving(false, moveValue: 150)
    }
    
    func animateViewMoving (up:Bool, moveValue :CGFloat){
        var movementDuration:NSTimeInterval = 0.3
        var movement:CGFloat = ( up ? -moveValue : moveValue)
        UIView.beginAnimations( "animateView", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuration )
        self.view.frame = CGRectOffset(self.view.frame, 0,  movement)
        UIView.commitAnimations()
    }
    
    
    
    
    
    

}
