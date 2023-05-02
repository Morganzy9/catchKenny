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
    
    @IBOutlet var kennyImageOne: UIImageView!
    @IBOutlet var kennyImageTwo: UIImageView!
    @IBOutlet var kennyImageThree: UIImageView!
    @IBOutlet var kennyImageFour: UIImageView!
    @IBOutlet var kennyImageFive: UIImageView!
    @IBOutlet var kennyImageSix: UIImageView!
    @IBOutlet var kennyImageSeven: UIImageView!
    @IBOutlet var kennyImageEight: UIImageView!
    @IBOutlet var kennyImageNine: UIImageView!
    
    var timer = Timer()
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
        highScoreLabel.text = "High Score \(highScore)"
        
        kennyArr = [kennyImageOne, kennyImageTwo, kennyImageThree, kennyImageFour, kennyImageFive, kennyImageSix, kennyImageSeven, kennyImageEight, kennyImageNine]
        
        kennyImageOne.isUserInteractionEnabled = true
        kennyImageTwo.isUserInteractionEnabled = true
        kennyImageThree.isUserInteractionEnabled = true
        
        kennyImageFour.isUserInteractionEnabled = true
        kennyImageFive.isUserInteractionEnabled = true
        kennyImageSix.isUserInteractionEnabled = true
        
        kennyImageSeven.isUserInteractionEnabled = true
        kennyImageEight.isUserInteractionEnabled = true
        kennyImageNine.isUserInteractionEnabled = true
        
        
        let recognizer1 = UIGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer2 = UIGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer3 = UIGestureRecognizer(target: self, action: #selector(increaseScore))
        
        let recognizer4 = UIGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer5 = UIGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer6 = UIGestureRecognizer(target: self, action: #selector(increaseScore))
        
        let recognizer7 = UIGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer8 = UIGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer9 = UIGestureRecognizer(target: self, action: #selector(increaseScore))
        
        kennyImageOne.addGestureRecognizer(recognizer1)
        kennyImageTwo.addGestureRecognizer(recognizer2)
        kennyImageThree.addGestureRecognizer(recognizer3)
        
        kennyImageFour.addGestureRecognizer(recognizer4)
        kennyImageFive.addGestureRecognizer(recognizer5)
        kennyImageSix.addGestureRecognizer(recognizer6)
        
        kennyImageSeven.addGestureRecognizer(recognizer7)
        kennyImageEight.addGestureRecognizer(recognizer8)
        kennyImageNine.addGestureRecognizer(recognizer9)
        
        
//        MARK: Timer
        
        counter = 10
        
        timeLeftLabel.text = "Time left: \(counter)"
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        
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
            
//            MARK: Alert
            
//            makeAlert(title: "", message: )
            
        }
        
    }
    
    
    func makeAlert(title: String, message: String) {
        
        var alert  = UIAlertController(title: title , message: message , preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "Ok", style: .default)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(ok)
        alert.addAction(cancel)
        
        self.present(alert, animated: true)
        
        
    }


}

