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
