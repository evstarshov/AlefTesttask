//
//  ViewController.swift
//  AlefTest
//
//  Created by Евгений Старшов on 15.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private var maxChildren = 5
    
    private var childrenArray = [Child]()
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var childrenTableView: UITableView!
    @IBOutlet weak var addChildButton: UIButton!
    @IBOutlet weak var clearTableButton: UIButton!
    
    private struct Constants {
        static let reuseIdentifier = "Cell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        childrenTableView.delegate = self
        childrenTableView.dataSource = self
        childrenTableView.register(UINib(nibName: "ChildrenTableViewCell", bundle: nil), forCellReuseIdentifier: Constants.reuseIdentifier)
        childrenTableView.reloadData()
    }

    @IBAction func addChildButtonTapped() {
        if maxChildren > 0 {
        appendChild()
        childrenTableView.reloadData()
        } else {
            return
        }
    }
    
    @IBAction func clearTableButtonTapped() {
        print("clear table?")
        showAlertClearTable()
    }
    
    private func appendChild() {
        guard nameTextField.text != "" else { return }
        let name = nameTextField.text
        guard ageTextField.text != "" else { return }
        let age = ageTextField.text
        childrenArray.append(Child(name: name!, age: age!))
        maxChildren -= 1
    }
    
    private func showAlertClearTable() {
        let alert = UIAlertController(
            title: "Вниммание!",
            message: "Очистить таблицу?",
            preferredStyle: .alert)
        let yesItem = UIAlertAction(
            title: "Да", style: .default) { _ in
                self.childrenArray.removeAll()
                self.childrenTableView.reloadData()
            }
        let noItem = UIAlertAction(title: "Нет", style: .cancel)
        alert.addAction(noItem)
        alert.addAction(yesItem)
        present(alert, animated: true, completion: nil)
    }

}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        childrenArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let dequeuedCell = tableView.dequeueReusableCell(withIdentifier: Constants.reuseIdentifier, for: indexPath)
        guard let cell = dequeuedCell as? ChildrenTableViewCell else {
            return dequeuedCell
        }
        
        cell.nameTitle.text = childrenArray[indexPath.row].name
        cell.ageTitle.text = childrenArray[indexPath.row].age
        return cell
    }
    
    
}
