//
//  SettingsViewController.swift
//  Mapaya
//
//  Created by Evan Renanto on 13/04/20.
//  Copyright © 2020 Azam Mukhtar. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    
    @IBOutlet weak var viewSpicy: UIView!
    @IBOutlet weak var viewVege: UIView!
    @IBOutlet weak var viewAllergie: UIView!
    
    @IBOutlet weak var outletSpicy: UIButton!
    @IBOutlet weak var outletVege: UIButton!
    @IBOutlet weak var outletAllergie: UIButton!
    
    var tempSpicy = 1
    var tempVege = 0
    var tempAllegie = 0
    
    var objectPreference = MiniDatabase.getUserTastePreferences()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        viewSpicy.layer.cornerRadius = 25
        viewVege.layer.cornerRadius = 25
        viewAllergie.layer.cornerRadius = 25
        
        decideButtonLayout()
    }
    
    func decideButtonLayout() {
        if objectPreference?.isLikeSpicyFood == true {
            outletSpicy.setImage(#imageLiteral(resourceName: "yes"), for: .normal)
        } else {
            outletSpicy.setImage(#imageLiteral(resourceName: "no"), for: .normal)
        }
        
        if objectPreference?.isUserVegan == true {
            outletVege.setImage(#imageLiteral(resourceName: "yes"), for: .normal)
        } else {
            outletVege.setImage(#imageLiteral(resourceName: "no"), for: .normal)
        }
        
        if objectPreference?.isHaveAllergies == true {
            outletAllergie.setImage(#imageLiteral(resourceName: "yes"), for: .normal)
        } else {
            outletAllergie.setImage(#imageLiteral(resourceName: "no"), for: .normal)
        }
    }
    
    @IBAction func buttonSpicy(_ sender: Any) {
        
        if(objectPreference?.isLikeSpicyFood == true){
            outletSpicy.setImage(#imageLiteral(resourceName: "no"), for: .normal)
            objectPreference?.isLikeSpicyFood = false
            MiniDatabase.saveUserTastePreferences(preference: objectPreference!)
        } else {
            outletSpicy.setImage(#imageLiteral(resourceName: "yes"), for: .normal)
            objectPreference?.isLikeSpicyFood = true
            MiniDatabase.saveUserTastePreferences(preference: objectPreference!)
        }
        
    }
    
    @IBAction func buttonVege(_ sender: Any) {
        
        if(objectPreference?.isUserVegan == true){
            outletVege.setImage(#imageLiteral(resourceName: "no"), for: .normal)
            objectPreference?.isUserVegan = false
            MiniDatabase.saveUserTastePreferences(preference: objectPreference!)
        } else {
            outletVege.setImage(#imageLiteral(resourceName: "yes"), for: .normal)
            objectPreference?.isUserVegan = true
            MiniDatabase.saveUserTastePreferences(preference: objectPreference!)
        }
        
    }
    
    @IBAction func buttonAllergie(_ sender: Any) {
        
        if(objectPreference?.isHaveAllergies == true){
            outletAllergie.setImage(#imageLiteral(resourceName: "no"), for: .normal)
            objectPreference?.isHaveAllergies = false
            MiniDatabase.saveUserTastePreferences(preference: objectPreference!)
        } else {
            outletAllergie.setImage(#imageLiteral(resourceName: "yes"), for: .normal)
            objectPreference?.isHaveAllergies = true
            MiniDatabase.saveUserTastePreferences(preference: objectPreference!)
        }
        
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
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
