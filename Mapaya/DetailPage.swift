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
    @IBOutlet weak var detailLevel: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButton(_ sender: Any) {
    }
    
}
