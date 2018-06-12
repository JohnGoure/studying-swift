//
//  EmojiTableViewCell.swift
//  EmojiDictionary
//
//  Created by john goure on 5/22/18.
//  Copyright © 2018 john goure. All rights reserved.
//

import UIKit

class EmojiTableViewCell: UITableViewCell {

    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func update(with emoji: Emoji) {
        self.descriptionLabel.text = emoji.detailDescription
        self.nameLabel.text = emoji.name
        self.symbolLabel.text = emoji.symbol
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
