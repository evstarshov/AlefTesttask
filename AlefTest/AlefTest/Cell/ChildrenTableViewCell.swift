//
//  ChildrenTableViewCell.swift
//  AlefTest
//
//  Created by Евгений Старшов on 15.02.2022.
//

import UIKit

class ChildrenTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameTitle: UILabel!
    @IBOutlet weak var ageTitle: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
