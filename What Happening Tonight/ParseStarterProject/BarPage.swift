//
//  BarPage.swift
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


class barPage: UIViewController{
    
    
    
    @IBOutlet var barName: UINavigationItem!
    
    @IBOutlet var barImage: UIImageView!
    
    @IBOutlet var address: UILabel!
    
    @IBOutlet var phoneNumber: UILabel!
    
    @IBOutlet var snippetText: UITextView!

    @IBOutlet var currentPromotions: UITextView!
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        let query = PFQuery(className: "Business")
        query.whereKey("id", equalTo: selectedCell)
        query.findObjectsInBackgroundWithBlock({ (objects: [PFObject]?, error: NSError?) -> Void in
            
            if error == nil {
                let stringArray = String(objects![0]["address"]).componentsSeparatedByCharactersInSet(
                    NSCharacterSet.alphanumericCharacterSet().invertedSet)
                let newString = stringArray.joinWithSeparator(" ")
                self.address.text = newString
                self.currentPromotions.text = String(objects![0]["promotionDetails"])
                self.phoneNumber.text = String(objects![0]["phoneNumber"])
                self.snippetText.text = String(objects![0]["snippetText"])
                self.barName.title = String(objects![0]["name"])
                
                //                let attendance = String(objects![0]["attendance"])
                //                let coverCharge = String(objects![0]["coverCharge"])
                //                let waitTime = String(objects![0]["waitTime"])
                //                let promotions = String(objects![0]["promotions"])
                let url = NSURL(string: String(objects![0]["imageUrl"]))
                let pic = NSData(contentsOfURL:url!)
                
                
                
                if pic != nil {
                    self.barImage.image = UIImage(data: pic!)
                }
                
                
                
                
                
            }
            
        })
    }


}

