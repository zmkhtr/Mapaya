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
    var divisor : CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        divisor = (view.frame.width / 2) / 0.61
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
            thumbImageView.image = #imageLiteral(resourceName: "bookmark")
            thumbImageView.tintColor = UIColor.blue
        } else {
            thumbImageView.image = #imageLiteral(resourceName: "dislike")
            thumbImageView.tintColor = UIColor.red
        }
        
        thumbImageView.alpha = abs(xFromCenter) / view.center.x
        
        if sender.state == UIGestureRecognizer.State.ended {
            
            if card.center.x < 75 {
                //Move to left
                UIView.animate(withDuration: 0.3) {
                    card.center = CGPoint(x: card.center.x - 200, y: card.center.y + 75)
                    card.alpha = 0
                }
                return
            } else if card.center.x > (view.frame.width - 75){
                //Move to right
                UIView.animate(withDuration: 0.3) {
                    card.center = CGPoint(x: card.center.x + 200, y: card.center.y + 75)
                    card.alpha = 0
                }
                return
            }
            
            UIView.animate(withDuration: 0.2) {
                card.center = self.view.center
                self.thumbImageView.alpha = 0
            }
        }
    }
    
    @IBAction func reset(_ sender: UIButton) {
        resetCard()
    }
    
    func resetCard(){
        UIView.animate(withDuration: 0.2) {
            self.cardView.center = self.view.center
            self.thumbImageView.alpha = 0
            self.cardView.alpha = 1
            self.cardView.transform = .identity
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
