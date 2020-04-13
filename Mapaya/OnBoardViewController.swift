//
//  OnBoardViewController.swift
//  Mapaya
//
//  Created by Azam Mukhtar on 07/04/20.
//  Copyright © 2020 Azam Mukhtar. All rights reserved.
//

import UIKit

class OnBoardViewController: UIViewController {
    
    @IBOutlet weak var preferenceIndicator: UIImageView!
    @IBOutlet weak var preferenceQuestion: UILabel!
    
    var listQuestions = ["Do you like spicy food?", "Are you a vegetarian or vegan?", "Do you have any allegies?"]
    
    var temp = 0
    let spicy = 1
    let vege = 2
    let allergie = 4
    var hasil = 0
    var pref = Preference(isLikeSpicyFood: false, isUserVegan: false, isHaveAllergies: false)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func noButton(_ sender: Any) {
        temp+=1
        if(temp == 1) {
            hasil+=0
            preferenceQuestion.text = listQuestions[temp]
            let question: String = "questions"
            preferenceIndicator.image =  UIImage(named: "\(question)-\(temp+1)")
        } else if(temp == 2) {
            hasil+=0
            preferenceQuestion.text = listQuestions[temp]
            let question: String = "questions"
            preferenceIndicator.image =  UIImage(named: "\(question)-\(temp+1)")
        } else if(temp == 3) {
            hasil+=0
            MiniDatabase.saveUserTastePreferences(preference: pref)
            performSegue(withIdentifier: "toHomePage", sender: self)
        }
    }
    
    @IBAction func yesButton(_ sender: Any) {
       temp+=1
        if(temp == 1) {
            hasil+=spicy
            pref.isLikeSpicyFood = true
            preferenceQuestion.text = listQuestions[temp]
            let question: String = "questions"
            preferenceIndicator.image =  UIImage(named: "\(question)-\(temp+1)")
        } else if(temp == 2) {
            hasil+=vege
            pref.isUserVegan = true
            preferenceQuestion.text = listQuestions[temp]
            let question: String = "questions"
            preferenceIndicator.image =  UIImage(named: "\(question)-\(temp+1)")
        } else if(temp == 3) {
            hasil+=vege
            pref.isHaveAllergies = true
            MiniDatabase.saveUserTastePreferences(preference: pref)
            performSegue(withIdentifier: "toHomePage", sender: self)
        }
    }
    
    @IBAction func skipButton(_ sender: Any) {
        performSegue(withIdentifier: "toHomePage", sender: self)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
