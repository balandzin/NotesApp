//
//  NoteViewController.swift
//  NotesApp
//
//  Created by Антон Баландин on 10.04.24.
//

import SnapKit
import UIKit

final class NoteViewController: UIViewController {
    
    // MARK: - GUI Variables
    private let attachmentImageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 10
        view.image = UIImage(named: "mockImage")
        view.layer.masksToBounds = true // Не отображать те части изображения. которые выходят за рамки
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    private let textView: UITextView = {
        let view = UITextView()
        view.layer.cornerRadius = 10
        return view
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    // MARK: - Methods
    func set(note: Note) {
        textView.text = note.title + " " + note.description
        
        guard let imageData = note.image,
              let image =  UIImage(data: imageData) else { return }
        attachmentImageView.image = image
    }
    
    // MARK: - Private Methods
    @objc private func saveAction() {
        
    }
    
    @objc private func deleteAction() {
        
    }
    
    @objc private func addImage() {
        
    }
    
    
    
    
    
    private func setupUI() {
        view.addSubview(attachmentImageView)
        view.addSubview(textView)
        view.backgroundColor = .white
        
        if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty { // Если текст пустой - задаем границы textView
            textView.layer.borderColor = UIColor.lightGray.cgColor
            textView.layer.borderWidth = 1
        }
        
        setupConstraints()
        setImageHeight()
        hideKeyboard()
        setupBars()
    }
    
    private func setupConstraints() {
        attachmentImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.leading.trailing.equalToSuperview().inset(10)
            make.height.equalTo(200)
        }
        
        textView.snp.makeConstraints { make in
            make.top.equalTo(attachmentImageView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(10)
            make.bottom.equalTo(view.keyboardLayoutGuide.snp.top).inset(-10) // Текст до клавиатуры
        }
    }
    
    private func setImageHeight() {
        let height = attachmentImageView.image != nil ? 200 : 0
        
        attachmentImageView.snp.makeConstraints { make in
            make.height.equalTo(height)
        }
    }
    
    private func hideKeyboard() { // Клавиатура скрывается по нажатию на любую част экрана вне клавиатуры
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardTap))
        view.addGestureRecognizer(recognizer)
    }
    
    @objc private func hideKeyboardTap() {
        textView.resignFirstResponder()
    }
    
    private func setupBars() {  // Кнопка "мусорка" в toolBar
        
        let trashButton = UIBarButtonItem(
            barButtonSystemItem: .trash,
            target: self,
            action: #selector(deleteAction)
        )
        setToolbarItems([trashButton], animated: true)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(  // Кнопка save в navigationBar
            barButtonSystemItem: .save,
            target: self,
            action: #selector(saveAction)
        )
    }
}
