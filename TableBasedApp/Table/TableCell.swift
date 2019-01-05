//
//  TableCell.swift
//  TableBasedApp
//
//  Created by Konrad Cygal on 05.01.19.
//  Copyright © 2019 Konrad Cygal. All rights reserved.
//

import Foundation
import UIKit

class TableCell: UITableViewCell {
    
    static var identifier: String = "TableCell"
    
    @IBOutlet weak var collectionView:CollectionController?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setItems(items: [CollectionsItemModel]) {
        self.collectionView?.setItems(items: items)
    }
}
