//
//  HeroiTableViewCell.swift
//  Heros
//
//  Created by IOS SENAC on 08/08/20.
//  Copyright © 2020 IOS SENAC. All rights reserved.
//

import UIKit

class HeroiTableViewCell: UITableViewCell {

    @IBOutlet weak var lblNome: UILabel!
    
    @IBOutlet weak var lblGrupo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
