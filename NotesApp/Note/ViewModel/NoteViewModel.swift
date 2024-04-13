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
        let date = note?.date ?? Date()
        let (title, description) = createTitleAndDescription(from: text)
        
        let note = Note(
            title: title,
            description: description,
            date: date,
            imageURL: nil,
            category: .personal
        )
        NotePersistent.save(note)
    }
    
    func delete() {
        guard let note else { return }
        NotePersistent.delete(note)
    }
    
    // MARK: - Private Methods
    private func createTitleAndDescription(from text: String) -> (String, String?) {
        var description = text
        
        guard let index = description.firstIndex(where: {
            $0 == "." || $0 == "?" || $0 == "!" || $0 == "\n"
        }) else {
            return (text, nil)
        }
        
        let title = String(description[...index])
        description.removeSubrange(...index)
        
        return (title, description)
    }
}
