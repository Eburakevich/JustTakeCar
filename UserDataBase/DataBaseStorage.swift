//
//  DataBaseStorage.swift
//  JustTakeCar
//
//  Created by Евгений Буракевич on 25.07.22.
//

import CoreData
import Foundation

struct UsersDataBaseStorage {
    
    private let context = AppDataController.shared.context
    
    func save(model: UsersModel) {
        
    }
    
    func editUser(by id: UUID) {
        
    }
    
    func fetchUserModel() {
        
    }
    
    func fetchAllProducts(competion: (([UsersModel]) -> Void)?) {
        context.perform {
            let fetchRequest = UsersModel.fetchRequest() 
            let model = try! context.fetch(fetchRequest)
            competion?(model)
        }
    }
    
    func removeAll() {
        
    }
    
    func removeUser(by id: UUID) {
        
    }
}
