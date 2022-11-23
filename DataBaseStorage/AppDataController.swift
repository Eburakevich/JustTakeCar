//
//  AppDataController.swift
//  JustTakeCar
//
//  Created by Евгений Буракевич on 25.07.22.
//

import CoreData
import Foundation

final class AppDataController {
    static let shared = AppDataController()

    let container = NSPersistentContainer(name: "Store")

    var context: NSManagedObjectContext {
        container.viewContext
    }

    private init () {
        container.loadPersistentStores { _, error in
            if let error = error {
                print("Core data failed to load \(error)")
            }
        }
    }
}
