//
//  SellPageViewController.swift
//  RoseBookBuySell
//
//  Created by greg on 7/20/15.
//  Copyright (c) 2015 Gregory Callegari. All rights reserved.
//

import UIKit

class SellPageViewController: UIViewController {

    @IBOutlet weak var price: UITextField!
    @IBOutlet weak var courseNumber: UITextField!
    @IBOutlet weak var bookTitle: UITextField!
    @IBOutlet weak var edition: UITextField!
    @IBOutlet weak var department: UITextField!

    @IBAction func listBookPressed(sender: AnyObject) {
        //API CALL IN HERE, CREATION TIME
        if (price.text != "test" || courseNumber.text != "test" || bookTitle.text != "test") {
            
            let alert = UIAlertView()
            alert.title = "Error Listing Book"
            alert.message = "Check data entered and try again."
            alert.addButtonWithTitle("Ok")
            alert.show()
            
        }
            
       
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        var tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismiss")
        view.addGestureRecognizer(tap)
    }
    
    func dismiss(){
        view.endEditing(true)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        animateViewMoving(true, moveValue: 125)
    }
    func textFieldDidEndEditing(textField: UITextField) {
        animateViewMoving(false, moveValue: 125)
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
