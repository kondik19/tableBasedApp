import Foundation
import UIKit
import FriendlyNumbers

class CollectionsItemModel: NSObject {
    var icon:UIImage?
    var title:String?
    var number:Int64 = 0
    var type:ItemType = .number
    var numberReadable:String = "0"
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init() {
        super.init()
        self.icon = UIImage.init(named: Constants.placeholder)
        self.title = ""
        self.icon = self.icon?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
    }
    
    init(iconName:String, title: String, number: Int64, type: ItemType) {
        self.icon = UIImage(named: iconName)
        self.icon = self.icon?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        self.number = number
        self.title = title
        
        if (type == .distance) {
            self.numberReadable = MeasurementFormatter().string(from: Measurement(value: Double(number), unit: UnitLength.meters)) as String
        }
        if (type == .number) {
            self.numberReadable = Int(number).formatNumber()
        }
        if (type == .time) {
            self.numberReadable = Int(number).formatTime()
        }
        if (type == .xsteps) {
            self.numberReadable = Int(number).formatNumber() + "x"
        }
    }
    
    enum ItemType {
        case number, distance, time, xsteps
    }
}

extension Int {
    func formatNumber() -> String {
        if self < 1000 {
            return "\(self)"
        }
        
        if self < 1000000 {
            var n = Float(self);
            n = floor(n/100)/10
            let str = String(format: "%.0f", n)
            return "\(str) k"
        }
        
        var n = Double(self)
        n = Double(floor(n/100000)/10)
        return "\(n.description) Mio"
    }
    
    func formatTime() -> String {
        
        var seconds: Int = 0
        var minutes: Int = 0
        var hours: Int = 0
        var days: Int = 0
        var secondsTemp: Int = 0
        var minutesTemp: Int = 0
        var hoursTemp: Int = 0
        
        if self < 1000 {
            return ""
        } else if self < 1000 * 60 {
            seconds = self / 1000
            return "\(seconds)sec"
        } else if self < 1000 * 60 * 60 {
            secondsTemp = self / 1000
            minutes = secondsTemp / 60
            seconds = (self - minutes * 60 * 1000) / 1000
            return "\(minutes)min \(seconds)sec"
        } else if self < 1000 * 60 * 60 * 24 {
            minutesTemp = self / 1000 / 60
            hours = minutesTemp / 60
            minutes = (self - hours * 60 * 60 * 1000) / 1000 / 60
            seconds = (self - hours * 60 * 60 * 1000 - minutes * 60 * 1000) / 1000
            return "\(hours)h \(minutes)min"
        } else {
            hoursTemp = self / 1000 / 60 / 60
            days = hoursTemp / 24
            hours = (self - days * 24 * 60 * 60 * 1000) / 1000 / 60 / 60
            minutes = (self - days * 24 * 60 * 60 * 1000 - hours * 60 * 60 * 1000) / 1000 / 60
            seconds = (self - days * 24 * 60 * 60 * 1000 - hours * 60 * 60 * 1000 - minutes * 60 * 1000) / 1000
            if (days < 7) {
                return "\(days)d \(hours)h \(minutes)min"
            } else {
                return "\(days/7) weeks"
            }
        }
    }
}

