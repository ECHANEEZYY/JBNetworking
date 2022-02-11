//
//  JBToastUtil.swift
//  Pods
//
//  Created by ECHANLSAKFJOISYYZZZ on 2021/6/5.
//

import UIKit
//import MBProgressHUD

open class JBToastUtil: NSObject {

//    var toastHUD: MBProgressHUD!
//    var loadingHUD: MBProgressHUD!
    var loadingCount: Int = 0
    
    // MARK: Loading
    
    /// 显示Toast提示
    public func showToast(text: String?) {
//        if text == nil { return }
//        if toastHUD != nil {
//            toastHUD.hide(animated: false)
//            toastHUD.removeFromSuperview()
//            toastHUD = nil
//        }
//        toastHUD = MBProgressHUD.showAdded(to: (UIApplication.topViewController()?.view.window ?? UIApplication.topViewController()?.view)!, animated: true)
//        toastHUD.mode = .text
//        toastHUD.detailsLabel.text = text
//        toastHUD.detailsLabel.textColor = UIColor.white
//        toastHUD.detailsLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
//        toastHUD.bezelView.style = .blur
//        toastHUD.bezelView.style = .solidColor
//        toastHUD.bezelView.backgroundColor = UIColor.init(white: 0, alpha: 0.4)
//        toastHUD.hide(animated: true, afterDelay: 1.6)
    }
    
    // MARK: Toast
    
    /// 显示正在加载提示
    public func showLoading() {
        showLoading(with: "", details: "")
    }
    
    /// 显示加载进度提示
//    public func showProgressLoading(with text: String, mode: MBProgressHUDMode) {
//        showLoading(with: "", details: text)
//        loadingHUD.mode = mode
//    }
    
    /// 更新加载进度
    public func updateProgress(_ progress: Float) -> Void {
//        loadingHUD.progress = progress
//        loadingHUD.label.text = "\(Int(progress/1*100))%"
    }
    
    /// 显示带标题和子标题的正在加载提示
    public func showLoading(with text: String, details: String) {
        loadingCount += 1
//        if loadingHUD != nil {
//            loadingHUD.hide(animated: false)
//            loadingHUD.removeFromSuperview()
//            loadingHUD = nil
//        }
//        loadingHUD = MBProgressHUD.showAdded(to: (UIApplication.topViewController()?.view)!, animated: true)
//        loadingHUD.contentColor = UIColor.white;
//        if !text.isEmpty {
//            loadingHUD.label.text = text
//        }
//        if !details.isEmpty {
//            loadingHUD.detailsLabel.text = details
//        }
//        loadingHUD.label.textColor = UIColor.white
//        loadingHUD.label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
//        loadingHUD.detailsLabel.textColor = UIColor.white
//        loadingHUD.detailsLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
//        loadingHUD.bezelView.style = .solidColor
//        loadingHUD.bezelView.backgroundColor = UIColor.init(white: 0, alpha: 0.4)
        UIApplication.shared.isNetworkActivityIndicatorVisible = true;
    }
    
    /// 隐藏正在加载提示
    public func hideLoading() {
        loadingCount -= 1;
        if (loadingCount < 0) {
            loadingCount = 0;
        }
//        if (loadingHUD != nil) {
//            loadingHUD.hide(animated: false)
//            loadingHUD.removeFromSuperview()
//            loadingHUD = nil;
//        }
        UIApplication.shared.isNetworkActivityIndicatorVisible = false;
    }
    
    /// 正在加载提示是否显示中
    public func isLoading() -> Bool {
        return loadingCount > 0
    }
    
}
