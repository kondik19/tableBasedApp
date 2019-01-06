import UIKit

class TableViewController: UITableViewController {
    
    var items: [CollectionsItemModel] = []
    var sections: [SectionModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var item = CollectionsItemModel.init(iconName: "iconSteps", title: Constants.steps, number: 4530000, type: .number)
        self.items.append(item)
        item = CollectionsItemModel.init(iconName: "iconDistance", title: Constants.distance, number: 4986, type: .distance)
        self.items.append(item)
        item = CollectionsItemModel.init(iconName: "iconTimeDark", title: Constants.activeTime, number: 2419200000, type: .time)
        self.items.append(item)
        item = CollectionsItemModel.init(iconName: "iconCalories", title: Constants.kcal, number: 500000, type: .number)
        self.items.append(item)
        item = CollectionsItemModel.init(iconName: "iconFloors", title: Constants.floors, number: 1890, type: .number)
        self.items.append(item)
        item = CollectionsItemModel.init(iconName: "iconGoal", title: Constants.xsteps, number: 250, type: .xsteps)
        self.items.append(item)
        
        
        sections.append(SectionModel.init(name: Constants.sectionLifetimeStats, items: self.items, footer: Constants.sectionLifetimeFooter))
        self.items.removeAll()
        
        item = CollectionsItemModel.init(iconName: "iconSteps", number: 25789, type: .number,  date: Date())
        self.items.append(item)
        item = CollectionsItemModel.init(iconName: "iconDistance", number: 22000, type: .distance, date: Date())
        self.items.append(item)
        item = CollectionsItemModel.init(iconName: "iconTimeDark", number: 14700000, type: .time, date: Date())
        self.items.append(item)
        item = CollectionsItemModel.init(iconName: "iconCalories", number: 3539, type: .number, date: Date())
        self.items.append(item)
        
        sections.append(SectionModel.init(name: Constants.sectionRecords, items: self.items, footer: ""))
        self.items.removeAll()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TableCell.identifier, for: indexPath) as! TableCell
        let sectionModel = sections[indexPath.section] as SectionModel
        cell.setItems(items: sectionModel.colletionsItems)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionModel = sections[section] as SectionModel
        let nameOfSection = sectionModel.sectionName
        return nameOfSection
    }
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        let sectionModel = sections[section] as SectionModel
        let footerOfSection = sectionModel.sectionFooter
        return footerOfSection
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.backgroundView?.backgroundColor = .black
        header.textLabel?.textColor = UIColor.white
        header.textLabel?.font = UIFont.boldSystemFont(ofSize: 13)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let rows = (Double(sections[indexPath.section].colletionsItems.count)/Double(Constants.countOfItemsInRow > 0 ? Constants.countOfItemsInRow : 1)).rounded(.up)
        var height = CGFloat(rows * 100)
        // there must be at least one row
        if (height < 100) {
            height = 100
        }
        return CGFloat.init(height)
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
            let view = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        let footerText:UILabel = UILabel(frame: CGRect(x: 20, y: 20, width: tableView.frame.width - 20, height: 0))
        let sectionModel = sections[section] as SectionModel
        let footerOfSection = sectionModel.sectionFooter
        footerText.text = footerOfSection
        footerText.textColor = .darkGray
        footerText.font = UIFont.systemFont(ofSize: 13)
        footerText.numberOfLines = 0;
        footerText.lineBreakMode = .byWordWrapping
        footerText.backgroundColor = .black
        footerText.sizeToFit()
        view.addSubview(footerText)
        return view
    }
 
}

