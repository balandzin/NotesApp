//
//  Note.swift
//  NotesApp
//
//  Created by Антон Баландин on 10.04.24.
//

import Foundation

struct Note: TableViewItemsProtocol {
    let title: String
    let description: String
    let date: Date
    let imageURL: String?
    let image: Data?
}
