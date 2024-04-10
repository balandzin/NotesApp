//
//  NotesListViewModel.swift
//  NotesApp
//
//  Created by Антон Баландин on 10.04.24.
//

import Foundation

protocol NotesListViewModelProtocol {
    var section: [TableViewSection] { get }
}

final class NotesListViewModel: NotesListViewModelProtocol {
    private(set) var section: [TableViewSection] = []
    
    init() {
        getNotes()
        setMocks()
    }
    
    private func getNotes() {
        
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
                image: nil,
                category: .finances
            ),
                Note(
                title: "First note",
                description: "First note description",
                date: Date(),
                imageURL: nil,
                image: nil,
                category: .travel
            )
            ]
        )
        
        self.section = [section]
    }
}
