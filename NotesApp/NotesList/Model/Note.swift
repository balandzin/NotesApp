//
//  Note.swift
//  NotesApp
//
//  Created by Антон Баландин on 10.04.24.
//

import Foundation
import UIKit

struct Note: TableViewItemsProtocol {
    enum NoteCategory {
        case personal
        case work
        case study
        case shopping
        case travel
        case health
        case finances
        case ideas
        
        var noteColor: UIColor {
            switch self {
            case .personal:
                    .lightGreen
            case .work:
                    .lightRed
            case .study:
                    .lightYellow
            case .shopping:
                    .cyan
            case .travel:
                    .brown
            case .health:
                    .green
            case .finances:
                    .green
            case .ideas:
                    .darkGray
            }
        }
    }
    
    let title: String
    let description: String
    let date: Date
    let imageURL: String?
    let image: Data?
    let category: NoteCategory
}
