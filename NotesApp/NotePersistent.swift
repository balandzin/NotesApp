//
//  NotePersistent.swift
//  NotesApp
//
//  Created by Антон Баландин on 13.04.24.
//

import CoreData
import Foundation

final class NotePersistent {
    private static let context = AppDelegate.persistentContainer.viewContext
    
    static func save(_ note: Note) {
        
    }
    
    static func delete(_ note: Note) {
        
    }
    
    static func fetchAll() -> [Note] {
        return []
    }
}
