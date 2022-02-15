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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.childrenTableView.delegate = self
        childrenTableView.register(<#T##nib: UINib?##UINib?#>, forCellReuseIdentifier: <#T##String#>)
    }


}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
