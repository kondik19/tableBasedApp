//
//  CollectionsItemCell.swift
//  FakeStepsApp
//
//  Created by Konrad Cygal on 04.01.19.
//  Copyright © 2019 Konrad Cygal. All rights reserved.
//

import Foundation
import UIKit

class CollectionsItemCell: UICollectionViewCell {
    
    static var identifier: String = "CollectionCell"
    
    @IBOutlet var numberLabel: UILabel!
    @IBOutlet var textLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.imageView.tintColor = .white
    }
}
