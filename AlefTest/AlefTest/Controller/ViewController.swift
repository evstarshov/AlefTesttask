//
//  ViewController.swift
//  AlefTest
//
//  Created by Евгений Старшов on 15.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    var childrenArray = [Child]()
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var childrenTableView: UITableView!
    @IBOutlet weak var addChildButton: UIButton!
    
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

    @IBAction func addChild() {
        let name = nameTextField.text
        let age = ageTextField.text
        //guard (name != nil) && age != "" else { return }
        childrenArray.append(Child(name: name!, age: age!))
        childrenTableView.reloadData()
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
