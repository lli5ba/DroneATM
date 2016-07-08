//
//  ViewController.swift
//  droneATM
//
//  Created by Zhang,Xiaoran on 7/6/16.
//  Copyright © 2016 Team Null. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var customAmountField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func backButton(sender: AnyObject) {
        self.performSegueWithIdentifier("mainSegue", sender: self)
    }
    
    @IBAction func button20(sender: UIButton) {
        customAmountField.text = "20.00"
    }
    @IBAction func button40(sender: AnyObject) {
        customAmountField.text = "40.00"
    }
    @IBAction func button80(sender: AnyObject) {
        customAmountField.text = "80.00"
    }
    @IBAction func button60(sender: AnyObject) {
        customAmountField.text = "60.00"
    }
    @IBAction func withdrawTapped(sender: AnyObject) {
        var customAmountNum = Float(customAmountField.text!)
        
        if(customAmountField.text!.isEmpty) {
            customAmountNum = -1;
        }
        if (customAmountNum! % 20 == 0) {
            self.performSegueWithIdentifier("confirmationSegue", sender: self)
        }
        else {
            let alert = UIAlertController(title: "Error!", message: "Please enter a multiple of $20", preferredStyle: UIAlertControllerStyle.Alert);
            let okButton = UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default, handler: nil)
            alert.addAction(okButton);
            let rootVC = UIApplication.sharedApplication().keyWindow?.rootViewController
            rootVC?.presentViewController(alert, animated: true){}
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        switch segue.identifier! as NSString {
        case "confirmationSegue":
            let secondViewController : ConfirmationViewController = segue.destinationViewController as! ConfirmationViewController
            secondViewController.output = String(Float(customAmountField.text!)!);
            
        default:
            print("Default")
        }
        
        
    }
    

}

