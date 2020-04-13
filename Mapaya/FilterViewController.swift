//
//  FilterViewController.swift
//  Mapaya
//
//  Created by Stendy Antonio on 08/04/20.
//  Copyright © 2020 Azam Mukhtar. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var IngredientsArray = [""]
    var DropdownArray = [""]
    var Dropdown2Array = [""]
    
    @IBOutlet weak var LabelView: UILabel!
    
    var clicked = 0
    
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
    @IBOutlet weak var DropDown: UICollectionView!
    @IBOutlet weak var DropDown2: UICollectionView!
    
    @IBOutlet weak var IngredientsView: UICollectionView!
    
    @IBOutlet weak var collectionLayout: UICollectionViewFlowLayout!{
        didSet{
            collectionLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
    }
    @IBOutlet weak var collectionLayout1: UICollectionViewFlowLayout!{
        didSet{
            collectionLayout1.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
    }
    
    @IBOutlet weak var collectionLayout2: UICollectionViewFlowLayout!{
        didSet{
            collectionLayout2.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        IngredientsArray.removeAll()
        DropDown.isHidden = true
        DropDown2.isHidden = true
                
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == DropDown2 {
            return Dropdown2Array.count
        }
        else if collectionView == DropDown{
            return DropdownArray.count
        }
        return IngredientsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == DropDown2 {
            let cell2 = DropDown2.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! DropDownCollectionViewCell2
            cell2.DropDownLabel2.text = Dropdown2Array[indexPath.item]
            
            return cell2
        }
        else if collectionView == DropDown{
            let cell = DropDown.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! DropDownCollectionViewCell
            cell.DropDownLabel.text = DropdownArray[indexPath.item]
            
            return cell
        }
        
        let cell3 = IngredientsView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as! IngredientViewCell
        cell3.IngredientLabel.text = IngredientsArray[indexPath.item]
        
        return cell3
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == DropDown2 {
            let temp = "\(Dropdown2Array[indexPath.item])"
            
            if(IngredientsArray.contains(Dropdown2Array[indexPath.item])){
                LabelView.text = "You Already add that item"
            }
            else{
                IngredientsArray.append(temp)
                print(IngredientsArray[indexPath.item])
                IngredientsView.reloadData()
                LabelView.text = "Tap Item to Cancel"

            }
            
        }
        else if collectionView == IngredientsView{
            if IngredientsArray.count == 1 {
                IngredientsArray.remove(at: 0)
                IngredientsView.reloadData()
                LabelView.text = "No Item Yet"
            }
            else{
                IngredientsArray.remove(at: indexPath.item)
                IngredientsView.reloadData()
            }
        }
        else{
            let temp = "\(DropdownArray[indexPath.item])"
            
            if(IngredientsArray.contains(DropdownArray[indexPath.item])){
                LabelView.text = "You Already add that item"
            }
            else{
                IngredientsArray.append(temp)
                print(IngredientsArray)
                IngredientsView.reloadData()
                LabelView.text = "Tap Item to Cancel"

            }
        }
    }
    
    @IBAction func MeatButton(_ sender: Any) {
        if clicked == 0 {
            
            DropdownArray.removeAll()
            
            DropdownArray.append("Beef")
            DropdownArray.append("Chicken")
            DropdownArray.append("Pork")
            
            DropDown.isHidden = false
            DropDown2.isHidden = true
            DropDown.backgroundColor = UIColor.systemRed
            DropDown.layer.cornerRadius = 20
            clicked = 1
            DairyButtonOutlet.frame.origin = CGPoint.init(x: 1, y: 670)
            GrainsButtonOutlet.frame.origin = CGPoint.init(x: 125, y: 670)
            FruitsButtonOutlet.frame.origin = CGPoint.init(x: 250, y: 670)
            
            DropDown.reloadData()
        }
        else{
            DropdownArray.removeAll()
            
            DropDown.isHidden = true
            DropDown2.isHidden = true
            clicked = 0
            DairyButtonOutlet.frame.origin = CGPoint.init(x: 1, y: 560)
            GrainsButtonOutlet.frame.origin = CGPoint.init(x: 125, y: 560)
            FruitsButtonOutlet.frame.origin = CGPoint.init(x: 250, y: 560)
            
            DropDown.reloadData()
        }
    }
    
    @IBAction func VegetableButton(_ sender: Any) {
        if clicked == 0 {
            
            DropdownArray.removeAll()
            
            DropdownArray.append("Carrot")
            DropdownArray.append("Brocoli")
            DropdownArray.append("Chili")
            DropdownArray.append("Eggplant")
            
            DropDown.isHidden = false
            DropDown2.isHidden = true
            clicked = 1
            DropDown.backgroundColor = UIColor.systemGreen
            DropDown.layer.cornerRadius = 20
            DairyButtonOutlet.frame.origin = CGPoint.init(x: 1, y: 670)
            GrainsButtonOutlet.frame.origin = CGPoint.init(x: 125, y: 670)
            FruitsButtonOutlet.frame.origin = CGPoint.init(x: 250, y: 670)
            
            DropDown.reloadData()
        }
        else{
            
            DropdownArray.removeAll()
            
            DropDown.isHidden = true
            DropDown2.isHidden = true
            clicked = 0
            DairyButtonOutlet.frame.origin = CGPoint.init(x: 1, y: 560)
            GrainsButtonOutlet.frame.origin = CGPoint.init(x: 125, y: 560)
            FruitsButtonOutlet.frame.origin = CGPoint.init(x: 250, y: 560)
            
            DropDown.reloadData()
        }
    }
    
    @IBAction func SeafoodButton(_ sender: Any) {
        if clicked == 0 {
            
            DropdownArray.removeAll()
            
            DropdownArray.append("Squid")
            DropdownArray.append("Octopus")
            DropdownArray.append("Crab")
            DropdownArray.append("Fish")
            
            DropDown.isHidden = false
            DropDown2.isHidden = true
            DropDown.backgroundColor = UIColor.systemBlue
            DropDown.layer.cornerRadius = 20
            clicked = 1
            DairyButtonOutlet.frame.origin = CGPoint.init(x: 1, y: 670)
            GrainsButtonOutlet.frame.origin = CGPoint.init(x: 125, y: 670)
            FruitsButtonOutlet.frame.origin = CGPoint.init(x: 250, y: 670)
            
            DropDown.reloadData()
        }
        else{
            
            DropdownArray.removeAll()
            
            DropDown.isHidden = true
            DropDown2.isHidden = true
            clicked = 0
            DairyButtonOutlet.frame.origin = CGPoint.init(x: 1, y: 560)
            GrainsButtonOutlet.frame.origin = CGPoint.init(x: 125, y: 560)
            FruitsButtonOutlet.frame.origin = CGPoint.init(x: 250, y: 560)
            
            DropDown.reloadData()
        }
    }
    
    
    @IBAction func DairyButton(_ sender: Any) {
        if clicked == 0 {
            
            Dropdown2Array.removeAll()
            
            Dropdown2Array.append("Milk")
            Dropdown2Array.append("Egg")
            Dropdown2Array.append("SoyMilk")
            
            DropDown2.isHidden = false
            DropDown.isHidden = true
            DropDown2.backgroundColor = UIColor.systemGray
            DropDown2.layer.cornerRadius = 20
            clicked = 1
            DairyButtonOutlet.frame.origin = CGPoint.init(x: 1, y: 560)
            GrainsButtonOutlet.frame.origin = CGPoint.init(x: 125, y: 560)
            FruitsButtonOutlet.frame.origin = CGPoint.init(x: 250, y: 560)
            
            DropDown2.reloadData()
        }
        else{
            
            Dropdown2Array.removeAll()
            
            DropDown2.isHidden = true
            DropDown.isHidden = true
            clicked = 0
            DairyButtonOutlet.frame.origin = CGPoint.init(x: 1, y: 560)
            GrainsButtonOutlet.frame.origin = CGPoint.init(x: 125, y: 560)
            FruitsButtonOutlet.frame.origin = CGPoint.init(x: 250, y: 560)
            
            DropDown2.reloadData()
        }
    }
    
    @IBAction func GrainsButton(_ sender: Any) {
        if clicked == 0 {
            
            Dropdown2Array.removeAll()
            
            Dropdown2Array.append("Bread")
            Dropdown2Array.append("Cracker")
            
            DropDown2.isHidden = false
            DropDown.isHidden = true
            DropDown2.backgroundColor = UIColor.systemOrange
            DropDown2.layer.cornerRadius = 20
            clicked = 1
            DairyButtonOutlet.frame.origin = CGPoint.init(x: 1, y: 560)
            GrainsButtonOutlet.frame.origin = CGPoint.init(x: 125, y: 560)
            FruitsButtonOutlet.frame.origin = CGPoint.init(x: 250, y: 560)
            
            DropDown2.reloadData()
            
        }
        else{
            
            Dropdown2Array.removeAll()
            
            DropDown2.isHidden = true
            DropDown.isHidden = true
            clicked = 0
            DairyButtonOutlet.frame.origin = CGPoint.init(x: 1, y: 560)
            GrainsButtonOutlet.frame.origin = CGPoint.init(x: 125, y: 560)
            FruitsButtonOutlet.frame.origin = CGPoint.init(x: 250, y: 560)
            
            DropDown2.reloadData()
            
        }
    }
    
    @IBAction func FruitsButton(_ sender: Any) {
        if clicked == 0 {
            
            Dropdown2Array.removeAll()
            
            Dropdown2Array.append("Orange")
            Dropdown2Array.append("Apple")
            Dropdown2Array.append("Melon")
            Dropdown2Array.append("Avocado")
            
            DropDown2.isHidden = false
            DropDown.isHidden = true
            DropDown2.backgroundColor = UIColor.systemYellow
            DropDown2.layer.cornerRadius = 20
            clicked = 1
            DairyButtonOutlet.frame.origin = CGPoint.init(x: 1, y: 560)
            GrainsButtonOutlet.frame.origin = CGPoint.init(x: 125, y: 560)
            FruitsButtonOutlet.frame.origin = CGPoint.init(x: 250, y: 560)
            
            DropDown2.reloadData()
            
        }
        else{
            
            Dropdown2Array.removeAll()
            
            DropDown2.isHidden = true
            DropDown.isHidden = true
            clicked = 0
            DairyButtonOutlet.frame.origin = CGPoint.init(x: 1, y: 560)
            GrainsButtonOutlet.frame.origin = CGPoint.init(x: 125, y: 560)
            FruitsButtonOutlet.frame.origin = CGPoint.init(x: 250, y: 560)
            
            DropDown.reloadData()
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
