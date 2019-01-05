//
//  SectionModel.swift
//  TableBasedApp
//
//  Created by Konrad Cygal on 05.01.19.
//  Copyright © 2019 Konrad Cygal. All rights reserved.
//

import Foundation

class SectionModel : NSObject {

    var sectionName:String = ""
    var colletionsItems:[CollectionsItemModel] = []
    var sectionFooter:String = ""
    
    override init() {
        super.init()
    }
    
    init(name: String, items:[CollectionsItemModel], footer: String) {
        super.init()
        sectionName = name
        colletionsItems = items
        sectionFooter = footer
    }
}
