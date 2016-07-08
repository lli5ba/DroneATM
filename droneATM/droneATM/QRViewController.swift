//
//  QRViewController.swift
//  droneATM
//
//  Created by Zhang,Xiaoran on 7/6/16.
//  Copyright © 2016 Team Null. All rights reserved.
//

import UIKit


class QRViewController: UIViewController {
    @IBOutlet weak var qrWebView: UIWebView!
    
    var amount = String()
    var flag = false
    
    var timer = NSTimer.init()

    func getQR() {
        amount = amount.substringToIndex(amount.endIndex.predecessor())
        amount = amount.substringToIndex(amount.endIndex.predecessor())
        
        let urlString = "https://api.qrserver.com/v1/create-qr-code/?data="+accountID+"-"+amount
        print(urlString)
        let url = NSURL(string: urlString)
        let request = NSURLRequest(URL: url!)
        qrWebView.loadRequest(request)
    }
    
    func checkStatus() {
        let urlString = "http://api.reimaginebanking.com/accounts/"+accountID+"?key=986e6cd9f1e5a0731f02a1c724f3273a"
        let url = NSURL(string: urlString)
        let request = NSURLRequest(URL: url!)
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {(response, data, error) in
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions())
                
                self.flag = ( status != String(json["nickname"]!!) )
                print(status)
                print(String(json["nickname"]!!))
                print("===")
                
            } catch {
                print(error)
            }
        }
        
    }
    @IBAction func skip(sender: AnyObject) {
        timer.invalidate()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getQR()
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(poll), userInfo: nil, repeats: true)
        
    }

    func poll() {
        if (!flag) {
            checkStatus()
        }
        else {
            timer.invalidate()
            self.performSegueWithIdentifier("completeSegue", sender: self);
        }
    }
    
    
    override func viewDidAppear(animated: Bool) {

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
