import UIKit

class ViewController: UIViewController
{
        override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
        {
            var view = segue.destinationViewController as! SecondViewController
        }
    
}