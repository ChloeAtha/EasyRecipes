//
//  MealListViewController.swift
//  testApp
//
//  Created by Chloe Atha on 5/1/22.
//

import UIKit

class MealListViewController: UIViewController {
    
    @IBOutlet weak var mealTableView: UITableView!
    
    var meals = Meals()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mealTableView.delegate = self
        mealTableView.dataSource = self
        title = "Recipies"
        
        meals.getData {
            DispatchQueue.main.async {
                self.mealTableView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetailMeal" {
            let destination = segue.destination as! MealDetailViewController
            let selectedIndexPath = mealTableView.indexPathForSelectedRow!
            destination.meal = meals.mealArray[selectedIndexPath.row]
        }
    }
}
    

extension MealListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.mealArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celll = tableView.dequeueReusableCell(withIdentifier: "Celll", for: indexPath)
        if indexPath.row == meals.mealArray.count-1 && meals.alphabetIndex < meals.alphabet.count {
            meals.getData {
                DispatchQueue.main.async {
                    self.mealTableView.reloadData()
                }
            }
        }
        celll.textLabel?.text = meals.mealArray[indexPath.row].strMeal
        return celll
    }
}



