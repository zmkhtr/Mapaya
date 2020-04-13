//
//  NavigationController.swift
//  Mapaya
//
//  Created by Azam Mukhtar on 13/04/20.
//  Copyright © 2020 Azam Mukhtar. All rights reserved.
//

import UIKit

var firstOpen = false

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        firstOpen = MiniDatabase.isFirstOpen()
        cekUserFirstOpen()
        // Do any additional setup after loading the view.
    }
    
    func cekUserFirstOpen(){
          if firstOpen {
              performSegue(withIdentifier: "skipToHome", sender: nil)
          } else {
              MiniDatabase.setIsFirstOpen(isFirstOpen: true)
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
