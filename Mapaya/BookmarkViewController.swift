//
//  BookmarkViewController.swift
//  Mapaya
//
//  Created by Adrian Renaldi on 08/04/20.
//  Copyright © 2020 Azam Mukhtar. All rights reserved.
//

import UIKit

class BookmarkViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var recipes: [Recipe] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initData()
    }
    
    func initData() {
        recipes = [
            Recipe(recipeID: 1, name: "Egg Sandwich", image: "egg-sandwich", minuteEstimate: "20", portionEstimate: "2", level: "Easy"),
            Recipe(recipeID: 2, name: "French Toast", image: "french-toast", minuteEstimate: "30", portionEstimate: "2", level: "Medium"),
            Recipe(recipeID: 3, name: "Cheese Burger", image: "cheese-burger", minuteEstimate: "60", portionEstimate: "2", level: "Hard")
        ]
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
            cell.timeLabel.text = "\(recipe.minuteEstimate) minutes"
            cell.peopleLabel.text = "\(recipe.portionEstimate) people"
            cell.recipeImage.image = UIImage(named: recipe.image)
            return cell
        }
        return BookmarkTableViewCell()
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
