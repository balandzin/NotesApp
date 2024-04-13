//
//  NoteViewModel.swift
//  NotesApp
//
//  Created by Антон Баландин on 13.04.24.
//

import Foundation

protocol NoteViewModelProtocol {
    var text: String { get }
    
    func save(with text: String)
    func delete()
}

final class NoteViewModel: NoteViewModelProtocol {
    let note: Note?
    var text: String {
        let text = (note?.title ?? "") + "\n\n" + (note?.description ?? "")
        return text.trimmingCharacters(in: .whitespacesAndNewlines) // Обрезать пробелы и абзацы
    }
    
    init(note: Note?) {
        self.note = note
    }
    
    // MARK: - Methods
    func save(with text: String) {
        let note = Note(
            title: text,
            description: "",
            date: Date(),
            imageURL: nil,
            category: .personal
        )
        NotePersistent.save(note)
    }
    
    func delete() {
        guard let note else { return }
        NotePersistent.delete(note)
    }
}
