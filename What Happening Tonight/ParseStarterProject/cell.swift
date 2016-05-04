//
//  cell.swift
//  ParseStarterProject-Swift
//
//  Created by Dan Levine on 5/2/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import Foundation
import UIKit
import Parse
import Bolts
import OAuthSwift
import ParseFacebookUtilsV4
import FBSDKCoreKit
import FBSDKLoginKit


class barCell: UITableViewCell{

    @IBOutlet var picture: UIImageView!
    
    @IBOutlet var BarName: UILabel!

    @IBOutlet var attendance: UILabel!

    @IBOutlet var coverCharge: UILabel!

    @IBOutlet var lineWait: UILabel!

    @IBOutlet var promotions: UILabel!
    
    var id: String = ""
    
    
    
    
    
//    init(bar: String, barAttendance: Int, cover: Double, line: Int, promotions: Bool){
//        
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    


    

}