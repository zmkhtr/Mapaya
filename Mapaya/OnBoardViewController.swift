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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func noButton(_ sender: Any) {
        temp+=1
        if(temp == 1) {
            hasil+=0
        } else if(temp == 2) {
            hasil+=0
        } else if(temp == 3) {
            hasil+=0
            performSegue(withIdentifier: "toHomePage", sender: self)
        } else {
            preferenceQuestion.text = listQuestions[temp]
            let question: String = "questions"
            preferenceIndicator.image =  UIImage(named: "\(question)-\(temp+1)")
        }
    }
    
    @IBAction func yesButton(_ sender: Any) {
       temp+=1
        if(temp == 1) {
            hasil+=spicy
        } else if(temp == 2) {
            hasil+=vege
        } else if(temp == 3) {
            hasil+=vege
            performSegue(withIdentifier: "toHomePage", sender: self)
        } else {
            preferenceQuestion.text = listQuestions[temp]
            let question: String = "questions"
            preferenceIndicator.image =  UIImage(named: "\(question)-\(temp+1)")
        }
        
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
