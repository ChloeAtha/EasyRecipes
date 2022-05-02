//
//  RandomViewController.swift
//  testApp
//
//  Created by Chloe Atha on 5/2/22.
//

import UIKit

class RandomViewController: UIViewController {
    @IBOutlet weak var foodLabel: UILabel!
    @IBOutlet weak var drinkLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drinkLabel.text = ""
        foodLabel.text = ""
    }
    
    @IBAction func foodButtonPressed(_ sender: UIButton) {
        let foodChoicesArray = ["Apple Frangipan Tart",
                                "Ayam Percik",
                                "Bakewell Tart",
                                "Beef Wellington",
                                "Beef Sunday Roast",
                                "Broccoli and Stilton Soup",
                                "Big Mac",
                                "Classic Christmas Pudding",
                                "Corned Beef and Cabbage",
                                "Duck Confit",
                                "English Breakfast",
                                "Egg Drop Soup",
                                "Dundee Cake",
                                "French Omelette",
                                "Ful Medlems",
                                "Fish Fofos",
                                "Grilled Portugese Sardines",
                                "Hot Chocolate Fudge",
                                "Hot and Sour Soup",
                                "Kumpir",
                                "Lamb Biryani",
                                "Lasagne",
                                "Ma Po Tofu",
                                "Mince Pies",
                                "Mustard Champ",
                                "New York Cheesecake",
                                "Pancakes",
                                "Prawn and Fennel Bisque",
                                "Ratatouille",
                                "Rappie Pie",
                                "Spotted Duck",
                                "Salmon Avocado Salad",
                                "Tonkatsu",
                                "Vegetarian Chili",
                                "Wontons"]
        var foodChoice: String

        repeat
        { foodChoice = foodChoicesArray.randomElement()! }
        while foodChoice == foodLabel.text

                foodLabel.text = foodChoice
    }

    @IBAction func drinkButtonPressed(_ sender: UIButton) {
        let drinkChoicesArray = ["ABC",
                                 "Apello",
                                 "Avalon",
                                 "Buccaneer",
                                 "Broadside",
                                 "Casino",
                                "Cuba Libre",
                                 "Cream Soda",
                                 "City Slicker",
                                 "Darkwood Sling",
                                 "Espresso Martini",
                                 "Fruit Shake",
                                 "French Martini",
                                 "Frozen Daiquiri",
                                 "Gin Sour",
                                 "Gin Sling",
                                 "Godfather",
                                 "Honey Bee",
                                 "Horses Neck",
                                 "Havana Cocktail",
                                 "Irish Coffee",
                                 "Jitterbug",
                                 "Jelly Bean",
                                 "Kiwi Lemon",
                                 "Kool First Aid",
                                 "Limeade",
                                 "Lassi- Mango",
                                 "Mojito",
                                 "Mai Tai",
                                 "Old Fashioned",
                                 "Pink Gin",
                                 "Rose",
                                 "Spritz",
                                 "Sidecar",
                                 "Texas Rattlesnake",
                                 "Wine Punch",
                                 "Winter Paloma",
                                 "Zinger",

]
        var drinkChoice: String

        repeat
        { drinkChoice = drinkChoicesArray.randomElement()! }
        while drinkChoice == drinkLabel.text

                drinkLabel.text = drinkChoice
    }

}
