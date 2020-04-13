//
//  MiniDatabase.swift
//  Mapaya
//
//  Created by Azam Mukhtar on 12/04/20.
//  Copyright © 2020 Azam Mukhtar. All rights reserved.
//

import Foundation

let PREF_KEY = "PREF_KEY"
let FILTER_KEY = "FILTER_KEY"
let BOOKMARK_KEY = "BOOKMARK_KEY"

class MiniDatabase {
    
    static func saveUserTastePreferences(preference : Preference){
        if let encoded = try? JSONEncoder().encode(preference) {
            UserDefaults.standard.set(encoded, forKey: PREF_KEY)
        }
    }
    
    static func getUserTastePreferences() -> Preference?{
        var pref : Preference?
        
        if let prefData = UserDefaults.standard.data(forKey: PREF_KEY),
            let preference = try? JSONDecoder().decode(Preference.self, from: prefData) {
            pref = preference
        }
        
        return pref
    }
    
     static func saveUserFilter(filter : Filter){
           if let encoded = try? JSONEncoder().encode(filter) {
               UserDefaults.standard.set(encoded, forKey: FILTER_KEY)
           }
       }
       
       static func getUserFilter() -> Filter?{
           var filter : Filter?
           
           if let filterData = UserDefaults.standard.data(forKey: FILTER_KEY),
               let filterContains = try? JSONDecoder().decode(Filter.self, from: filterData) {
               filter = filterContains
           }
           
           return filter
       }
    

    static func saveUserBookmark(bookmark : Bookmark){
          if let encoded = try? JSONEncoder().encode(bookmark) {
              UserDefaults.standard.set(encoded, forKey: BOOKMARK_KEY)
          }
      }
      
      static func getUserBookmark() -> Bookmark?{
        var bookmark = Bookmark(recipe: [Recipe(recipeID: -1, name: "", image: "", minuteEstimate: "", portionEstimate: "", level: "")])
        
//        MiniDatabase.saveUserBookmark(bookmark: Bookmark(recipe: recipes))
          
          if let bookmarkData = UserDefaults.standard.data(forKey: BOOKMARK_KEY),
              let bookmarkContains = try? JSONDecoder().decode(Bookmark.self, from: bookmarkData) {
              bookmark = bookmarkContains
          }
          
          return bookmark
      }
}
