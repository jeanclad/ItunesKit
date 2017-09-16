//
//  DetailTitleTableViewCell.swift
//  ITunesKit
//
//  Created by jeanclad on 2017. 9. 16..
//  Copyright © 2017년 jeanclad. All rights reserved.
//

import UIKit

class DetailTitleTableViewCell: UITableViewCell {

    @IBOutlet var appNameLabel: UILabel!
    
    var item: Result? {
        didSet {
            guard let item = item else {
                return
            }
            
            appNameLabel.text = item.trackCensoredName
            
//            let url = URL(string: (item.imImages?.last?.label)!)
//            if url != nil {
//                sumnailImageView.kf.setImage(with: url)
//            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
