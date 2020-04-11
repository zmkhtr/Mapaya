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
        DropDown2.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    //DAIRY
    @IBOutlet weak var DairyButtonOutlet: UIButton!
    
    //MEAT
    @IBOutlet weak var MeatButtonOutlet: UIButton!
    
    //VEGETABLE
    @IBOutlet weak var VegetableButtonOutlet: UIButton!
    
    //GRAINS
    @IBOutlet weak var GrainsButtonOutlet: UIButton!
    
    //FRUITS
    @IBOutlet weak var FruitsButtonOutlet: UIButton!
    
    //DROPDOWN
    @IBOutlet weak var DropDown: UIView!
    @IBOutlet weak var DropDown2: UIView!
    
    @IBAction func MeatButton(_ sender: Any) {
        if clicked == 0 {
            DropDown.isHidden = false
            DropDown2.isHidden = true
            DropDown.backgroundColor = UIColor.systemRed
            DropDown.layer.cornerRadius = 20
            clicked = 1
            DairyButtonOutlet.frame.origin = CGPoint.init(x: 1, y: 710)
            GrainsButtonOutlet.frame.origin = CGPoint.init(x: 125, y: 710)
            FruitsButtonOutlet.frame.origin = CGPoint.init(x: 250, y: 710)
        }
        else{
            DropDown.isHidden = true
            DropDown2.isHidden = true
            clicked = 0
            DairyButtonOutlet.frame.origin = CGPoint.init(x: 1, y: 560)
            GrainsButtonOutlet.frame.origin = CGPoint.init(x: 125, y: 560)
            FruitsButtonOutlet.frame.origin = CGPoint.init(x: 250, y: 560)
        }
    }
    
    @IBAction func VegetableButton(_ sender: Any) {
        if clicked == 0 {
            DropDown.isHidden = false
            DropDown2.isHidden = true
            clicked = 1
            DropDown.backgroundColor = UIColor.systemGreen
            DropDown.layer.cornerRadius = 20
            DairyButtonOutlet.frame.origin = CGPoint.init(x: 1, y: 710)
            GrainsButtonOutlet.frame.origin = CGPoint.init(x: 125, y: 710)
            FruitsButtonOutlet.frame.origin = CGPoint.init(x: 250, y: 710)
        }
        else{
            DropDown.isHidden = true
            DropDown2.isHidden = true
            clicked = 0
            DairyButtonOutlet.frame.origin = CGPoint.init(x: 1, y: 560)
            GrainsButtonOutlet.frame.origin = CGPoint.init(x: 125, y: 560)
            FruitsButtonOutlet.frame.origin = CGPoint.init(x: 250, y: 560)
        }
    }
    
    @IBAction func SeafoodButton(_ sender: Any) {
        if clicked == 0 {
            DropDown.isHidden = false
            DropDown2.isHidden = true
            DropDown.backgroundColor = UIColor.systemBlue
            DropDown.layer.cornerRadius = 20
            clicked = 1
            DairyButtonOutlet.frame.origin = CGPoint.init(x: 1, y: 710)
            GrainsButtonOutlet.frame.origin = CGPoint.init(x: 125, y: 710)
            FruitsButtonOutlet.frame.origin = CGPoint.init(x: 250, y: 710)
        }
        else{
            DropDown.isHidden = true
            DropDown2.isHidden = true
            clicked = 0
            DairyButtonOutlet.frame.origin = CGPoint.init(x: 1, y: 560)
            GrainsButtonOutlet.frame.origin = CGPoint.init(x: 125, y: 560)
            FruitsButtonOutlet.frame.origin = CGPoint.init(x: 250, y: 560)
        }
    }
    
    
    @IBAction func DairyButton(_ sender: Any) {
        if clicked == 0 {
            DropDown2.isHidden = false
            DropDown.isHidden = true
            DropDown2.backgroundColor = UIColor.systemGray
            DropDown2.layer.cornerRadius = 20
            clicked = 1
            DairyButtonOutlet.frame.origin = CGPoint.init(x: 1, y: 560)
            GrainsButtonOutlet.frame.origin = CGPoint.init(x: 125, y: 560)
            FruitsButtonOutlet.frame.origin = CGPoint.init(x: 250, y: 560)
        }
        else{
            DropDown2.isHidden = true
            DropDown.isHidden = true
            clicked = 0
            DairyButtonOutlet.frame.origin = CGPoint.init(x: 1, y: 560)
            GrainsButtonOutlet.frame.origin = CGPoint.init(x: 125, y: 560)
            FruitsButtonOutlet.frame.origin = CGPoint.init(x: 250, y: 560)
        }
    }
    
    @IBAction func GrainsButton(_ sender: Any) {
        if clicked == 0 {
            DropDown2.isHidden = false
            DropDown.isHidden = true
            DropDown2.backgroundColor = UIColor.systemOrange
            DropDown2.layer.cornerRadius = 20
            clicked = 1
            DairyButtonOutlet.frame.origin = CGPoint.init(x: 1, y: 560)
            GrainsButtonOutlet.frame.origin = CGPoint.init(x: 125, y: 560)
            FruitsButtonOutlet.frame.origin = CGPoint.init(x: 250, y: 560)
            
        }
        else{
            DropDown2.isHidden = true
            DropDown.isHidden = true
            clicked = 0
            DairyButtonOutlet.frame.origin = CGPoint.init(x: 1, y: 560)
            GrainsButtonOutlet.frame.origin = CGPoint.init(x: 125, y: 560)
            FruitsButtonOutlet.frame.origin = CGPoint.init(x: 250, y: 560)
            
        }
    }
    
    @IBAction func FruitsButton(_ sender: Any) {
        if clicked == 0 {
            DropDown2.isHidden = false
            DropDown.isHidden = true
            DropDown2.backgroundColor = UIColor.systemYellow
            DropDown2.layer.cornerRadius = 20
            clicked = 1
            DairyButtonOutlet.frame.origin = CGPoint.init(x: 1, y: 560)
            GrainsButtonOutlet.frame.origin = CGPoint.init(x: 125, y: 560)
            FruitsButtonOutlet.frame.origin = CGPoint.init(x: 250, y: 560)
            
        }
        else{
            DropDown2.isHidden = true
            DropDown.isHidden = true
            clicked = 0
            DairyButtonOutlet.frame.origin = CGPoint.init(x: 1, y: 560)
            GrainsButtonOutlet.frame.origin = CGPoint.init(x: 125, y: 560)
            FruitsButtonOutlet.frame.origin = CGPoint.init(x: 250, y: 560)
            
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
