//
//  JBAlertUtil.swift
//  Alamofire
//
//  Created by ECHANLSAKFJOISYYZZZ on 2021/6/10.
//

import UIKit
import AudioToolbox

/// 震动反馈状态
public let kJBImpackFeedbackStatusKey = "JBImpackFeedbackStatusKey"

open class JBAlertUtil: JBToastUtil {
    
    // MARK: 提示
    
    /// 显示单按钮提示框
    public func showSingleActionsAlert(title: String, message: String?, okActionTitle: String, okButtonColor: UIColor?, viewController: UIViewController, okActionHandler: (() -> Void)? = nil) -> Void {
        let alertController = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction.init(title: okActionTitle, style: .cancel) { (action) in
            if okActionHandler != nil {
                okActionHandler!()
            }
        }
        if okButtonColor != nil {
            okAction.setValue(okButtonColor, forKey: "_titleTextColor")
        }
        alertController.addAction(okAction)
        viewController.present(alertController, animated: true, completion: nil)
    }
    
    /// 显示双按钮提示框
    public func showDualActionsAlert(title: String, message: String? = nil, viewController: UIViewController, cancelActionTitle: String? = "取消", cancelButtonColor: UIColor? = nil, cancelActionHandler: (() -> Void)? = nil, okActionTitle: String? = "确定", okButtonColor: UIColor? = nil, okActionHandler: (() -> Void)? = nil) -> Void {
        let alertController = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction.init(title: cancelActionTitle, style: .cancel) { action in
            if cancelActionHandler != nil {
                cancelActionHandler!()
            }
        }
        cancelAction.setValue(cancelButtonColor == nil ? UIColor.lightGray : cancelButtonColor, forKey: "_titleTextColor")
        let okAction = UIAlertAction.init(title: okActionTitle, style: .default) { (action) in
            if okActionHandler != nil {
                okActionHandler!()
            }
        }
        if okButtonColor != nil {
            okAction.setValue(okButtonColor, forKey: "_titleTextColor")
        }
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        viewController.present(alertController, animated: true, completion: nil)
    }
    
    /// 显示上拉操作表
    public func showActionSheet(title: String? = nil, message: String? = nil, cancelActionTitle: String? = "取消", actions: [UIAlertAction], viewController: UIViewController) -> Void {
        let alertController = UIAlertController.init(title: title, message: message, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction.init(title: cancelActionTitle, style: .cancel, handler: nil)
        for action in actions {
            alertController.addAction(action)
        }
        alertController.addAction(cancelAction)
        viewController.present(alertController, animated: true, completion: nil)
    }
    
    // MARK: 震动
    
    /// 中度震动反馈
    public func mediumImpactFeedback() -> Void {
        if isImpactFeedbackOpen() {
            if UIDevice.current.type == .iPhone6s || UIDevice.current.type == .iPhone6sPlus {
                AudioServicesPlaySystemSound(1519)
            } else {
                let generator = UIImpactFeedbackGenerator.init(style: .medium)
                generator.impactOccurred()
            }
        }
    }
    
    /// 重度震动反馈
    public func heavyImpactFeedback() -> Void {
        if isImpactFeedbackOpen() {
            if UIDevice.current.type == .iPhone6s || UIDevice.current.type == .iPhone6sPlus {
                AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
            } else {
                let generator = UIImpactFeedbackGenerator.init(style: .heavy)
                generator.impactOccurred()
            }
        }
    }
    
    /// 微弱震动反馈
    public func softImpactFeedback() -> Void {
        if isImpactFeedbackOpen() {
            if !(UIDevice.current.type == .iPhone6s || UIDevice.current.type == .iPhone6sPlus) {
                if #available(iOS 13.0, *) {
                    let generator = UIImpactFeedbackGenerator.init(style: .soft)
                    generator.impactOccurred()
                }
            }
        }
    }
    
    /// 强硬震动反馈
    public func rigidImpactFeedback() -> Void {
        if isImpactFeedbackOpen() {
            if !(UIDevice.current.type == .iPhone6s || UIDevice.current.type == .iPhone6sPlus) {
                if #available(iOS 13.0, *) {
                    let generator = UIImpactFeedbackGenerator.init(style: .rigid)
                    generator.impactOccurred()
                }
            }
        }
    }
    
    /// 开启震动反馈
    public func openImpactFeedback() -> Void {
        UserDefaults.standard.set(true, forKey: kJBImpackFeedbackStatusKey)
    }
    
    /// 关闭震动反馈
    public func closeImpactFeedback() -> Void {
        UserDefaults.standard.set(false, forKey: kJBImpackFeedbackStatusKey)
    }
    
    /// 是否已开启震动反馈
    public func isImpactFeedbackOpen() -> Bool {
        return UserDefaults.standard.bool(forKey: kJBImpackFeedbackStatusKey)
    }

}
