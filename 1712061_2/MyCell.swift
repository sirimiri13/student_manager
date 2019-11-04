//
//  MyCell.swift
//  1712061_2
//
//  Created by Lam Huong on 10/16/19.
//  Copyright © 2019 Lam Huong. All rights reserved.
//

import UIKit

class MyCell: UITableViewCell {

    @IBOutlet weak var subInfo: UILabel!
    @IBOutlet weak var titleInfo: UILabel!
    @IBOutlet weak var imgInfo: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
