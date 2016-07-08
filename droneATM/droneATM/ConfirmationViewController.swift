//
//  ConfirmationViewController.swift
//  droneATM
//
//  Created by Zhang,Xiaoran on 7/6/16.
//  Copyright © 2016 Team Null. All rights reserved.
//

import UIKit
var status: String = ""

class ConfirmationViewController: UIViewController {
    
    @IBOutlet weak var amountField: UILabel!
    
    var output = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        amountField.text = "$"+output+"0"
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func cancelTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil);
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        switch segue.identifier! as NSString {
        case "QRSegue":
            let secondViewController : QRViewController = segue.destinationViewController as! QRViewController
            secondViewController.amount = output;
        
            // Send Post Request

            let url:NSURL = NSURL(string: "http://api.reimaginebanking.com/customers/577db71aebcfe1505405ba10/accounts?key=986e6cd9f1e5a0731f02a1c724f3273a")!
            let session = NSURLSession.sharedSession()
            
            let request = NSMutableURLRequest(URL: url)
            request.HTTPMethod = "POST"
            request.cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringCacheData
            
            let params = ["type":"Checking", "nickname":"DroneATM", "rewards":0, "balance":0, "account_number":"0000000000000000"] as Dictionary<String, AnyObject>
            do{
            request.HTTPBody = try NSJSONSerialization.dataWithJSONObject(params, options:[])
            } catch{
                print("error")
            }
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            
            let task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
                print("Response: \(response)")
            })
            
            task.resume()
            
            let urlString = "http://api.reimaginebanking.com/accounts/"+accountID+"?key=986e6cd9f1e5a0731f02a1c724f3273a"
            let url2 = NSURL(string: urlString)
            let request2 = NSURLRequest(URL: url2!)
            
            NSURLConnection.sendAsynchronousRequest(request2, queue: NSOperationQueue.mainQueue()) {(response, data, error) in
                do {
                    let json = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions())
                    
                    status = String(json["nickname"]!!)
                    
                } catch {
                    print(error)
                }
            }
            
            
        default:
            print("Default")
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
