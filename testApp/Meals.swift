//
//  Meals.swift
//  testApp
//
//  Created by Chloe Atha on 5/2/22.
//

import Foundation

class Meals {
    
    struct Returned: Codable {
        var meals: [Meal]
    }
    
    let alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    var alphabetIndex = 0
    let urlBase = "https://www.themealdb.com/api/json/v1/1/search.php?f="
    var urlString = ""
    var mealArray: [Meal] = []
    var isFetching = false
    
    func getData(completed: @escaping ()->()) {
        guard !isFetching else {
            print("we havent fetched the data yet")
            completed()
            return
        }
        isFetching = true
        
        urlString = urlBase + alphabet[alphabetIndex]
        alphabetIndex += 1
        
        guard let url = URL(string: urlString) else {
            print("error with \(urlString)")
            isFetching = false
            completed()
            return
        }
        
        let session = URLSession.shared
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                print("error: \(error.localizedDescription)")
            }
            do {
                let returned = try JSONDecoder().decode(Returned.self, from: data!)
                self.mealArray += returned.meals
            } catch {
                print("JSON error: \(error.localizedDescription)")
            }
            self.isFetching = false
            completed()
        }
        
        task.resume()
    }
}
