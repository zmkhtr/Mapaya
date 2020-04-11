//
//  ViewController.swift
//  Mapaya
//
//  Created by Azam Mukhtar on 07/04/20.
//  Copyright © 2020 Azam Mukhtar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startButton.layer.cornerRadius = 20
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    @IBOutlet weak var startButton: UIButton!
    
    
    
}

