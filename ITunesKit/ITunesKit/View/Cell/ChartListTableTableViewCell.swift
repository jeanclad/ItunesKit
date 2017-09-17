//
//  ChartListTableTableViewCell.swift
//  ITunesKit
//
//  Created by jeanclad on 2017. 9. 16..
//  Copyright © 2017년 jeanclad. All rights reserved.
//

import UIKit
import Kingfisher

class ChartListTableTableViewCell: UITableViewCell {
    
    @IBOutlet var sumnailImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    
    var item: Entry? {
        didSet {
            guard let item = item else {
                return
            }
            
            titleLabel.text = item.imName?.label
            
            let url = URL(string: (item.imImages?.first?.label)!)
            if url != nil {
                sumnailImageView.kf.setImage(with: url)
            }
        }
    }
}
