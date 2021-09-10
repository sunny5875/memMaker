//
//  ViewController.swift
//  memMaker
//
//  Created by 현수빈 on 2021/04/16.
//

import UIKit


enum topChoice {
    case sunglass,handup,love
    
    var emoji : String{
        switch self{
        case .sunglass : return "🕶"
        case .handup : return "🙋🏻‍♀️"
        case .love : return"💕"
        }
    }
    
    var description: String{
        switch self{
        case .sunglass : return "you know what is cool"
        case .handup : return "you know what makes me mad"
        case .love : return"you know what I love"
        }
    }
    
 
}

enum bottomChoice {
    case cat,dog,rabbit
    var emoji : String{
        switch self{
        case .cat : return "🐱"
        case .dog : return "🐶"
        case .rabbit : return "🐰"
        }
    }
    
    var description: String{
        switch self{
        case .cat : return "cats wearing hats"
        case .dog : return "dog is cute"
        case .rabbit : return"rabbit is eating carrot"
        }
    }
    var image : String{
        switch self{
        case .cat : return "cat"
        case .dog : return "dog"
        case .rabbit : return"rabbit"
        }
    }
}

class ViewController: UIViewController {

    @IBOutlet var questionSegmentedControl: UISegmentedControl!
    
    @IBOutlet var answerSegmentControl: UISegmentedControl!
    
    @IBOutlet var uiImage: UIImageView!
    
    @IBOutlet var topLabel: UILabel!
    
    @IBOutlet var bottomLabel: UILabel!
    
    let topChoices:[topChoice] = [.sunglass,.handup,.love]
    let bottomChoices:[bottomChoice] = [.cat,.dog,.rabbit]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resetSegmentControl()
        resetSegmentControlBottom()
    
        
    }
    
    
    func resetSegmentControl(){
        //segment control만드는 함수
        questionSegmentedControl.removeAllSegments()
        
        for choice in topChoices {
            questionSegmentedControl.insertSegment(withTitle: choice.emoji, at: topChoices.count, animated: false) }
        
        
        questionSegmentedControl.selectedSegmentIndex = 0
        
        topLabel.text = topChoices[questionSegmentedControl.selectedSegmentIndex].description

       
    
    }
    
    func resetSegmentControlBottom(){
        answerSegmentControl.removeAllSegments()
      
        for choice in bottomChoices {
            answerSegmentControl.insertSegment(withTitle: choice.emoji, at: bottomChoices.count, animated: false) }
     
        answerSegmentControl.selectedSegmentIndex = 0
        
        bottomLabel.text = bottomChoices[answerSegmentControl.selectedSegmentIndex].description
        uiImage.image=UIImage(named: "cat")

       
    
    }
    
    
    @IBAction func topSCTapped(_ sender: Any) {
        topLabel.text = topChoices[questionSegmentedControl.selectedSegmentIndex].description
      
    
    }
    

    @IBAction func bottomSCTapped(_ sender: Any) {
        bottomLabel.text = bottomChoices[answerSegmentControl.selectedSegmentIndex].description
        uiImage.image = UIImage(named: bottomChoices[answerSegmentControl.selectedSegmentIndex].image)
    }
}

