import Foundation
import UIKit

class Constants {
    static var countOfItemsInRow:Int = 2
    
    // First section (you can add items in TableViewController)
    static var sectionLifetimeStats = NSLocalizedString("lifetimeStats", comment: "")
    static var sectionLifetimeFooter = NSLocalizedString("lifetimeFooter", comment: "")
    static var steps = NSLocalizedString("steps", comment: "")
    static var distance = NSLocalizedString("distance", comment: "")
    static var activeTime = NSLocalizedString("activeTime", comment: "")
    static var kcal = NSLocalizedString("kcal", comment: "")
    static var floors = NSLocalizedString("floors", comment: "")
    static var xsteps = NSLocalizedString("xsteps", comment: "")
    
    // Second section
    static var sectionRecords = NSLocalizedString("records", comment: "")
    
    
    static let placeholder = "iconSteps"
    static var dark = UIColor(red: CGFloat(200.0/255.0), green: CGFloat(204.0/255.0), blue: CGFloat(204.0/255.0), alpha: CGFloat(0.12))
}
