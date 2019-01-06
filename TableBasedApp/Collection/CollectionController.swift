import UIKit

class CollectionController: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var items: [CollectionsItemModel] = []
    let numberOfItemsInRow:CGFloat = CGFloat(Constants.countOfItemsInRow)
    
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
    
    var newBackgroundColor:UIColor = Constants.dark
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
            if (newBackgroundColor == .black) {
                newBackgroundColor = Constants.dark
            } else {
                newBackgroundColor = .black
            }
        }
        cell.backgroundColor = newBackgroundColor
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Clicked #\(indexPath.item)!")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // If width of screen is odd
        let width:CGFloat
        if (indexPath.row % Int(numberOfItemsInRow) != 0) {
            width = UIScreen.main.bounds.width/numberOfItemsInRow - 1/numberOfItemsInRow
        } else {
            width = UIScreen.main.bounds.width/numberOfItemsInRow + 1/numberOfItemsInRow
        }
        return CGSize(width: width, height: 100)
    }
}
