//
//  FilterViewController.swift
//  Mapaya
//
//  Created by Stendy Antonio on 08/04/20.
//  Copyright © 2020 Azam Mukhtar. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {
    
    var clicked = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DropDown.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    //DAIRY
    @IBOutlet weak var DairyButtonOutlet: UIButton!
    @IBOutlet weak var DairyLogoOutlet: UIImageView!
    @IBOutlet weak var DairyLabelOutlet: UILabel!
    
    //MEAT
    @IBOutlet weak var MeatButtonOutlet: UIButton!
    
    //VEGETABLE
    @IBOutlet weak var VegetableButtonOutlet: UIButton!
    
    //DROPDOWN
    @IBOutlet weak var DropDown: UIView!
    
    @IBAction func MeatButton(_ sender: Any) {
        if clicked == 0 {
            DropDown.isHidden = false
            clicked = 1
            MeatButtonOutlet.frame = CGRect(x: 20, y: 455, width: 102, height: 130)
            DairyButtonOutlet.frame = CGRect(x: 20, y: 730, width: 102, height: 115)
        }
        else{
            DropDown.isHidden = true
            clicked = 0
            MeatButtonOutlet.frame = CGRect(x: 20, y: 455, width: 102, height: 115)
            DairyButtonOutlet.frame = CGRect(x: 20, y: 595, width: 102, height: 115)
            
        }
    }
    
    @IBAction func VegetableButton(_ sender: Any) {
        if clicked == 0 {
            DropDown.isHidden = false
            clicked = 1
            VegetableButtonOutlet.frame = CGRect(x: 155, y: 455, width: 102, height: 130)
            DairyButtonOutlet.frame = CGRect(x: 20, y: 730, width: 102, height: 115)
        }
        else{
            DropDown.isHidden = true
            clicked = 0
            VegetableButtonOutlet.frame = CGRect(x: 155, y: 455, width: 102, height: 115)
            DairyButtonOutlet.frame = CGRect(x: 20, y: 595, width: 102, height: 115)
        }
    }
    
    @IBAction func DismissButton(_ sender: Any) {
    }
    
    @IBAction func DoneButton(_ sender: Any) {
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
