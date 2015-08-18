//
//  SendEmailViewController.swift
//  RoseBookBuySell
//
//  Created by greg on 7/20/15.
//  Copyright (c) 2015 Gregory Callegari. All rights reserved.
//

import UIKit

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
    
    
    func sendOffer(test: String){
        //Mad API time here
        println("WE HAVE SEND AN EMAIL OMGOMGOMG")
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
