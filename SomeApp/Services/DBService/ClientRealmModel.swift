//
//  ClientRealmModel.swift
//
//  Created by Andrew Steellson.
//

import Foundation
import RealmSwift


final class ClientRealmModel: Object {
    
    @Persisted(primaryKey: true) var _id: String = UUID().uuidString
    @Persisted var name: String
    
    override class func primaryKey() -> String? {
        "_id"
    }
}
