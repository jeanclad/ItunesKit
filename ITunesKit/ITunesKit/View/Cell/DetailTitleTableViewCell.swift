//
//  DetailTitleTableViewCell.swift
//  ITunesKit
//
//  Created by jeanclad on 2017. 9. 16..
//  Copyright © 2017년 jeanclad. All rights reserved.
//

import UIKit
import Kingfisher

class DetailTitleTableViewCell: UITableViewCell {

    @IBOutlet fileprivate var artworkImageView: UIImageView!
    @IBOutlet fileprivate var appNameLabel: UILabel!
    @IBOutlet fileprivate var appDesc: UILabel!
    
    var item: Result? {
        didSet {
            guard let item = item else {
                return
            }
            
            appNameLabel.text = item.trackCensoredName
            appDesc.text = item.description
            
            let url = URL(string: item.artworkUrl100!)
            if url != nil {
                artworkImageView.kf.setImage(with: url)
            }
        }
    }
}
