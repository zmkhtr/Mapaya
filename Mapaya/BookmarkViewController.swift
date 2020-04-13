//
//  BookmarkViewController.swift
//  Mapaya
//
//  Created by Adrian Renaldi on 08/04/20.
//  Copyright © 2020 Azam Mukhtar. All rights reserved.
//

import UIKit

class BookmarkViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITabBarControllerDelegate, CustomTabBarControllerDelegate {
   

    var recipes: [Recipe] = []
    
    @IBOutlet weak var tabelBookmark: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func initData() {
        if let bookmark = MiniDatabase.getUserBookmark() {
            for recipe in bookmark.recipe.reversed() {
                if recipe.recipeID != -1 {
                    recipes.append(recipe)
                }
            }
        }
    }
    
    
    func onTabSelected(isTheSame: Bool) {
        if (recipes.isEmpty){
            initData()
        } else {
            recipes.removeAll()
            initData()
            tabelBookmark.reloadData()
        }
    }
       
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 155
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "BookmarkTableViewCell", for: indexPath) as? BookmarkTableViewCell {
            let recipe = recipes[indexPath.row]
            cell.nameLabel.text = recipe.name
            cell.timeLabel.text = recipe.minuteEstimate
            cell.peopleLabel.text = recipe.portionEstimate
            cell.recipeImage.image = UIImage(named: recipe.image)
            cell.levelLabel.text = recipe.level
            cell.levelView.backgroundColor = checkColor(level: recipe.level.lowercased())
            return cell
        }
        return BookmarkTableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let recipe = recipes[indexPath.row]
        performSegue(withIdentifier: "toDetailPage", sender: recipe)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailPage {
            destination.recipe = sender as? Recipe
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
