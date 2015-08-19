//
//  SendEmailResponseViewController.swift
//  RoseBookBuySell
//
//  Created by greg on 7/20/15.
//  Copyright (c) 2015 Gregory Callegari. All rights reserved.
//

//SendEmailSegue

import UIKit
import SwiftyJSON

class SendEmailResponseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        body.text = "Type email body here. Be sure to include your own email so they can respond!"
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
    
    @IBOutlet weak var body: UITextView!
    @IBAction func pressedSendEmail(sender: AnyObject) {
        self.view.userInteractionEnabled = false
        var spinner = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.WhiteLarge)
        spinner.center = self.view.center
        spinner.startAnimating()
        self.view.addSubview(spinner)
        handleRespondToEmail(currentOffer!.id, body.text, { (json : JSON?) -> Void in
            if (json != nil){
                self.view.userInteractionEnabled = true
                spinner.stopAnimating()
                self.performSegueWithIdentifier("SendEmailSegue", sender: self)
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
