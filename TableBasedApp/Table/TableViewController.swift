//
//  ViewController.swift
//  TableBasedApp
//
//  Created by Konrad Cygal on 05.01.19.
//  Copyright © 2019 Konrad Cygal. All rights reserved.
//

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
        
        
        sections.append(SectionModel.init(name: Constants.sectionLifetimeStats, items: self.items, footer: "This is the footer"))
        self.items.removeAll()
        
        item = CollectionsItemModel.init(iconName: "iconSteps", title: Constants.steps, number: 25789, type: .number)
        self.items.append(item)
        item = CollectionsItemModel.init(iconName: "iconDistance", title: Constants.distance, number: 22000, type: .distance)
        self.items.append(item)
        item = CollectionsItemModel.init(iconName: "iconTimeDark", title: Constants.activeTime, number: 14700000, type: .time)
        self.items.append(item)
        item = CollectionsItemModel.init(iconName: "iconCalories", title: Constants.kcal, number: 3539, type: .number)
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
        header.textLabel?.font = UIFont.boldSystemFont(ofSize: 12)
    }
    
    override func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        guard let footer = view as? UITableViewHeaderFooterView else { return }
        footer.backgroundView?.backgroundColor = .black
        footer.textLabel?.textColor = .lightGray
        footer.textLabel?.font = UIFont.systemFont(ofSize: 12)
        footer.textLabel?.frame = footer.frame
    }
    
}

