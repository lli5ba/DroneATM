//
//  LoginViewController.swift
//  droneATM
//
//  Created by Zhang,Xiaoran on 7/6/16.
//  Copyright © 2016 Team Null. All rights reserved.
//

import UIKit
var accountID = String()

class LoginViewController: UIViewController {

    @IBOutlet weak var accNumText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signInTapped(sender: UIButton) {
        
        let accountNumber = accNumText.text;
        accountID = "577db8d6ebcfe1505405ba13";
        let accountPassword = passwordText.text;
        
        if(accountNumber == "1234"){
            if(accountPassword == "1234"){
                
                NSUserDefaults.standardUserDefaults().setBool(true, forKey: "isLoggedIn");
                NSUserDefaults.standardUserDefaults().synchronize();
                
                self.dismissViewControllerAnimated(true, completion: nil);
            }
            else {
                let alert = UIAlertController(title: nil, message: "Incorrect Password", preferredStyle: UIAlertControllerStyle.Alert);
                let okButton = UIAlertAction(title: "Retry", style: UIAlertActionStyle.Default, handler: nil)
                alert.addAction(okButton);
                self.presentViewController(alert, animated: true){}
            }
        }
        else {
            
            let alert = UIAlertController(title: nil, message:"Invalid Account Number", preferredStyle: UIAlertControllerStyle.Alert);
            let okButton = UIAlertAction(title: "Retry", style: UIAlertActionStyle.Default, handler: nil)
            alert.addAction(okButton);
            self.presentViewController(alert, animated: true){}
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
