import UIKit

class CollectionController: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var items: [CollectionsItemModel] = []
    var numberOfItemsInRow:CGFloat = CGFloat(Constants.countOfItemsInRow > 0 ? Constants.countOfItemsInRow : 1)
    
    override func awakeFromNib() {
        self.delegate = self
        self.dataSource = self
    }
    
    func setItems(items: [CollectionsItemModel]) {
        self.items = items
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        // fill the row with empty items (background color)
        let count:Double = (Double(self.items.count)/Double(numberOfItemsInRow)).rounded(.up)
        return Int(numberOfItemsInRow) * Int(count)
    }
    
    var newBackgroundColor:UIColor = Constants.secondRowColor
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionsItemCell.identifier, for: indexPath as IndexPath) as! CollectionsItemCell
        if (indexPath.item<items.count) {
            cell.textLabel.isHidden = false
            cell.numberLabel.isHidden = false
            cell.imageView.isHidden = false
            cell.numberLabel.text = self.items[indexPath.item].numberReadable
            cell.textLabel.text = self.items[indexPath.item].title
            cell.imageView.image = self.items[indexPath.item].icon
        } else {
            // fill the row with empty items (background color)
            cell.textLabel.isHidden = true
            cell.numberLabel.isHidden = true
            cell.imageView.isHidden = true
            cell.separator.isHidden = true
        }
        if(indexPath.row % Int(numberOfItemsInRow) == 0) {
            cell.separator.isHidden = true
            if (newBackgroundColor == Constants.firstRowColor) {
                newBackgroundColor = Constants.secondRowColor
            } else {
                newBackgroundColor = Constants.firstRowColor
            }
        }
        cell.backgroundColor = newBackgroundColor
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Tapped #\(indexPath.item)!")
    }
    
    var x = 0
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var width:CGFloat = collectionView.frame.size.width
        if (items.count < Int(numberOfItemsInRow)) {
            numberOfItemsInRow = CGFloat(items.count)
        }
        
        width = (collectionView.frame.size.width/numberOfItemsInRow).rounded(.down)
        // remove break between cells if must
        if (x == 0) {
            x = Int(collectionView.frame.size.width - (numberOfItemsInRow * width))
        }
        
        if(indexPath.row % Int(numberOfItemsInRow) == 0) {
            width = width + CGFloat(x)
            x = 0
        }
        
        return CGSize(width: width, height: 100)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        UIView.animate(withDuration: 1.0) {
            if let cell = collectionView.cellForItem(at: indexPath) as? CollectionsItemCell {
                cell.imageView.transform = .init(scaleX: 0.5, y: 0.5)
                cell.numberLabel.transform = .init(scaleX: 1.5, y: 1.5)
                cell.contentView.backgroundColor = UIColor(red: 0.25, green: 1.95, blue: 0.95, alpha: 0.7)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.5) {
            if let cell = collectionView.cellForItem(at: indexPath) as? CollectionsItemCell {
                cell.imageView.transform = .identity
                cell.numberLabel.transform = .identity
                cell.contentView.backgroundColor = .clear
            }
        }
    }
}
