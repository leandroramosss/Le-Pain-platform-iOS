//
//  MyCollectionViewCell.swift
//  Header
//
//  Created by Leandro Ramos on 7/2/20.
//  Copyright © 2020 Black Beard Games. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MycollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "MycollectionViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundColor = .link
    }

}
