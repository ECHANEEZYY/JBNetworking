//
//  JBUIApplicationExtension.swift
//  JBangLib
//
//  Created by ECHANLSAKFJOISYYZZZ on 2022/1/12.
//

import UIKit

extension UIApplication {
    
    /// 获取当前最顶层控制器
    public class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if controller!.classForPod != nil && "\(controller!.classForPod!)" == "JBTabViewController" {
            let selectedIndex: Int! = UIApplication.getSelectedIndex(mirror: Mirror.init(reflecting: controller!)) ?? UIApplication.getSelectedIndex(mirror: Mirror.init(reflecting: controller!).superclassMirror!)
            if selectedIndex != nil {
                return topViewController(controller: controller?.children[selectedIndex])
            }
        }
        if let tabBarController = controller as? UITabBarController {
            if let selected = tabBarController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
    
    private class func getSelectedIndex(mirror: Mirror) -> Int? {
        let key = "selectedIndex"
        var selectedIndex: Int?
        for (name, value) in mirror.children {
            if name == key {
                selectedIndex = value as? Int
                break
            }
        }
        return selectedIndex
    }
    
}
