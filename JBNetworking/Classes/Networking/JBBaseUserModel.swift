//
//  BaseUserModel.swift
//  JBangLib
//
//  Created by ECHANLSAKFJOISYYZZZ on 2021/9/24.
//

import UIKit

open class JBBaseUserModel: Codable {
    public var id: Int? = 0
    public var avatar: String? = ""
    public var nickname: String?
    public var phone: String? = ""
    public var countryCode: String?
    public var intro: String?
    public var fansCount: Int? = 0
    public var followCount: Int? = 0
    public var followStatus: JBUserFollowStatus?
}

public enum JBUserFollowStatus: String, Codable {
    case none = "none"
    case followOther = "follow_other"
    case followMe = "follow_me"
    case both = "both"
}
