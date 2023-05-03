//
//  ViewController.swift
//  catchKenny
//
//  Created by Ислам Пулатов on 4/30/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var timeLeftLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var highScoreLabel: UILabel!
    
    @IBOutlet var kenny1: UIImageView!
    @IBOutlet var kenny2: UIImageView!
    @IBOutlet var kenny3: UIImageView!
    @IBOutlet var kenny4: UIImageView!
    @IBOutlet var kenny5: UIImageView!
    @IBOutlet var kenny6: UIImageView!
    @IBOutlet var kenny7: UIImageView!
    @IBOutlet var kenny8: UIImageView!
    @IBOutlet var kenny9: UIImageView!
    
    var timer = Timer()
    @objc var hideTimer = Timer()
    var counter = 0
    var score = 0
    var highScore = 0
    var kennyArr = [UIImageView]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUppViewLogic()
        
    }
    
    func setUppViewLogic() {
        
        scoreLabel.text = "Score: \(score)"
        
        kenny1.isUserInteractionEnabled = true
        kenny2.isUserInteractionEnabled = true
        kenny3.isUserInteractionEnabled = true
        
        kenny4.isUserInteractionEnabled = true
        kenny5.isUserInteractionEnabled = true
        kenny6.isUserInteractionEnabled = true
        
        kenny7.isUserInteractionEnabled = true
        kenny8.isUserInteractionEnabled = true
        kenny9.isUserInteractionEnabled = true
        
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        kenny1.addGestureRecognizer(recognizer1)
        kenny2.addGestureRecognizer(recognizer2)
        kenny3.addGestureRecognizer(recognizer3)
        
        kenny4.addGestureRecognizer(recognizer4)
        kenny5.addGestureRecognizer(recognizer5)
        kenny6.addGestureRecognizer(recognizer6)
        
        kenny7.addGestureRecognizer(recognizer7)
        kenny8.addGestureRecognizer(recognizer8)
        kenny9.addGestureRecognizer(recognizer9)
        
        kennyArr = [kenny1, kenny2, kenny3, kenny4, kenny5, kenny6, kenny7, kenny8, kenny9]
        
        
        
//        MARK: Timer
        
        counter = 10
        
        timeLeftLabel.text = "Time left: \(counter)"
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        
        hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hideKenny), userInfo: nil, repeats: true)
        
        hideKenny()
        
    }
    
    @objc func hideKenny() {
        
        for kenny in kennyArr {
            kenny.isHidden = true
        }
        
        
        let randomKenny = Int(arc4random_uniform(UInt32(kennyArr.count - 1)))
        kennyArr[randomKenny].isHidden = false
        
    }
    
    
    @objc func increaseScore() {
        
        score += 1
        scoreLabel.text = "Score: \(score)"
        
    }
    
    
    @objc func countDown() {
        
        counter -= 1
        timeLeftLabel.text = "Time left: \(counter)"
        
        if counter == 0 {
            
            timer.invalidate()
            hideTimer.invalidate()
            
            
            
            //            MARK: Alert
            
            makeAlert(title: "Time`s up!", message: "Do you want to play again?")
            
        }
        
    }
    
    
    func makeAlert(title: String, message: String) {
        
        let alert  = UIAlertController(title: title , message: message , preferredStyle: UIAlertController.Style.alert)
        
        let ok = UIAlertAction(title: "Ok", style: .default)
        
        let replay = UIAlertAction(title: "Replay", style: .default) { UIAlertAction in
            
            self.score = 0
            self.scoreLabel.text = "Score: \(self.score)"
            
            self.counter = 10
            self.timeLeftLabel.text = "Time left: \(self.counter)"
            
            
            self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countDown), userInfo: nil, repeats: true)
            self.hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.hideKenny), userInfo: nil, repeats: true)
            
            
        }
        
        alert.addAction(ok)
        alert.addAction(replay)

        
        
        self.present(alert, animated: true)
        
        
    }
    
    
}

