//
//  ImageNoteTableViewCell.swift
//  NotesApp
//
//  Created by Антон Баландин on 10.04.24.
//

import SnapKit
import UIKit

final class ImageNoteTableViewCell: UITableViewCell {
    
    // MARK: - GUI Variables
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGreen
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let attachmentImageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 10
        view.image = UIImage(named: "mockImage")
        view.layer.masksToBounds = true // не отображать те части изображения. которые выходят за рамки
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Title label text"
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    func setNote(note: Note) {
        titleLabel.text = note.title
        guard let imageData = note.image,
              let image =  UIImage(data: imageData) else { return }
        attachmentImageView.image = image
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        addSubview(containerView)
        containerView.addSubview(attachmentImageView)
        containerView.addSubview(titleLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(5)
            make.leading.trailing.equalToSuperview().inset(10)
        }
        
        attachmentImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(5)
            make.height.equalTo(130)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(attachmentImageView.snp.bottom).offset(10)
            make.leading.trailing.bottom.equalToSuperview().inset(10)
            
        }
    }
}
