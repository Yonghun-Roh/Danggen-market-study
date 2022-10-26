//
//  Constants.swift
//  Danggen market study
//
//  Created by Yonghun Roh on 2022/10/26.
//

struct K {
    static let cellIdentFier = "ReusableCell"
    static let cellNibName = "MessageCell"
    static let registerSegue = "RegisterToChat"
    static let loginSegue = "LoginToChat"
    
    struct BranColors {
        static let purple = "BrandPurple"
        static let lightPurple = "BrandLightPurple"
        static let blue = "BRandBlue"
        static let lighBlue = "BrandLightBlue"
        
    }
    
    struct FStore {
        static let collectionName = "message"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
}
