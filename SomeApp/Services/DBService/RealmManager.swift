//
//  RealmManager.swift
//
//  Created by Steellson
//

import Foundation
import RealmSwift

protocol ClientManagerProtocol: AnyObject {
    func setupClient(with name: String)
    func checkOnboarding() -> Bool
    func getClientName() -> String
}

protocol DBManagerProtocol: AnyObject {
    var objects: [TaskRealmModel] { get }
    func save(object: Object) throws
    func removeObject(forKey: String) throws
    func update(object: Object, forKey: String) throws
    func getAllObjects() -> [TaskRealmModel]
    
    func getObjectStats(forKey: String) throws
    func switchObjectState(forKey: String)
}

//MARK: - Realm Manager Impl

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
    
    private var client = ClientRealmModel()
}

//MARK: - Client

extension RealmManager: ClientManagerProtocol {
    
    func setupClient(with name: String) {
        self.client.name = name
        
        do {
            try mainRealm.write {
                mainRealm.add(self.client)
            }
        } catch (let error) {
            print("Can't setup client: \(error.localizedDescription)")
        }
    }

    func checkOnboarding() -> Bool {
        Array(mainRealm.objects(ClientRealmModel.self)).isEmpty
    }
    
    func getClientName() -> String {
        mainRealm.objects(ClientRealmModel.self).map { $0.name }.first ?? R.Strings.letsPlainLabel.rawValue
    }
}

//MARK: - DB

extension RealmManager: DBManagerProtocol {
    
    var objects: [TaskRealmModel] {
        getAllObjects()
    }
    
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
        do {
            try removeObject(forKey: forKey)
            try mainRealm.write {
                mainRealm.add(recievedObject)
            }
        } catch {
            throw RealmError.cantRecognizeObject
        }
    }
    
    func getAllObjects() -> [TaskRealmModel] {
        Array(mainRealm.objects(TaskRealmModel.self))
    }
    
    func getObjectStats(forKey: String) throws {
        guard let object = mainRealm.object(ofType: TaskRealmModel.self,
                                                forPrimaryKey: forKey) else {
            throw RealmError.cantReadObject
        }
        print(object.description + " " + mainRealm.objects(TaskRealmModel.self).count.formatted())
    }
    
    func switchObjectState(forKey: String) {
        guard let object = mainRealm.object(ofType: TaskRealmModel.self,
                                                forPrimaryKey: forKey) else {
            return print("Switch state error")
        }
        
        do {
            try mainRealm.write {
                object.isDone.toggle()
            }
        } catch (let error) {
            print(error.localizedDescription)
        }
    }
}
