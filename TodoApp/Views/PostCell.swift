//
//  PostCell.swift
//  TodoApp
//
//  Created by Ka Lee on 4/4/19.
//  Copyright © 2019 Ka Lee. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var doneLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
