//
//  JBCookieManager.swift
//  Pods
//
//  Created by ECHANLSAKFJOISYYZZZ on 2021/6/3.
//

import UIKit

open class JBCookieManager: NSObject {
    
    public static let shared = JBCookieManager()
    
    var cookieName = "SESSION"
    var cookieDomain: String!
    
    private override init() { }

    @discardableResult
    public func saveCookie() -> Bool {
        let cookies = HTTPCookieStorage.shared.cookies
        for cookie in cookies! {
            if cookie.name.elementsEqual(cookieName) && cookie.domain.elementsEqual(cookieDomain) {
                UserDefaults.standard.set(cookie.value, forKey: cookieName)
                UserDefaults.standard.set(cookie.domain, forKey: cookieDomain)
                UserDefaults.standard.synchronize()
                return true
            }
        }
        return false
    }
    
    public func deleteCookie() -> Void {
        for cookie in HTTPCookieStorage.shared.cookies! {
            HTTPCookieStorage.shared.deleteCookie(cookie)
        }
        UserDefaults.standard.removeObject(forKey: cookieName)
        UserDefaults.standard.removeObject(forKey: cookieDomain)
        UserDefaults.standard.synchronize()
    }
    
    func setupCookie() -> Void {
        if (UserDefaults.standard.object(forKey: cookieName) != nil) {
            let domain = UserDefaults.standard.object(forKey: cookieDomain)
            if domain == nil {
                return
            }
            let cookie = HTTPCookie.init(properties: [
                HTTPCookiePropertyKey.name : cookieName,
                HTTPCookiePropertyKey.value : UserDefaults.standard.object(forKey: cookieName) as! String,
                HTTPCookiePropertyKey.domain : UserDefaults.standard.object(forKey: cookieDomain) as! String,
                HTTPCookiePropertyKey.path : "/"
            ])
            let cookieStorage = HTTPCookieStorage.shared
            cookieStorage.setCookie(cookie!)
        }
    }
    
}
