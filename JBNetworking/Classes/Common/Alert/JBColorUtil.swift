//
//  JBColorUtil.swift
//  JBangLib
//
//  Created by ECHANLSAKFJOISYYZZZ on 2021/9/18.
//

import UIKit

open class JBColorUtil: NSObject {
    
    /// App主色 - 浅色模式
    public static var lightMainAppColorHex: String = JBColorUtil.getCacheHex(with: .lightMainAppColor) ?? "0091FF" {
        didSet {
            JBColorUtil.updateHex(with: .lightMainAppColor, hex: lightMainAppColorHex)
        }
    }
    /// App主色 - 深色模式
    public static var darkMainAppColorHex: String = getCacheHex(with: .darkMainAppColor) ?? "0091FF" {
        didSet {
            JBColorUtil.updateHex(with: .darkMainAppColor, hex: darkMainAppColorHex)
        }
    }
    
    /// App副色 - 浅色模式
    public static var lightSecondaryAppColorHex: String = getCacheHex(with: .lightSecondaryAppColor) ?? "0091FF" {
        didSet {
            JBColorUtil.updateHex(with: .lightSecondaryAppColor, hex: lightSecondaryAppColorHex)
        }
    }
    /// App副色 - 深色模式
    public static var darkSecondaryAppColorHex: String = getCacheHex(with: .darkSecondaryAppColor) ?? "0091FF" {
        didSet {
            JBColorUtil.updateHex(with: .darkSecondaryAppColor, hex: darkSecondaryAppColorHex)
        }
    }
    
    /// 控制器背景色 - 浅色模式
    public static var lightVCBackgroundColorHex: String = getCacheHex(with: .lightVCBackgroundColor) ?? "F4F5F7" {
        didSet {
            JBColorUtil.updateHex(with: .lightVCBackgroundColor, hex: lightVCBackgroundColorHex)
        }
    }
    /// 控制器背景色 - 深色模式
    public static var darkVCBackgroundColorHex: String = getCacheHex(with: .darkVCBackgroundColor) ?? "161616" {
        didSet {
            JBColorUtil.updateHex(with: .darkVCBackgroundColor, hex: darkVCBackgroundColorHex)
        }
    }
    
    /// 视图背景色 - 浅色模式
    public static var lightViewBackgroundColorHex: String = getCacheHex(with: .lightViewBackgroundColor) ?? "FFFFFF" {
        didSet {
            JBColorUtil.updateHex(with: .lightViewBackgroundColor, hex: lightViewBackgroundColorHex)
        }
    }
    /// 视图背景色 - 深色模式
    public static var darkViewBackgroundColorHex: String = getCacheHex(with: .darkViewBackgroundColor) ?? "1C1C1C" {
        didSet {
            JBColorUtil.updateHex(with: .darkViewBackgroundColor, hex: darkViewBackgroundColorHex)
        }
    }
    
    /// 列表刷新状态文字颜色 - 浅色模式
    public static var lightRefreshStateLabelColorHex: String = getCacheHex(with: .lightRefreshStateLabelColor) ?? "AAAAAA" {
        didSet {
            JBColorUtil.updateHex(with: .lightRefreshStateLabelColor, hex: lightRefreshStateLabelColorHex)
        }
    }
    /// 列表刷新状态文字颜色 - 深色模式
    public static var darkRefreshStateLabelColorHex: String = getCacheHex(with: .darkRefreshStateLabelColor) ?? "9A9A9A" {
        didSet {
            JBColorUtil.updateHex(with: .darkRefreshStateLabelColor, hex: darkRefreshStateLabelColorHex)
        }
    }
    
    /// 文字常规色 - 浅色模式
    public static var lightTextColorHex: String = getCacheHex(with: .lightTextColor) ?? "888888" {
        didSet {
            JBColorUtil.updateHex(with: .lightTextColor, hex: lightTextColorHex)
        }
    }
    /// 文字常规色 - 深色模式
    public static var darkTextColorHex: String = getCacheHex(with: .darkTextColor) ?? "B1B1B1" {
        didSet {
            JBColorUtil.updateHex(with: .darkTextColor, hex: darkTextColorHex)
        }
    }
    
