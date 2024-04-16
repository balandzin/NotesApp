//
//  NotesListViewModel.swift
//  NotesApp
//
//  Created by Антон Баландин on 10.04.24.
//

import Foundation

protocol NotesListViewModelProtocol {
    var section: [TableViewSection] { get }
    var reloadTable: (() -> Void)? { get set }
    
    func getNotes()
}

final class NotesListViewModel: NotesListViewModelProtocol {
    var reloadTable: (() -> Void)?
    
    private(set) var section: [TableViewSection] = [] {
        didSet {
            reloadTable?()
        }
    }
    
    init() {
        getNotes()
    }
    
    func getNotes() {
        let notes = NotePersistent.fetchAll()
        section = []
        
        let groupedObjects = notes.reduce(into: [Date: [Note]]()) { result, note in
            let date = Calendar.current.startOfDay(for: note.date)
            result[date, default: []].append(note)
        }
        
        let keys = groupedObjects.keys
        keys.forEach { key in
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "d MMM yyyy"
            let stringDate = dateFormatter.string(from: key)
            section.append(TableViewSection(title: stringDate, items: groupedObjects[key] ?? []))
        }
        
    }
    
    private func setMocks() {
        let section = TableViewSection(
            title: "10 Apr 2024",
            items: [
                Note(
                    title: "First note",
                    description: "First note description",
                    date: Date(),
                    imageURL: nil,
                    category: .finances
                ),
                Note(
                    title: "First note",
                    description: "First note description",
                    date: Date(),
                    imageURL: nil,
                    category: .travel
                )
            ]
        )
        
        self.section = [section]
    }
}

