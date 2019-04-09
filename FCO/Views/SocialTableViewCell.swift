//
//  SocialTableViewCell.swift
//  FCO
//
//  Created by Nikita Gura on 12.01.2019.
//  Copyright © 2019 Nikita Gura. All rights reserved.
//

import UIKit

class SocialTableViewCell: UITableViewCell {
    @IBOutlet weak var labelText: UIImageView!
    @IBOutlet weak var imageLogo: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
