//
//  Results.swift
//  Created by Dan Levine
import UIKit
import Parse
import Bolts
import OAuthSwift
import ParseFacebookUtilsV4
import FBSDKCoreKit
import FBSDKLoginKit
import Foundation






class Results: UIViewController,UITableViewDelegate{


    
    @IBOutlet var BarList: UITableView!
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell?{
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! barCell
        cell.BarName.text = Businesses[indexPath.row].name
        
        let query = PFQuery(className: "Business")
        query.whereKey("id", equalTo: Businesses[indexPath.row].id)
        query.findObjectsInBackgroundWithBlock({ (objects: [PFObject]?, error: NSError?) -> Void in
            var promotions = ""
            let attendance = String(objects![0]["attendance"])
            let coverCharge = String(objects![0]["coverCharge"])
            let waitTime = String(objects![0]["waitTime"])
            if  String(objects![0]["promotionsDetails"]) != ""{
                promotions = "true"
            }else{
                promotions = "false"
            }
            let url = NSURL(string: String(objects![0]["imageUrl"]))
            let cellID = String(objects![0]["id"])
            let pic = NSData(contentsOfURL:url!)
            
            
            if error == nil {
                cell.id = cellID
                cell.attendance.text = attendance
                cell.coverCharge.text =  coverCharge
                cell.lineWait.text =  waitTime
                cell.promotions.text = promotions
                if pic != nil {
                    cell.picture.image = UIImage(data: pic!)
                }
                
                }
            
            
        })

        
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Businesses.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        let cell = tableView.cellForRowAtIndexPath(indexPath) as! barCell
        selectedCell = cell.id
        
        
    }
    
    
    override func viewDidAppear(animated: Bool) {
        BarList.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }












}
