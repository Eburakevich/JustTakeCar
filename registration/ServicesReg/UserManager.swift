//
//  UserManager.swift
//  JustTakeCar
//
//  Created by Евгений Буракевич on 20.09.22.
//

import Foundation

class DataBase {
    static let shared = DataBase()
    enum SettingKeys: String {
        case users
        case activeUser
    }
    
    let defaults  = UserDefaults.standard
    let userKey = SettingKeys.users.rawValue
    let activeUserKey = SettingKeys.activeUser.rawValue
    
  
    
    var users: [User] {
        get {
            if let data = defaults.value(forKey: userKey) as? Data {
                return try! PropertyListDecoder().decode([User].self, from: data)
            }
            else {
                return [User]()
            }
        }
        set {
            if let data = try? PropertyListEncoder().encode(newValue) {
                defaults.set(data, forKey: userKey)
            }
        }
    }
    func saveUser(login: String, password: String) {
        let user = User(login: login, password: password)
        users.insert(user, at: 0)
    }
    
    
    
    
    var activeUser: User? {
        get {
            if let data = defaults.value(forKey: activeUserKey) as? Data {
                return try! PropertyListDecoder().decode(User.self, from: data)
            }
            else {
                return nil
            }
        }
        set {
            if let data = try? PropertyListEncoder().encode(newValue) {
                defaults.set(data, forKey: activeUserKey)
            }
        }
    }
    func saveActiveUser(user: User) {
        activeUser = user
    }
}
