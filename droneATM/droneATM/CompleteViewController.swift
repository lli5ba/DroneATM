//
//  CompleteViewController.swift
//  droneATM
//
//  Created by Zhang,Xiaoran on 7/7/16.
//  Copyright © 2016 Team Null. All rights reserved.
//

import UIKit

class CompleteViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        let url:NSURL = NSURL(string: "http://api.reimaginebanking.com/customers/577db71aebcfe1505405ba10/accounts?key=986e6cd9f1e5a0731f02a1c724f3273a")!
//        let session = NSURLSession.sharedSession()
//        
//        let request = NSMutableURLRequest(URL: url)
//        request.HTTPMethod = "POST"
//        request.cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringCacheData
//        
//        let params = ["type":"Checking", "nickname":"DroneATM", "rewards":0, "balance":0, "account_number":"0000000000000000"] as Dictionary<String, AnyObject>
//        do{
//            request.HTTPBody = try NSJSONSerialization.dataWithJSONObject(params, options:[])
//        } catch{
//            print("error")
//        }
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.addValue("application/json", forHTTPHeaderField: "Accept")
//        
//        let task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
//            print("Response: \(response)")
//        })
//        
//        task.resume()
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
