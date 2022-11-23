//
//  UserBasaDateStorage.swift
//  JustTakeCar
//
//  Created by Евгений Буракевич on 25.07.22.
//

import CoreData
import Foundation

struct UsersDatabaseStorage {

    private let context = AppDataController.shared.context

    // MARK: - Edit
    func save(id: UUID, userDate: Date, userMail: String, userName: String, userPassword: String) {
        context.perform {
            let product = UsersData(context: context)
            product.id = id
            product.userDate = userDate
            product.userMail = userMail
            product.userName = userName
            product.userPassword = userPassword
            try! context.save()
        }
    }

    func editProduct(by id: UUID) {

    }

    // MARK: - Fetch
    func fetchProductModel() {

    }

    func fetchAllProducts(competion: (([UsersData]) -> Void)?) {
        context.perform {
            let fetchRequest = UsersData.fetchRequest()
            let model = try! context.fetch(fetchRequest)
            competion?(model)
        }
    }

    // MARK: - Remove
    func removeAll() {

    }

    func removeProduct(by id: UUID) {
    }
}
private extension UsersDatabaseStorage {

    func saveContextChanges() {

    }
}
