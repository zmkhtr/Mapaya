//
//  DetailPage.swift
//  Mapaya
//
//  Created by Davia Belinda Hidayat on 08/04/20.
//  Copyright © 2020 Azam Mukhtar. All rights reserved.
//

import UIKit

class DetailPage: UIViewController {
    
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailFoodName: UILabel!
    @IBOutlet weak var detailMinutes: UILabel!
    @IBOutlet weak var detailPerson: UILabel!
    @IBOutlet weak var detailIngredients: UILabel!
    @IBOutlet weak var detailSteps: UILabel!
    @IBOutlet weak var detailLevelView: UIView!
    @IBOutlet weak var detailLevelLabel: UILabel!
    
    
    var recipe: Recipe?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailLevelView.layer.cornerRadius = 8
        initData()
    }
    
    func initData() {
        if let recipe = recipe {
            detailImage.image = UIImage(named: recipe.image)
            detailFoodName.text = recipe.name
            detailMinutes.text = recipe.minuteEstimate
            detailPerson.text = recipe.portionEstimate
            detailLevelLabel.text = recipe.level
            detailLevelView.backgroundColor = checkColor(level: recipe.level.lowercased())
        }
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
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
