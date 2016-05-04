import UIKit
import Parse
import Bolts
import OAuthSwift
import ParseFacebookUtilsV4
import FBSDKCoreKit
import FBSDKLoginKit


var BarName = String()
var Businesses = [Business]()
var selectedCell = String("Selected")




class ViewController: UIViewController,UITableViewDelegate {
    
    
    
    
    @IBAction func userLogin(sender: AnyObject) {
        let permissions = ["public_profile"]
        
        PFFacebookUtils.logInInBackgroundWithReadPermissions(permissions) {
            (user: PFUser?, error: NSError?) -> Void in
            if error == error {
                print(error)
                
            } else {
                
                if let user = user {
                    
                    print(user)
                    
                    
                }
                
            }
            
            
            
    
            

            
            
            

            
}
        

//        let apiObject = FactualAPI(APIKey:"aoYh4mPCxZvYjXGZjC8OzHsIZEGACxN8bTkUCL4X" , secret:"LGMb0tuRRGkxdzhFUTvcPu1jKTLXnmVWumeIbU9Y")
//        var query = FactualQuery()
//        var categories = []
//        query.addRowFilter(<#T##rowFilter: FactualRowFilter!##FactualRowFilter!#>)
//        apiObject.facetTable(<#T##tableId: String!##String!#>, optionalQueryParams: <#T##FactualQuery!#>, withDelegate:<#T##FactualAPIDelegate!#>)

        
        
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
                
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

