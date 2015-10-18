//
//  LoginViewController.swift
//  Carousel
//
//  Created by Tracy Chu on 10/16/15.
//  Copyright © 2015 Tracy Chu. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIAlertViewDelegate {

    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // declare variables
    var scrollViewInitialY: CGFloat!
    var buttonViewInitialY: CGFloat!
    let alertController = UIAlertController(title: "Email Required", message: "Please enter your email address", preferredStyle: .Alert)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // initialize variables
        scrollViewInitialY = scrollView.center.y
        buttonViewInitialY = buttonView.center.y
        
        // Register for keyboard events
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func keyboardWillShow(notification: NSNotification) {
        
        // adjust view positions
        scrollView.center.y = scrollViewInitialY - 110
        buttonView.center.y = buttonViewInitialY - 110

    }
    
    func keyboardWillHide(notification: NSNotification) {
        scrollView.center.y = scrollViewInitialY
        buttonView.center.y = buttonViewInitialY
        
    }
  
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    
    
    @IBAction func didTapSignin(sender: AnyObject) {
        
        
        activityIndicator.startAnimating()
        
        if email.text == "tsc@gmail.com" && password.text == "password" {
            delay(2, closure: { () -> () in
                self.performSegueWithIdentifier("loginSegue", sender: nil)
                self.activityIndicator.stopAnimating()
                self.email.text = ""
                self.password.text = ""
            })
            
            
        } else {if email.text!.isEmpty {
                delay(2, closure: { () -> () in
                    let alert = UIAlertView(title: "Email Required", message: "Please enter your email address", delegate: self, cancelButtonTitle: "OK")
                    alert.show()
                    self.activityIndicator.stopAnimating()
                    })
                } else {
                    let alert = UIAlertView(title: "Invalid Email of Password", message: "Please enter a valid email or password", delegate: self, cancelButtonTitle: "OK")
                    alert.show()
                    self.activityIndicator.stopAnimating()
        
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
