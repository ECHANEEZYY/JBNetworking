//
//  JBUIDeviceExtension.swift
//  JBangLib
//
//  Created by ECHANLSAKFJOISYYZZZ on 2021/6/10.
//

import UIKit

public enum DeviceType: Int {
    case iPhone6s
    case iPhone6sPlus
    case unrecognized
}

extension UIDevice {
    
    var modelName: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        switch identifier {
        case "iPhone8,1":
            return "iPhone 6s"
        case "iPhone8,2":
            return "iPhone 6s Plus"
        default:
            return identifier
        }
    }
    
    var type: DeviceType {
        switch self.modelName {
        case "iPhone 6s":
            return .iPhone6s
        case "iPhone 6s Plus":
            return .iPhone6sPlus
        default:
            return .unrecognized
        }
    }
    
}
