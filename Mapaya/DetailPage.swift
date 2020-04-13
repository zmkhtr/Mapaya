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
    @IBOutlet weak var detailLevelView: UIView!
    @IBOutlet weak var detailLevelLabel: UILabel!
    @IBOutlet weak var detailIngredientListLabel: UILabel!
    @IBOutlet weak var detailStepsListLabel: UILabel!
    
    
    var recipe: Recipe?
    var ingredients: [Ingredient] = []
    var steps: [Step] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailLevelView.layer.cornerRadius = 8
        initData()
    }
    
    func initData() {
        ingredients = [
            Ingredient(recipeID: 1, jumlahBahan: "2 pcs", name: "white bread"),
            Ingredient(recipeID: 1, jumlahBahan: "1", name: "egg"),
            Ingredient(recipeID: 1, jumlahBahan: "1/2", name: "avocado"),
            Ingredient(recipeID: 1, jumlahBahan: "A pinch of", name: "salt"),
            Ingredient(recipeID: 2, jumlahBahan: "4", name: "eggs"),
            Ingredient(recipeID: 2, jumlahBahan: "2/3 cup", name: "milk"),
            Ingredient(recipeID: 2, jumlahBahan: "2 teaspoon", name: "cinnamon"),
            Ingredient(recipeID: 2, jumlahBahan: "2 tablespoon", name: "butter"),
            Ingredient(recipeID: 2, jumlahBahan: "8 pcs", name: "thick bread"),
            Ingredient(recipeID: 2, jumlahBahan: "", name: "Maple syrup"),
            Ingredient(recipeID: 3, jumlahBahan: "1 pound 70/30", name: "ground beef"),
            Ingredient(recipeID: 3, jumlahBahan: "A pinch of", name: "kosher salt"),
            Ingredient(recipeID: 3, jumlahBahan: "4", name: "buns"),
            Ingredient(recipeID: 3, jumlahBahan: "8 slices", name: "sharp cheddar cheese"),
            Ingredient(recipeID: 3, jumlahBahan: "8 leaves", name: "butter lettuces"),
            Ingredient(recipeID: 3, jumlahBahan: "4 thin slices", name: "red onion"),
            Ingredient(recipeID: 3, jumlahBahan: "1 teaspoon", name: "mayonaise"),
            Ingredient(recipeID: 3, jumlahBahan: "1 teaspoon", name: "ketchup"),
            Ingredient(recipeID: 4, jumlahBahan: "2 1/4 teaspoon", name: "active dry yeast"),
            Ingredient(recipeID: 4, jumlahBahan: "3 tablespoon", name: "olive oil"),
            Ingredient(recipeID: 4, jumlahBahan: "1 1/2 cups", name: "warm water"),
            Ingredient(recipeID: 4, jumlahBahan: "1 1/2 teaspoon", name: "salt"),
            Ingredient(recipeID: 4, jumlahBahan: "4 cups", name: "bread flour"),
            Ingredient(recipeID: 4, jumlahBahan: "2 cans", name: "tomato sauce"),
            Ingredient(recipeID: 4, jumlahBahan: "1 1/2 tablespoon", name: "extra virgin olive oil"),
            Ingredient(recipeID: 4, jumlahBahan: "1 clove", name: "garlic"),
            Ingredient(recipeID: 4, jumlahBahan: "20 slices", name: "pepperoni"),
            Ingredient(recipeID: 4, jumlahBahan: "2 cups shredded", name: "mozarella"),
            Ingredient(recipeID: 4, jumlahBahan: "8 slices", name: "sharp cheddar cheese"),
            Ingredient(recipeID: 5, jumlahBahan: "1 cups", name: "all purposed flour"),
            Ingredient(recipeID: 5, jumlahBahan: "2 tablespoon", name: "sugar"),
            Ingredient(recipeID: 5, jumlahBahan: "2 tablespoon", name: "baking powder"),
            Ingredient(recipeID: 5, jumlahBahan: "1/2 teaspoon", name: "salt"),
            Ingredient(recipeID: 5, jumlahBahan: "1 cup", name: "milk"),
            Ingredient(recipeID: 5, jumlahBahan: "2 tablespoon", name: "unsalted butter"),
            Ingredient(recipeID: 5, jumlahBahan: "1", name: "egg"),
            Ingredient(recipeID: 6, jumlahBahan: "1/2 kg", name: "butternut squash pumpkin"),
            Ingredient(recipeID: 6, jumlahBahan: "2 clove", name: "garlic"),
            Ingredient(recipeID: 6, jumlahBahan: "3 cups", name: "chicken stock"),
            Ingredient(recipeID: 6, jumlahBahan: "1 cup", name: "water"),
            Ingredient(recipeID: 6, jumlahBahan: "A pinch of", name: "salt"),
            Ingredient(recipeID: 6, jumlahBahan: "A pinch of", name: "pepper"),
            Ingredient(recipeID: 7, jumlahBahan: "1/2 cup", name: "soy sauce"),
            Ingredient(recipeID: 7, jumlahBahan: "1 tablespoon", name: "rice vinegar"),
            Ingredient(recipeID: 7, jumlahBahan: "1 pound", name: "ground pork"),
            Ingredient(recipeID: 7, jumlahBahan: "3 cloves", name: "garlic"),
            Ingredient(recipeID: 7, jumlahBahan: "1", name: "egg"),
            Ingredient(recipeID: 7, jumlahBahan: "1 1/2 tablespoon", name: "sesame oil"),
            Ingredient(recipeID: 7, jumlahBahan: "1 tablespoon minced", name: "ginger"),
            Ingredient(recipeID: 7, jumlahBahan: "50", name: "dumpling wrappers")
        ]
        
        steps = [
            Step(recipeID: 1, stepKe: 1, detail: "Toast the bread on a skillet over medium heat until golden brown, set aside"),
            Step(recipeID: 1, stepKe: 2, detail: "Cut avocado lengthwise, then cut it into thin slices. Put it on top of the bread"),
            Step(recipeID: 1, stepKe: 3, detail: "Heat up the skillet into medium high heat and crack the egg on the skillet. Season with some salt and let it fried for 2 minutes. Put it on top of your bread and avocado."),
            Step(recipeID: 1, stepKe: 4, detail: "Your egg sandwich is ready!"),
            Step(recipeID: 2, stepKe: 1, detail: "Make the egg mixture: In a medium bowl, whisk together the eggs, milk, and cinnamon. Whisk the mixture until well blended and pour into a shallow bowl, wide enough to place a slice of the bread you will be using."),
            Step(recipeID: 2, stepKe: 2, detail: "Soak bread slices in egg mixture: Place each slice of bread into the milk egg mixture, allowing the bread to soak in some of it."),
            Step(recipeID: 2, stepKe: 3, detail: "Fry the french toast: Melt some butter in a large skillet over medium high heat. Shake off the excess egg mixture from the bread, and place the bread slices onto the hot skillet. Fry the French toast until browned on one side, then flip and brown the other side."),
            Step(recipeID: 2, stepKe: 4, detail: "Serve hot with butter, maple syrup, and if available, fresh berries."),
            Step(recipeID: 3, stepKe: 1, detail: "Heat a large nonstick griddle or cast-iron skillet over moderately high heat. Toast the hamburger buns cut side down on the griddle until golden brown, 1 to 2 minutes. Transfer to a platter."),
            Step(recipeID: 3, stepKe: 2, detail: "Form the beef into four 1/4 inch-thick burgers and season with salt. Increase the heat to high and cook the patties until they are browned on the bottom, about 2 minutes. Flip, top with cheese and cook until the bottom is browned and the cheese is melted, about 2 minutes. Transfer the patties to the bottom buns and top with butter lettuce, tomato and red onion. Spread mayonnaise and ketchup on the cut side of the top buns, if using, and serve."),
            Step(recipeID: 4, stepKe: 1, detail: "In the bowl of an electric stand mixer, combine yeast, 2 tsp sugar and 1/2 cup warm water and whisk until yeast has dissolved. Allow to rest 5 minutes. Add in remaining 1 cup warm water, olive oil, salt and vinegar. Fit mixer with whisk attachment, set on low speed and slowly add in 1 3/4 cups of the flour and mix until combined. "),
            Step(recipeID: 4, stepKe: 2, detail: "Switch to a dough hook and slowly add in remaining 1 3/4 cups flour, then knead mixture on medium-low speed about 5 - 7 minutes, adding in up to an additional 1/2 cup flour as needed, until dough is smooth and elastic (dough should be slightly sticky but should not stick to a clean fingertip). Cover bowl with plastic wrap and allow to rest in a warm place until doubled, about 1 1/2 hours."),
            Step(recipeID: 4, stepKe: 3, detail: "For pizza sauce: combine all ingredients in a bowl. Preferably let rest 30 minutes (while dough is rising) to allow flavors to meld."),
            Step(recipeID: 4, stepKe: 4, detail: "Place a pizza stone in oven and preheat oven to 450 degrees. While oven preheats assemble pizza. Punch down pizza dough (divide into two equal 16 oz portions, freeze one in a resealable bag for a later use or make 2 pizzas right away). Place a sheet of parchment paper over a pizza peel, then lightly dust parchment paper with flour. Pat/roll and stretch dough on pizza peel to a 13-inch round, while creating a rim along edge of dough. "),
            Step(recipeID: 4, stepKe: 5, detail: "Using a fork (without piercing all the way through) pierce dough many times over surface. In a small bowl stir together 1 Tbsp olive oil with 1 clove garlic and brush evenly over top and edges of pizza, then evenly spread about 2/3 cup of the pizza sauce over pizza (leaving rim uncoated). "),
            Step(recipeID: 4, stepKe: 6, detail: "Top evenly with cheeses (again leaving rim uncoated) and pepperoni slices (if using turkey pepperoni, I recommend adding halfway through baking). Carefully slide pizza (on parchment paper) to preheated pizza stone in oven and bake 12 - 15 minutes until crust is golden. Remove from oven, sprinkle top with oregano and optional red pepper flakes. Cut into slices and serve."),
            Step(recipeID: 5, stepKe: 1, detail: "Preheat oven to 200 degrees; have a baking sheet or heatproof platter ready to keep cooked pancakes warm in the oven. In a small bowl, whisk together flour, sugar, baking powder, and salt; set aside."),
            Step(recipeID: 5, stepKe: 2, detail: "In a medium bowl, whisk together milk, butter (or oil), and egg. Add dry ingredients to milk mixture; whisk until just moistened (do not overmix; a few small lumps are fine)."),
            Step(recipeID: 5, stepKe: 3, detail: "Heat a large skillet (nonstick or cast-iron) or griddle over medium. Fold a sheet of paper towel in half, and moisten with oil; carefully rub skillet with oiled paper towel."),
            Step(recipeID: 5, stepKe: 4, detail: "For each pancake, spoon 2 to 3 tablespoons of batter onto skillet, using the back of the spoon to spread batter into a round (you should be able to fit 2 to 3 in a large skillet)."),
            Step(recipeID: 5, stepKe: 5, detail: "Cook until surface of pancakes have some bubbles and a few have burst, 1 to 2 minutes. Flip carefully with a thin spatula, and cook until browned on the underside, 1 to 2 minutes more. Transfer to a baking sheet or platter; cover loosely with aluminum foil, and keep warm in oven. Continue with more oil and remaining batter. (You'll have 12 to 15 pancakes.) Serve warm, with desired toppings."),
            Step(recipeID: 6, stepKe: 1, detail: "Cut the pumpkin into 3cm / 2.25 slices. Cut the skin off and scrape seeds out."),
            Step(recipeID: 6, stepKe: 2, detail: "Place the pumpkin, onion, garlic, broth and water in a pot - liquid won't quite cover all the pumpkin. Bring to a boil, uncovered, then reduce heat and let simmer rapidly until pumpkin is tender (check with butter knife) - about 10 minutes."),
            Step(recipeID: 6, stepKe: 3, detail: "Remove from heat and use a stick blender to blend until smooth (Note 3 for blender)."),
            Step(recipeID: 6, stepKe: 4, detail: "Season to taste with salt and pepper, stir through cream (never boil soup after adding soup, cream will split)."),
            Step(recipeID: 6, stepKe: 5, detail: "Ladle soup into bowls, drizzle over a bit of cream, sprinkle with pepper and parsley if desired. Serve with crusty bread!"),
            Step(recipeID: 7, stepKe: 1, detail: "Combine 1/2 cup soy sauce, rice vinegar, 1 tablespoon chives, sesame seeds, and chile sauce in a small bowl. Set aside."),
            Step(recipeID: 7, stepKe: 2, detail: "Mix pork, garlic, egg, 2 tablespoons chives, soy sauce, sesame oil, and ginger in a large bowl until thoroughly combined. Place a dumpling wrapper on a lightly floured work surface and spoon about 1 tablespoon of the filling in the middle. Wet the edge with a little water and crimp together forming small pleats to seal the dumpling. Repeat with remaining dumpling wrappers and filling."),
            Step(recipeID: 7, stepKe: 3, detail: "Heat 1 to 2 tablespoons vegetable oil in a large skillet over medium-high heat. Place 8 to 10 dumplings in the pan and cook until browned, about 2 minutes per side. Pour in 1 cup of water, cover and cook until the dumplings are tender and the pork is cooked through, about 5 minutes. Repeat for remaining dumplings. Serve with soy sauce mixture for dipping.")
        ]
        
        if let recipe = recipe {
            detailImage.image = UIImage(named: recipe.image)
            detailFoodName.text = recipe.name
            detailMinutes.text = recipe.minuteEstimate
            detailPerson.text = recipe.portionEstimate
            detailLevelLabel.text = recipe.level
            detailLevelView.backgroundColor = checkColor(level: recipe.level.lowercased())
            var ingredientList = ""
            for ingredient in ingredients {
                if ingredient.recipeID == recipe.recipeID {
                    ingredientList = ingredientList + "- \(ingredient.name)\n"
                }
            }
            var stepList = ""
            for step in steps {
                if step.recipeID == recipe.recipeID {
                    stepList = stepList + "\(step.stepKe). \(step.detail)\n"
                }
            }
            detailIngredientListLabel.text = ingredientList
            detailStepsListLabel.text = stepList
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
    
    @IBAction func backButton(_ sender: Any) {
//        self.navigationController?.popViewController(animated: true)
        dismiss(animated: true)
    }
    
}
