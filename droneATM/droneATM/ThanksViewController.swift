//
//  ThanksViewController.swift
//  droneATM
//
//  Created by Zhang,Xiaoran on 7/7/16.
//  Copyright © 2016 Team Null. All rights reserved.
//

import UIKit

class ThanksViewController: UIViewController {
    
    var timer = NSTimer.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: #selector(delay), userInfo: nil, repeats: false)

        // Do any additional setup after loading the view.
    }
    
    func delay(){
        timer.invalidate()
        self.performSegueWithIdentifier("restartSegue", sender: self);
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

}
