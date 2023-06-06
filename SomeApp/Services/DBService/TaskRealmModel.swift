//
//  TaskRealmModel.swift
//
//  Created by Steellson
//

import Foundation
import RealmSwift


final class TaskRealmModel: Object {
    
    @Persisted(primaryKey: true) var _id: ObjectId = ObjectId()
    @Persisted var text: String
    @Persisted var time: String?
    @Persisted var priority: Int?
    @Persisted var isDone: Bool
    
    override class func primaryKey() -> String? {
        super.primaryKey()
    }
}
