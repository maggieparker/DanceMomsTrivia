import UIKit

class SecondViewController: UIViewController
{
    
    @IBOutlet weak var answer1: GridLabel!
    @IBOutlet weak var answer2: GridLabel!
    @IBOutlet weak var answer3: GridLabel!
    @IBOutlet weak var answer4: GridLabel!
    @IBOutlet weak var questionTextView: UITextView!
    @IBOutlet weak var myBackgroundView: UIView!
    @IBOutlet weak var ifCorrectLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var seeMyScoreButton: UIButton!
    
    var labelsArray = [GridLabel]()
    var correctAnswerNumber = Int()
    var currentQuestion : Int = 1
    var incorrectAnswers : Int = 0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        labelsArray.append(answer1)
        labelsArray.append(answer2)
        labelsArray.append(answer3)
        labelsArray.append(answer4)
        chooseQuestion(1)
        nextButton.enabled = false
        seeMyScoreButton.hidden = true
    }
  
    
    func chooseQuestion(questionNumber : Int)
    {
        switch questionNumber
        {
        case 1:
            questionTextView.text = "Which one of these girls has not forgotten one of their dances?"
            answer1.text = "Kenzie"
            answer2.text = "Nia"
            answer3.text = "Kendall"
            answer4.text = "Paige"
            correctAnswerNumber = 3
        case 2:
            questionTextView.text = "Why did brooke quit dance in season 2?"
            answer1.text = "She wanted to do cheerleading"
            answer2.text = "She was tired of her mom and Abby fighting"
            answer3.text = "She broke her ankel"
            answer4.text = "She thought she was to old for everyone"
            correctAnswerNumber = 1
        case 3:
            questionTextView.text = "What was Nia's first solo?"
            answer1.text = "Working girl"
            answer2.text = "They call me Laquifa"
            answer3.text = "Bye Falicia"
            answer4.text = "Frost"
            correctAnswerNumber = 2
        case 4:
            questionTextView.text = "What did paige pursue after Dancing at the ALDC"
            answer1.text = "Youtube"
            answer2.text = "Music Video"
            answer3.text = "Modeling"
            answer4.text = "Dance"
            correctAnswerNumber = 3
        case 5:
            questionTextView.text = "Who was the first to leave the ALDC"
            answer1.text = "Vivi-Anne and Cathy"
            answer2.text = "Paige, Brooke, and Kelly"
            answer3.text = "Chloe and Christi"
            answer4.text = "Nia and Holly"
            correctAnswerNumber = 1
        case 6:
            questionTextView.text = "What was Maddie's first payed job"
            answer1.text = "Sia music video"
            answer2.text = "Being a judge at Jump Dance Competition"
            answer3.text = "Joffery Ballet"
            answer4.text = "Drop Dead Diva"
            correctAnswerNumber = 4
        case 7:
            questionTextView.text = "With which of these solos did Chloe win season 2 nationals with"
            answer1.text = "Seeing Red"
            answer2.text = "Bollywood and Vine"
            answer3.text = "Soaring"
            answer4.text = "Silence"
            correctAnswerNumber = 4
        case 8:
            questionTextView.text = "Which solo did Mackenzie beat Maddie with"
            answer1.text = "Sink or swim"
            answer2.text = "The love doctor"
            answer3.text = "The bat cave"
            answer4.text = "Cry"
            correctAnswerNumber = 1
        case 9:
            questionTextView.text = "Which of these is Abby's number on catch phrase"
            answer1.text = "Everyone's replaceable"
            answer2.text = "Good Job!"
            answer3.text = "I hate the moms"
            answer4.text = "Once a dancer, always a dancer"
            correctAnswerNumber = 1
        case 10:
            questionTextView.text = "The ALDC was in _____ but they moved to ______."
            answer1.text = "LA, NYC"
            answer2.text = "Pittsburgh, LA"
            answer3.text = "Boston, Miami"
            answer4.text = "Miami, NYC"
            correctAnswerNumber = 2
        default:
            questionTextView.text = "Where did the ALDC and where are the moving to?"
            answer1.text = "LA to NYC"
            answer2.text = "Pittsburgh to LA"
            answer3.text = "Boston to Miami"
            answer4.text = "Miami to NYC"
            correctAnswerNumber = 2
        }
    }

        func correctAnswer(a:Int) -> Bool
        {
            if a == correctAnswerNumber
            {
                return true
            }
            return false
        }
   
    func changeBackgroundColor(color:UIColor)
    {
        view.backgroundColor = color
        questionTextView.backgroundColor = color
        myBackgroundView.backgroundColor = color
    }
    
    
    @IBAction func tapGesture(sender: UITapGestureRecognizer)
    {
        var counter : Int = 1
        for label in labelsArray {
            if CGRectContainsPoint(label.frame, sender.locationInView(myBackgroundView))
            {
                if correctAnswer(counter)
                {
                    ifCorrectLabel.text = "Correct!"
                    changeBackgroundColor(UIColor.greenColor())
                    if currentQuestion >= 10
                    {
                        seeMyScoreButton.hidden = false
                        nextButton.hidden = true
                    }
                    else
                    {
                        nextButton.enabled = true
                    }
                }
                else
                {
                    ifCorrectLabel.text = "Wrong, Try again!"
                    changeBackgroundColor(UIColor.redColor())
                    incorrectAnswers = incorrectAnswers + 1
                }
                
            }
            counter = counter + 1
        }
    }
    
    @IBAction func nextQuestion(sender: AnyObject)
    {
        currentQuestion = currentQuestion + 1
        chooseQuestion(currentQuestion)
        nextButton.enabled = false
        ifCorrectLabel.text = ""
        changeBackgroundColor(UIColor.whiteColor())
        
    }
    
        override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
        {
            var thirdView = segue.destinationViewController as! thirdViewController
            thirdView.incorrectAnswers = incorrectAnswers
        }
}