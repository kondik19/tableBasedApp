import Foundation
import UIKit

class CollectionsItemCell: UICollectionViewCell {
    
    static var identifier: String = "CollectionCell"
    
    @IBOutlet var numberLabel: UILabel!
    @IBOutlet var textLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var separator: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.imageView.tintColor = .white
    }
}
