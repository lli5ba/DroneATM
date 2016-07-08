//
//  MainViewController.swift
//  droneATM
//
//  Created by Zhang,Xiaoran on 7/6/16.
//  Copyright © 2016 Team Null. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        let isLoggedIn = NSUserDefaults.standardUserDefaults().boolForKey("isLoggedIn");
        if(!isLoggedIn){
            self.performSegueWithIdentifier("loginSegue", sender: self);
        }
    }
    @IBAction func withdrawTapped(sender: AnyObject) {
        self.performSegueWithIdentifier("withdrawSegue", sender: self);
    }
    
    @IBAction func depo(sender: AnyObject) {
        let alert = UIAlertController(title: "Feature Coming Soon!", message: "Can't make deposits yet.", preferredStyle: UIAlertControllerStyle.Alert);
        let okButton = UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default, handler: nil)
        alert.addAction(okButton);
        let rootVC = UIApplication.sharedApplication().keyWindow?.rootViewController
        rootVC?.presentViewController(alert, animated: true){}
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
