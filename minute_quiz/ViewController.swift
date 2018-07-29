//
//  ViewController.swift
//  minute_quiz
//
//  Created by MacBook Pro on 7/29/18.
//  Copyright © 2018 Code Drizzlers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //create a QuestioBank object
    let allQuestions = QuestionBank()
    
    //create a variable
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0
    
    //for track the score
    var score : Int = 0
    
    //for the Timer
    
    
    //ui elements from the storyboard
    @IBOutlet weak var questionImage: UIImageView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //creating question object
        /*//next question function is alternative for below three line
         
        let firstQuestion = allQuestions.list[0]
        questionImage.image = firstQuestion.questionImage
        questionLabel.text = firstQuestion.questionText
            */
        nextQuestion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    @IBAction func answerPressed(_ sender: AnyObject) {
        if (sender as AnyObject).tag == 1 {
            pickedAnswer = true
        } else if sender.tag == 2 {
            pickedAnswer = false
        }
        
        checkAnswer()
        
        //after checking the answer proceed to the next question
        questionNumber = questionNumber + 1
        
        nextQuestion()
        }
    
    func updateUI() {
        //scoreLabel.text = String(score)
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(questionNumber + 1) / 5"
        
        progressBar.frame.size.width = (view.frame.size.width / 5) * CGFloat(questionNumber + 1)
    }
    
    
    func nextQuestion() {
        
        if questionNumber <= 4 {
            
            questionImage.image = allQuestions.list[questionNumber].questionImage
            questionLabel.text = allQuestions.list[questionNumber].questionText
            
            updateUI()
        } else {
            //create an AlertViewController object
            let alert = UIAlertController(title: "Awesome", message: "You have finished the quiz", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler:
                { (UIAlertAction) in
                self.startOver()
            })
            alert.addAction(restartAction)
            
            present(alert, animated: true, completion: nil)
            
        }
    }
    
    func checkAnswer() {
        let correctAnswer = allQuestions.list[questionNumber].answer
        
        if correctAnswer == pickedAnswer {
            print("you got it")
            score = score + 1
        
        } else {
            print("shame")
        }
    }
    
    func startOver() {
        score = 0
        questionNumber = 0
        nextQuestion()
    }
}

