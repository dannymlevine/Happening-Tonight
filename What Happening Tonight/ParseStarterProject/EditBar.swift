//
//  EditBar.swift
//  Whats Happening Tonight-Swift
//
//  Created by Dan Levine


import UIKit
import Parse
import Bolts
import OAuthSwift
import ParseFacebookUtilsV4
import FBSDKCoreKit
import FBSDKLoginKit
import Foundation


class EditBar:UIViewController{
    
    
    @IBOutlet var attendance: UITextField!
    
    @IBOutlet var coverCharge: UITextField!
    
    
    @IBOutlet var waitTime: UITextField!
    
    
    @IBOutlet var promotion: UITextField!
    
    @IBAction func updateBar(sender: AnyObject) {
        
        let query = PFQuery(className: "Business")
        query.whereKey("id", equalTo: selectedCell)
        query.findObjectsInBackgroundWithBlock({ (objects: [PFObject]?, error: NSError?) -> Void in
            
            if error == nil {
                if self.attendance != ""{
                    objects![0]["attendance"] = Int(self.attendance.text!)
                }
                if self.coverCharge != "" {
                objects![0]["coverCharge"] = Double(self.coverCharge.text!)
                }
                if self.waitTime != "" {
                objects![0]["waitTime"] = Int(self.waitTime.text!)
                }
                objects![0]["promotionDetails"] = String(self.promotion.text!)
                if String(objects![0]["promotionDetails"]) != "" {
                    objects![0]["promotions"] = true
                }else {objects![0]["promotions"] = false}
                
                objects![0].saveInBackground()
                

            }
            
        })

    }
    



}