//
//  ListViewController.swift
//  testApp
//
//  Created by Chloe Atha on 5/1/22.
//

import UIKit

 var drinkArray: [Drink] = []

class ListViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var field: UITextField!
    
//    var data = [drinkArray]
//    var filteredData = [String]()

    var drinks = Drinks()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        filteredData = data
        
        tableView.delegate = self
        tableView.dataSource = self
        field.delegate = self
        drinks.getData {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        if let text = textField.text {
//            filterText(text+string)
//        }
//
//        return true
//    }
//
//    func filterText(_ query: String) {
//        filteredData.removeAll()
//        for string in data {
//            if string.lowercased().starts(with: query.lowercased()) {
//                filteredData.append(string)
//            }
//        }
//        tableView.reloadData()
//    }
    
    
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
//        if filteredData.isEmpty {
//            return filteredData.count
//        }
//        return data.count
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
        return cell
        
//        if !filteredData.isEmpty {
//            cell.textLabel?.text = filteredData[indexPath.row]
//        } else {
//            cell.textLabel?.text = data[indexPath.row]
//        }
    }
    

    
}
