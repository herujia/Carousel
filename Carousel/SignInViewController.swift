//
//  SignInViewController.swift
//  Carousel
//
//  Created by Rujia He on 10/25/15.
//  Refered from Sara Menefee.


import UIKit

class SignInViewController: UIViewController, UITextFieldDelegate, UIAlertViewDelegate {
    @IBOutlet weak var signinView: UIView!
    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var signinButton: UIButton!
    @IBOutlet weak var buttonImageView: UIImageView!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var textImageView: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var scrollVIew: UIScrollView!
    @IBAction func signinButton(sender: UIButton) {
        
        // Prompt UIAlertView when onLoginButton is tapped
        
        var alertView = UIAlertView(title: "Logging in...", message: nil, delegate: self, cancelButtonTitle: nil)
        alertView.show()
        
        // Delay with UIAlertView for 2 seconds
        
         delay(2, closure: { () -> () in
            
            if(self.emailTextField.text == "rujia@fb.com" ) && (self.passwordField.text == "facebook") {
                alertView.dismissWithClickedButtonIndex(0, animated: true)
                self.performSegueWithIdentifier("logInSegue", sender: self)
                
            }
                
            else if(self.emailTextField.text.isEmpty ) && (self.passwordField.text.isEmpty) {
                alertView.dismissWithClickedButtonIndex(0, animated: true)
                UIAlertView(title: "Whoops!", message: "You need to enter in an email and password to log-in.", delegate: nil, cancelButtonTitle: "Try Again...").show()
                
            }
                
                // In the event that the user has not entered in the proper credentials prompt a UIAlertView
                
            else {
                
                UIAlertView(title: "Uh oh!", message: "Your log-in credentials were wrong!", delegate: nil, cancelButtonTitle: "Try Again...").show()
            }
            
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        
        self.signinView.tag = Int(self.signinView.frame.origin.y)
        self.buttonView.tag = Int(self.buttonView.frame.origin.y)
        
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(UInt(animationCurve << 16)), animations: {
            
            self.signinView.frame.origin.y = -26;
            self.buttonView.frame.origin.y = 160;
            
            
            }, completion: nil)
        
    }
    func keyboardWillHide(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(UInt(animationCurve << 16)), animations: {
            
            self.signinView.frame.origin.y = CGFloat(self.signinView.tag);
            self.buttonView.frame.origin.y = CGFloat(self.buttonView.tag);
            
            }, completion: nil)
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Tap anywhere outside of the keyboard in order to dismiss it.
    
    @IBAction func onTapDismissKeyboard(sender: AnyObject) {
        
        view.endEditing(true)
    }
    
    
    @IBAction func pushBackToIntro(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}

