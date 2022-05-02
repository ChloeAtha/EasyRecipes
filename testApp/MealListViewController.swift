//
//  MealListViewController.swift
//  testApp
//
//  Created by Chloe Atha on 5/1/22.
//

import UIKit

class MealListViewController: UIViewController {
    @IBOutlet weak var mealTableView: UITableView!
    
    var meals = ["meal 1", "meal 2"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mealTableView.delegate = self
        mealTableView.dataSource = self
    }
}

extension MealListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celll = tableView.dequeueReusableCell(withIdentifier: "Celll", for: indexPath)
        celll.textLabel?.text = meals[indexPath.row]
        return celll
    }
}


