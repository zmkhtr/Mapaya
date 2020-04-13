//
//  HomeViewController.swift
//  Mapaya
//
//  Created by Azam Mukhtar on 08/04/20.
//  Copyright © 2020 Azam Mukhtar. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var overlayView: UIView!
    var divisor : CGFloat!
    
    var recipes: [Recipe] = []
    var singleRecipe : Recipe?
    
    @IBOutlet weak var labelDifficulty: UILabel!
    
    @IBOutlet weak var labelDifficultyBackground: UIView!
    
    @IBOutlet weak var labelPerson: UILabel!
    
    @IBOutlet weak var labelTime: UILabel!
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var imageFood: UIImageView!
    
    func initData() {
        recipes = [
            Recipe(recipeID: 1, name: "Egg Sandwich", image: "egg-sandwich", minuteEstimate: "20 minutes", portionEstimate: "2 people", level: "Easy"),
            Recipe(recipeID: 2, name: "French Toast", image: "french-toast", minuteEstimate: "30 minutes", portionEstimate: "2 people", level: "Easy"),
            Recipe(recipeID: 3, name: "Cheese Burger", image: "cheese-burger", minuteEstimate: "60 minutes", portionEstimate: "2 people", level: "Hard"),
            Recipe(recipeID: 4, name: "Egg Sandwich", image: "egg-sandwich", minuteEstimate: "20 minutes", portionEstimate: "2 people", level: "Easy"),
            Recipe(recipeID: 5, name: "French Toast", image: "french-toast", minuteEstimate: "30 minutes", portionEstimate: "2 people", level: "Medium"),
            Recipe(recipeID: 6, name: "Cheese Burger", image: "cheese-burger", minuteEstimate: "60 minutes", portionEstimate: "2 people", level: "Hard"),
            Recipe(recipeID: 7, name: "Pizza", image: "pizza", minuteEstimate: "60 minutes", portionEstimate: "4 people", level: "Hard"),
            Recipe(recipeID: 8, name: "Blueberry Pancake", image: "blueberry-pancake", minuteEstimate: "40 minutes", portionEstimate: "4 people", level: "Easy"),
            Recipe(recipeID: 9, name: "Pumpkin Soup", image: "pumpkin-soup", minuteEstimate: "45 minutes", portionEstimate: "2 people", level: "Medium"),
            Recipe(recipeID: 10, name: "Dumplings", image: "dumplings", minuteEstimate: "60 minutes", portionEstimate: "2 people", level: "Hard")
            
        ]
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        addGradientToView(view: overlayView)
        setData()
        
        divisor = (view.frame.width / 2) / 0.61
        //        MiniDatabase.saveUserBookmark(bookmark: Bookmark(recipe: recipes))
        //        saveToBookmark(recipes: recipes[1])
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func panCard(_ sender: UIPanGestureRecognizer) {
        let card = sender.view!
        let point = sender.translation(in: view)
        let xFromCenter = card.center.x - view.center.x
        
        card.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
        
        let scale = min(100/abs(xFromCenter), 1)
        card.transform = CGAffineTransform(rotationAngle: xFromCenter/divisor).scaledBy(x: scale, y: scale)
        
        if xFromCenter > 0 {
            thumbImageView.image = #imageLiteral(resourceName: "bookmark-button")
            //            thumbImageView.tintColor = UIColor.blue
        } else {
            thumbImageView.image = #imageLiteral(resourceName: "dislike-button")
            //            thumbImageView.tintColor = UIColor.red
        }
        
        thumbImageView.alpha = abs(xFromCenter) / view.center.x
        
        if sender.state == UIGestureRecognizer.State.ended {
            
            //            if card.alpha == 0 {
            //                resetCard()
            //            }
            if card.center.x < 75 {
                //Move to left
                UIView.animate(withDuration: 0.3) {
                    card.center = CGPoint(x: card.center.x - 200, y: card.center.y + 75)
                    card.alpha = 0
                    self.resetCard()
                }
            } else if card.center.x > (view.frame.width - 75){
                //Move to right
                UIView.animate(withDuration: 0.3) {
                    card.center = CGPoint(x: card.center.x + 200, y: card.center.y + 75)
                    card.alpha = 0
                    self.resetCard()
                }
            }
            
            UIView.animate(withDuration: 0.2) {
                //                self.cardView.center = self.view.center
                card.center = self.view.center
                self.thumbImageView.alpha = 0
            }
        }
        
        
    }
    
    //    func saveToBookmark(recipes : Recipe){
    //        let currentBookmark = MiniDatabase.getUserBookmark()! as Bookmark
    //        let addedBookmark = Bookmark(recipe: [currentBookmark.recipe])
    //        MiniDatabase.saveUserBookmark(bookmark: newBookmark)
    //        print(" APA NIH \(MiniDatabase.getUserBookmark()?.recipe[0].name)")
    //    }
    
    func resetCard(){
        UIView.animate(withDuration: 0.2) {
            self.thumbImageView.alpha = 0
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { // Change `2.0` to the desired number of seconds.
                self.cardView.center = self.view.center
                self.cardView.alpha = 1
                self.setData()
                self.cardView.transform = .identity
            }
        }
    }
    
    func setData(){
        let randomNumber = Int.random(in: 0...self.recipes.capacity-1)
        self.imageFood.image = UIImage(named: self.recipes[randomNumber].image)
        //        self.cardView.alpha = 1
        self.labelName.text = self.recipes[randomNumber].name
        self.labelTime.text = self.recipes[randomNumber].minuteEstimate
        self.labelPerson.text = self.recipes[randomNumber].portionEstimate
        self.labelDifficulty.text = self.recipes[randomNumber].level
        self.labelDifficultyBackground.backgroundColor = checkColor(level: self.recipes[randomNumber].level.lowercased())
    }
    
    
    func checkColor(level: String) -> UIColor {
        switch level {
        case "easy":
            return #colorLiteral(red: 0.3529411765, green: 0.4823529412, blue: 0.4117647059, alpha: 1)
        case "medium":
            return #colorLiteral(red: 0.9019607843, green: 0.6784313725, blue: 0.3137254902, alpha: 1)
        case "hard":
            return #colorLiteral(red: 0.8509803922, green: 0.2274509804, blue: 0.1098039216, alpha: 1)
        default:
            return #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
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
    
    func addGradientToView(view: UIView)
    {
            //gradient layer
            let gradientLayer = CAGradientLayer()
            
            //define colors
            gradientLayer.colors = [UIColor.clear.cgColor,UIColor.black.cgColor]
            
            //define locations of colors as NSNumbers in range from 0.0 to 1.0
            //if locations not provided the colors will spread evenly
            gradientLayer.locations = [0.7, 1]
            gradientLayer.opacity = 0.8
            
            //define frame
            gradientLayer.frame = view.bounds
            
            //insert the gradient layer to the view layer
            view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
}
