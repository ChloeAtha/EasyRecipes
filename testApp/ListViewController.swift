//
//  ListViewController.swift
//  testApp
//
//  Created by Chloe Atha on 5/1/22.
//

import UIKit

class ListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var drinks = Drinks()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        drinks.getData {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            let destination = segue.destination as! DetailViewController
            let selectedIndexPath = tableView.indexPathForSelectedRow!
            destination.drink = drinks.drinkArray[selectedIndexPath.row]
        }
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drinks.drinkArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        if indexPath.row == drinks.drinkArray.count-1 && drinks.alphabetIndex < drinks.alphabet.count {
            drinks.getData {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        cell.textLabel?.text = drinks.drinkArray[indexPath.row].strDrink
        cell.detailTextLabel?.text = "-"
        return cell
    }
    
    
}