    /// 文字重点色 - 浅色模式
    public static var lightAccentTextColorHex: String = getCacheHex(with: .lightAccentTextColor) ?? "222222" {
        didSet {
            JBColorUtil.updateHex(with: .lightAccentTextColor, hex: lightAccentTextColorHex)
        }
    }
    /// 文字重点色 - 深色模式
    public static var darkAccentTextColorHex: String = getCacheHex(with: .darkAccentTextColor) ?? "C1C1C1" {
        didSet {
            JBColorUtil.updateHex(with: .darkAccentTextColor, hex: darkAccentTextColorHex)
        }
    }
    
    /// 文字二级色 - 浅色模式
    public static var lightSecondaryTextColorHex: String = getCacheHex(with: .lightSecondaryTextColor) ?? "C7C7C7" {
        didSet {
            JBColorUtil.updateHex(with: .lightSecondaryTextColor, hex: lightSecondaryTextColorHex)
        }
    }
    /// 文字二级色 - 深色模式
    public static var darkSecondaryTextColorHex: String = getCacheHex(with: .darkSecondaryTextColor) ?? "B1B1B1" {
        didSet {
            JBColorUtil.updateHex(with: .darkSecondaryTextColor, hex: darkSecondaryTextColorHex)
        }
    }
    
    /// 线色 - 浅色模式
    public static var lightLineColorHex: String = getCacheHex(with: .lightLineColor) ?? "DEDEDE" {
        didSet {
            JBColorUtil.updateHex(with: .lightLineColor, hex: lightLineColorHex)
        }
    }
    /// 线色 - 深色模式
    public static var darkLineColorHex: String = getCacheHex(with: .darkLineColor) ?? "272727" {
        didSet {
            JBColorUtil.updateHex(with: .darkLineColor, hex: darkLineColorHex)
        }
    }
    
    /// 占位字符色
    public static var jbPlaceholderColorHex: String = getCacheHex(with: .placeholderColor) ?? "C4C4C6" {
        didSet {
            JBColorUtil.updateHex(with: .placeholderColor, hex: jbPlaceholderColorHex)
        }
    }
    
    /// 黑色
    public static var jbBlackColorHex: String = getCacheHex(with: .blackColor) ?? "222222" {
        didSet {
            JBColorUtil.updateHex(with: .blackColor, hex: jbBlackColorHex)
        }
    }
    
    /// 灰色
    public static var jbGrayColorHex: String = getCacheHex(with: .grayColor) ?? "888888" {
        didSet {
            JBColorUtil.updateHex(with: .grayColor, hex: jbGrayColorHex)
        }
    }
    
}

extension JBColorUtil {
    
    static func getCacheHex(with key: JBColorKey) -> String? {
        return UserDefaults.standard.value(forKey: key.rawValue) as? String
    }
    
    public static func updateHex(with key: JBColorKey, hex: String) -> Void {
        UserDefaults.standard.set(hex, forKey: key.rawValue)
        UserDefaults.standard.synchronize()
    }
    
}

public enum JBColorType: String {
    case appMain = "appMain"
    case appSecondary = "appSecondary"
    case vcBg = "vcBg"
    case viewBg = "viewBg"
    case label = "label"
    case labelAccent = "labelAccent"
    case labelSecondary = "labelSecondary"
    case line = "line"
}

public enum JBColorKey: String {
    case lightMainAppColor = "lightMainAppColor"
    case darkMainAppColor = "darkMainAppColor"
    
    case lightSecondaryAppColor = "lightSecondaryAppColor"
    case darkSecondaryAppColor = "darkSecondaryAppColor"
    
    case lightVCBackgroundColor = "lightVCBackgroundColor"
    case darkVCBackgroundColor = "darkVCBackgroundColor"
    
    case lightViewBackgroundColor = "lightViewBackgroundColor"
    case darkViewBackgroundColor = "darkViewBackgroundColor"
    
    case lightRefreshStateLabelColor = "lightRefreshStateLabelColor"
    case darkRefreshStateLabelColor = "darkRefreshStateLabelColor"
    
    case lightTextColor = "lightTextColor"
    case darkTextColor = "darkTextColor"
    
    case lightAccentTextColor = "lightAccentTextColor"
    case darkAccentTextColor = "darkAccentTextColor"
    
    case lightSecondaryTextColor = "lightSecondaryTextColor"
    case darkSecondaryTextColor = "darkSecondaryTextColor"
    
    case lightLineColor = "lightLineColor"
    case darkLineColor = "darkLineColor"
    
    case placeholderColor = "placeholderColor"
    
    case blackColor = "blackColor"
    
    case grayColor = "grayColor"
}
