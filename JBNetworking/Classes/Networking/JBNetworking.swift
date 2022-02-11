//
//  JBNetworking.swift
//  JBangLib
//
//  Created by ECHANLSAKFJOISYYZZZ on 2021/6/3.
//

import UIKit
import Alamofire

open class JBNetworking: NSObject {
    
    // MARK: 服务端参数
    /// 是否生产环境
    open var isDistribution: Bool {
        fatalError("API Manager Must Override \"isDistribution\"")
    }
    /// Cookie Name
    open var isHttps: Bool {
        return true
    }
    /// Cookie Name
    open var cookieName: String {
        return "SESSION"
    }
    /// 测试环境域名
    open var devDomain: String {
        fatalError("API Manager Must Override \"devDomain\"")
    }
    /// 生产环境域名
    open var disDomain: String {
        fatalError("API Manager Must Override \"disDomain\"")
    }
    /// 域名后缀
    open var suffix: String {
        fatalError("API Manager Must Override \"suffix\"")
    }
    
    // MARK: 工具初始化
    let cookieManager = JBCookieManager.shared
//    let toastUtil = JBToastUtil()
    let infoDic = Bundle.main.infoDictionary
    
    // MARK: 网络请求处理
    
    public func request<T: Codable>(path: String, method: HTTPMethod, parameters: Parameters?, resultModelType: T.Type, isJsonBody: Bool? = false, continueOnErrors: Bool? = false, completion:@escaping (_ result: T) -> Void)
    {
        request(path: path, method: method, parameters: parameters, isJsonBody: isJsonBody!, continueOnErrors: continueOnErrors!) { result, response in
            if let data = try? JSONDecoder().decode(resultModelType, from: result) {
                DispatchQueue.main.async {
                    completion(data)
                }
            }
        }
    }
    
    /// 请求网络(path: API地址拼接路径, method: 请求方式, parameters: 参数, isJsonBody: 是否用body形式传参, continueOnErrors: API报错后是否返回原始数据)
    public func request(path: String, method: HTTPMethod, parameters: Parameters?, isJsonBody: Bool, continueOnErrors: Bool, completion:@escaping (_ result: Data, _ response: AFDataResponse<Any>) -> ())
    {
        setupCookie()
        let baseUrl = "\(isHttps ? "https" : "http")://\(isDistribution ? disDomain : devDomain)\(suffix)"
        print("\n\(method.rawValue) URL: ==> ", "\(baseUrl)\(path)", "\nparameters: ==> ", parameters ?? "", "\n")
        weak var weakSelf = self
        AF.request("\(baseUrl)\(path)", method: method, parameters: parameters, encoding: isJsonBody ? JSONEncoding.default: URLEncoding.default, headers: getHTTPHeaders(), requestModifier: { (urlRequest) in
            urlRequest.cachePolicy = .reloadIgnoringCacheData
        }).responseJSON { (response) in
            print(response.value ?? "")
            if weakSelf == nil { return }
//            weakSelf!.toastUtil.hideLoading()
            weakSelf!.setupAuthorization(response: response)
            weakSelf!.handleResult(response: response, continueOnErrors: continueOnErrors) { jsonData, response in
                completion(jsonData, response)
            }
        }
    }
    
    func handleResult(response: AFDataResponse<Any>, continueOnErrors: Bool, completion:@escaping (_ result: Data, _ response: AFDataResponse<Any>) -> ()) -> Void {
        if let result = response.value {
            if "\(result)".contains("status = 500;") {
                handleError(reason: "服务器开小差了～")
                return
            }
            handleData(response: response, continueOnErrors: continueOnErrors) { jsonData, response in
                completion(jsonData, response)
            }
        } else {
            handleError(reason: response.error!.localizedDescription)
        }
    }
    
    func handleData(response: AFDataResponse<Any>, continueOnErrors: Bool, completion:@escaping (_ result: Data, _ response: AFDataResponse<Any>) -> ()) -> Void {
        let jsonData = try? JSONSerialization.data(withJSONObject: response.value!, options: JSONSerialization.WritingOptions.prettyPrinted)
        if let data = try? JSONDecoder().decode(JBResponse<JBModel>.self, from: jsonData!) {
            switch data.code {
            case 1, 2, 3: // 未登录
                logOut()
                break
            case -1, 9: // 服务端抛出异常
                if continueOnErrors {
                    completion(jsonData!, response)
                } else {
                    handleError(reason: data.message)
                }
                break
            case 0: // 成功
                completion(jsonData!, response)
                break
            default:
                if data.data == nil && data.message != nil {
                    if continueOnErrors {
                        completion(jsonData!, response)
                    } else {
                        handleError(reason: data.message)
                    }
                } else {
                    completion(jsonData!, response)
                }
                break
            }
        }
    }
    
    func handleError(reason: String?) -> Void {
//        toastUtil.showToast(text: reason)
        NotificationCenter.default.post(name: NSNotification.Name.init(kJBServerErrorNotification), object: nil)
    }
    
    func logOut() -> Void {
        cookieManager.deleteCookie()
        NotificationCenter.default.post(name: NSNotification.Name.init(kJBServerErrorNotification), object: nil)
        NotificationCenter.default.post(name: NSNotification.Name.init(kJBLogOutNotification), object: nil)
    }
    
    func setupCookie() -> Void {
        cookieManager.cookieName = cookieName
        cookieManager.cookieDomain = isDistribution ? disDomain : devDomain
        cookieManager.setupCookie()
    }
    
    func getHTTPHeaders() -> HTTPHeaders {
        var headers: HTTPHeaders = [
            "Accept": "application/json",
            "platform": "1",
            "version": "\(infoDic?["CFBundleVersion"] as! String)",
            "version_name": "\(infoDic?["CFBundleShortVersionString"] as! String)",
        ]
        let authorization = UserDefaults.standard.value(forKey: kJBAuthorizationKey)
        if authorization != nil {
            headers[kJBAuthorizationKey] = authorization as? String
        }
        return headers
    }
    
    func setupAuthorization(response: AFDataResponse<Any>) -> Void {
        if response.response != nil {
            let headerFields = response.response!.allHeaderFields
            if headerFields.keys.contains(kJBAuthorizationKey) {
                let authorization = headerFields[kJBAuthorizationKey]
                UserDefaults.standard.setValue(authorization, forKey: kJBAuthorizationKey)
            }
        }
    }
    
}
