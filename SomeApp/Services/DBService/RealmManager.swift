//
//  RealmManager.swift
//
//  Created by Steellson
//

import Foundation
import RealmSwift

protocol DBManagerProtocol: AnyObject {
    func save(object: Object) throws
    func removeObject(forKey: String) throws
    func update(object: Object, forKey: String) throws
    func getObjectStats(forKey: String) throws
}

final class RealmManager: NSObject {
    
    public enum RealmError: Error {
        case cantSaveObject
        case cantRemoveObject
        case cantRecognizeObject
        case cantReadObject
    }
    
    private lazy var configuration: Realm.Configuration = {
        var config = Realm.Configuration(schemaVersion: 1) { migration, oldSchemaVersion in
            if (oldSchemaVersion < 1) {}
        }
        config.deleteRealmIfMigrationNeeded = true
        return config
    }()
    
    private lazy var mainRealm = try! Realm(configuration: configuration)
}


extension RealmManager: DBManagerProtocol {
    
    func save(object: Object) throws {
        do {
            try mainRealm.write {
                mainRealm.add(object)
                print("Saved \(object.description)")
            }
        } catch {
            throw RealmError.cantSaveObject
        }
    }
    
    func removeObject(forKey: String) throws {
        do {
            try mainRealm.write {
                guard let object = mainRealm.object(ofType: TaskRealmModel.self,
                                                    forPrimaryKey: forKey) else {
                    throw RealmError.cantRemoveObject
                }
                
                mainRealm.delete(object)
                print("\(object) Removed")
            }
        } catch {
            throw RealmError.cantRemoveObject
        }
    }
    
    func update(object recievedObject: Object, forKey: String) throws {
        guard let objectForKey = mainRealm.object(ofType: TaskRealmModel.self,
                                                forPrimaryKey: forKey) else {
            throw RealmError.cantRecognizeObject
        }
        
//        objectForKey.text = recievedObject.text
//        objectForKey.time = recievedObject.time
//        objectForKey.priority = recievedObject.priority
//        objectForKey.isDone = recievedObject.isDone
        
        do {
            try mainRealm.write {
                mainRealm.delete(objectForKey)
                mainRealm.add(recievedObject)
            }
        } catch {
            throw RealmError.cantRecognizeObject
        }
    }
    
    func getObjectStats(forKey: String) throws {
        guard let object = mainRealm.object(ofType: TaskRealmModel.self,
                                                forPrimaryKey: forKey) else {
            throw RealmError.cantReadObject
        }
        print(object.description + " " + mainRealm.objects(TaskRealmModel.self).count.formatted())
    }
}
