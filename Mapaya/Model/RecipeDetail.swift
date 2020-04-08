//
//  RecipeDetail.swift
//  Mapaya
//
//  Created by Adrian Renaldi on 08/04/20.
//  Copyright © 2020 Azam Mukhtar. All rights reserved.
//

import Foundation

struct RecipeDetail {
    let recipeDetailID: Int
    let recipeID: Int
    let name: String
    let steps: [Step]
    let ingredient: [Ingredient]
}
