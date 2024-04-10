//
//  NotesListViewController.swift
//  NotesApp
//
//  Created by Антон Баландин on 10.04.24.
//

import UIKit

class NotesListViewController: UITableViewController {
    
    // MARK: - Properties
    var viewModel: NotesListViewModelProtocol?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Notes"
        navigationController?.navigationBar.prefersLargeTitles = true // большой title в navigationBar
        setupTableView()
        setupToolBar()
    }
    
    // MARK: - Private Methods
    private func setupTableView() {
        tableView.register(
            SimpleNoteTableViewCell.self,
            forCellReuseIdentifier: "SimpleNoteTableViewCell"
        )
        
        tableView.register(
            ImageNoteTableViewCell.self,
            forCellReuseIdentifier: "ImageNoteTableViewCell"
        )
        
        tableView.separatorStyle = .none // Убрал разделители
    }
    
    private func setupToolBar() { // Тулбар
        let addButton = UIBarButtonItem(title: "Add note", style: .done, target: self, action: #selector(addAction))
        
        let spacing = UIBarButtonItem(systemItem: .flexibleSpace) // растягивающийся елемент
        setToolbarItems([spacing, addButton], animated: true)
        navigationController?.isToolbarHidden = false
    }
    
    @objc private func addAction() {
        
    }
}

// MARK: - UITableViewDataSource
extension NotesListViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        viewModel?.section.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.section[section].items.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let note = viewModel?.section[indexPath.section].items[indexPath.row] as?
                Note else { return UITableViewCell() }
        
        if indexPath.row == 0, let cell = tableView.dequeueReusableCell(
            withIdentifier: "SimpleNoteTableViewCell",
            for: indexPath
        ) as? SimpleNoteTableViewCell {
            
            cell.setNote(note: note)
            return cell
            
        } else if let cell = tableView.dequeueReusableCell(
            withIdentifier: "ImageNoteTableViewCell",
            for: indexPath
        ) as? ImageNoteTableViewCell {
            
            cell.setNote(note: note)
            return cell
            
        }
        
        return UITableViewCell()
    }
}

// MARK: - UITableViewDelegate
extension NotesListViewController {
    
}
