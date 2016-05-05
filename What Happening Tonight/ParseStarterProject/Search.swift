//
//  Search.swift
//  Created by Dan Levine

import Foundation
import UIKit
import Parse
import Bolts
import OAuthSwift
import ParseFacebookUtilsV4
import FBSDKCoreKit
import FBSDKLoginKit
import Foundation




class Search: UIViewController{


    @IBOutlet var venue: UITextField!
    @IBOutlet var location: UITextField!

    func doOAuthYelp(place: String, venue: String){
        let oauthClient = OAuthSwiftClient(
            consumerKey:    "dlbZKgh9KViU6fHHmEuDnQ",
            consumerSecret: "YApAAvZtuXMBpGlt0y7hQf7zoJc",
            accessToken:    "PZKPky2SyN2Cfe3TQ5ynBuNedt39t2U8",
            accessTokenSecret: "IYr6BoaRn35jmQcTS7xyXPaFl-M"
        )
        var params: [String: String] = [
            "location": "\""+place+"\"",
            "category_filter": "bars,danceclubs",
            "limit": "20"
            //"offset": "20"
        ]
        Businesses = []
        
        if venue != ""{
            params["term"] = "\""+venue+"\""
            params["category_filter"] = ""
        }
        
        oauthClient.get("http://api.yelp.com/v2/search", parameters: params,
                        success: { (data, response) -> Void in
                            do{
                                let json: NSDictionary = try NSJSONSerialization.JSONObjectWithData(data, options:[] ) as! NSDictionary
                                
                                
                                if let bars = json["businesses"] as? [[String: AnyObject]] {
                                    for bar in bars {
//                                        print(bar["id"])
//                                        print(bar["name"])
//                                        print(bar["location"]!["address"]!)
//                                        print(bar["categories"])
//                                        print(bar["phone"])
//                                        print(bar["image_url"])
//                                        print(bar["url"])
//                                        print(bar["snippet_text"])
//                                        
//                                        let barId = Business(name:bar["name"] as? String ?? "",address: bar["location"]!["address"]! as? [String] ?? [],category: bar["categories"] as? [[String]] ?? [[]], phoneNumber: bar["phone"] as? String ?? "", id: bar["id"] as? String ?? "", imageUrl: bar["image_url"] as? String ?? "",mobileUrl: bar["url"] as? String ?? "",snippetText: bar["snippet_text"] as? String ?? "")
                                        let searchedBars = Business(name:bar["name"] as? String ?? "", id: bar["id"] as? String ?? "")
                                        
                                        
                                        let query = PFQuery(className: "Business")
                                        query.whereKey("id", equalTo: bar["id"]!)
                                        query.findObjectsInBackgroundWithBlock({ (objects: [PFObject]?, error: NSError?) -> Void in
                                            
                                            if error == nil {
                                                if (objects!.count == 0){
                                                    print(objects!.count)
                                                    let saveBar = PFObject(className: "Business")
                                                    saveBar["id"] = bar["id"]
                                                    saveBar["name"] = bar["name"]
                                                    saveBar["address"] = bar["location"]!["address"]!
                                                    saveBar["city"] = bar["location"]!["city"]!
                                                    saveBar["categories"] = bar["categories"]
                                                    saveBar["phoneNumber"] = bar["display_phone"]
                                                    saveBar["imageUrl"] = bar["image_url"]
                                                    saveBar["url"] = bar["url"]
                                                    saveBar["snippetText"] = bar["snippet_text"]
                                                    saveBar["isClaimed"] = false
                                                    saveBar["waitTime"] = 0
                                                    saveBar["coverCharge"] = 0.00
                                                    saveBar["attendance"] = 0
                                                    saveBar["promotions"] = false
                                                    saveBar["promotionDetails"] = ""
                                                    
                                                    
                                                    saveBar.saveInBackground()
                                                }
                                            }
                                            
                                        })
                                        
                                        
    
                                        
                                            

                                        
                                       Businesses.append(searchedBars)
                                    }
                                    
                                    
                                
                                }
                                
                            }catch{}
            }, failure: { (error) -> Void in
                print("there was an error: \(error)")
        })
        
        
    }
    
    
    @IBAction func SeachForBars(sender: AnyObject) {
        
        doOAuthYelp(location.text!,venue: venue.text!)
        
        if (location.text == nil) {
            //doOAuthYelp(currentLocation)
        }
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        location.resignFirstResponder()
        return true
    }
    
    
}
