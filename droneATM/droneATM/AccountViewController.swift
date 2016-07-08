//
//  AccountViewController.swift
//  droneATM
//
//  Created by Zhang,Xiaoran on 7/6/16.
//  Copyright © 2016 Team Null. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {
    @IBAction func refreshTapped(sender: AnyObject) {
        updateAccount()
    }

    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var accLabel: UILabel!
    
    
    func updateAccount() {
        let urlString = "http://api.reimaginebanking.com/accounts/"+accountID+"?key=986e6cd9f1e5a0731f02a1c724f3273a"
        let url = NSURL(string: urlString)
        let request = NSURLRequest(URL: url!)
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {(response, data, error) in
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions())
                print(json)
                
                let accountNum = String(json["account_number"]!!)
                
                let a = accountNum[accountNum.startIndex ..< accountNum.startIndex.advancedBy(4)]
                let b = accountNum[accountNum.startIndex.advancedBy(4) ..< accountNum.startIndex.advancedBy(8)]
                let c = accountNum[accountNum.startIndex.advancedBy(8) ..< accountNum.startIndex.advancedBy(12)]
                let d = accountNum[accountNum.startIndex.advancedBy(12) ..< accountNum.endIndex]
                
                self.balanceLabel.text = "$"+String(json["balance"]!!)+".00"
                self.typeLabel.text = String(json["type"]!!)
                self.accLabel.text = a+"-"+b+"-"+c+"-"+d
                
                
            } catch {
                print(error)
            }
        }
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        updateAccount()
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
