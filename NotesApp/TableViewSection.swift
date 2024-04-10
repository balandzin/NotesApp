//
//  TableViewSection.swift
//  NotesApp
//
//  Created by Антон Баландин on 10.04.24.
//

import Foundation

protocol TableViewItemsProtocol { }

struct TableViewSection {
    var title: String?
    var items: [TableViewItemsProtocol]
}
