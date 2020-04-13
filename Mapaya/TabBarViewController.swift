//
//  TabBarViewController.swift
//  Mapaya
//
//  Created by Azam Mukhtar on 07/04/20.
//  Copyright © 2020 Azam Mukhtar. All rights reserved.
//

import UIKit

protocol CustomTabBarControllerDelegate {
    func onTabSelected(isTheSame: Bool)
}

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true        
        // Do any additional setup after loading the view.
        self.selectedIndex = 1
        hideTabBarLine()
        self.delegate = self
        
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        (viewController as? CustomTabBarControllerDelegate)?.onTabSelected(isTheSame: selectedViewController == viewController)
        return true
    }
    
    func hideTabBarLine(){
        tabBar.shadowImage = UIImage()
        tabBar.backgroundImage = UIImage()
        tabBar.backgroundColor = UIColor.white
        tabBar.unselectedItemTintColor = #colorLiteral(red: 0.1725490196, green: 0.2901960784, blue: 0.3882352941, alpha: 1)
        tabBar.tintColor = #colorLiteral(red: 0.9294117647, green: 0.537254902, blue: 0.4588235294, alpha: 1)
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
