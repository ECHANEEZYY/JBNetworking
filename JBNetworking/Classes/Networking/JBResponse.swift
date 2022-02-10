//
//  JBResponse.swift
//  JBangLib
//
//  Created by ECHANLSAKFJOISYYZZZ on 2021/6/29.
//

import UIKit

open class JBModel: Codable {
}

public struct JBResponse<T: Codable>: Codable {
    public var code: Int?
    public var data: T?
    public var message: String?
    public var errorMessage: String?
}

public struct JBListResponse<T: Codable>: Codable {
    public var code: Int? /// 返回码，0-成功，1-未登录，2-其他错误
    public var message: String?
    public var data: [T]?
    public  var pagination: JBPagination?
}

public struct JBPagination: Codable {
    public var page: Int?
    public var pageSize: Int?
    public var total: Int?
}

extension Encodable {
    
    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self)
        else { return nil }
        let dictionary = try? JSONSerialization.jsonObject(with: data, options: [])
        return dictionary.flatMap { $0 as? [String: Any] }
    }
    
    public func copy<T: Codable>(_ to: T.Type) -> T? {
        guard let encodeData = try? JSONEncoder().encode(self)
        else { return nil }
        if let decodeData = try? JSONDecoder().decode(to.self, from: encodeData) {
            return decodeData
        }
        return nil
    }
    
}
