//
//  JBNSObjectExtension.swift
//  JBangLib
//
//  Created by ECHANLSAKFJOISYYZZZ on 2021/12/7.
//

import UIKit

extension NSObject {
    
    public var podClassName: String {
        let podClass: AnyClass? = classForPod
        return podClass == nil ? "" : "\(podClass!)"
    }
    
    public var classForPod: AnyClass? {
        return getPodClass(classForCoder)
    }
    
    // 如果框架或解决方案被具体项目继承，则需取父类来拿到框架或解决方案的类
    private func getPodClass(_ aClass: AnyClass) -> AnyClass? {
        let classBundleName = NSStringFromClass(aClass).components(separatedBy: ".").first!
        if !classBundleName.contains("JB") {
            if aClass.superclass() == nil {
                return nil
            }
            return getPodClass(aClass.superclass()!)
        }
        return aClass
    }

}
