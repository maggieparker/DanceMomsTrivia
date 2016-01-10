import UIKit

class thirdViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel!
    var incorrectAnswers : Int = 0
    
    
    override func viewDidLoad()
    {
        scoreLabel.text = "You got \(incorrectAnswers) incorrect out of 10!"
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        var thirdView = segue.destinationViewController as! ViewController
    }
}