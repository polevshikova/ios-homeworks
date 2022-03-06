//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Юлия Полевщикова on 18.02.2022.
//

import UIKit

import UIKit

protocol ProfileHeaderViewProtocol: AnyObject {
    func didTapShowStatusButton(textFieldIsVisible: Bool, completion: @escaping () -> Void)
}

final class ProfileHeaderView: UIView {
    
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Photo"))
        imageView.layer.cornerRadius = 80
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 4
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Юля"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.text = "статус"
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var statusTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "напишите что-нибудь"
        textField.returnKeyType = .done
        textField.autocapitalizationType = .words
        textField.font = .systemFont(ofSize: 15)
        textField.textColor = .systemGray2
        textField.backgroundColor = .systemGray4
        textField.borderStyle = .roundedRect
        textField.returnKeyType = .next
        textField.keyboardType = .default
        textField.clearButtonMode = .always
        textField.alpha = 0
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var setStatusButton: UIButton = {
        let button = UIButton()
        button.setTitle("показать статус", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.addTarget(self, action: #selector(self.didTapSetStatusButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var statusTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .lightGray
        textView.font = .systemFont(ofSize: 14)
        textView.textColor = .gray
        textView.text = "статус"
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private var topSetStatusButtonOn: NSLayoutConstraint?
    private var topSetStatusButtonOff: NSLayoutConstraint?
    weak var delegate: ProfileHeaderViewProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.drawSelf()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func drawSelf() {
        self.addSubview(self.avatarImageView)
        self.addSubview(self.fullNameLabel)
        self.addSubview(self.statusLabel)
        self.addSubview(self.setStatusButton)
        self.addSubview(self.statusTextField)
        let topAvatarImageConstraint = self.avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16)
        let leadingAvatarImageConstraint = self.avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let widthAvatarImageConstraint = self.avatarImageView.widthAnchor.constraint(equalToConstant: 150)
        let heightAvatarImageConstraint = self.avatarImageView.heightAnchor.constraint(equalToConstant: 150)
        let topFullNameLabelConstraint = self.fullNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 27)
        let leadingFullNameLabelConstraint = self.fullNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 182)
        let trailingFullNameLabelConstraint = self.fullNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        self.topSetStatusButtonOn = self.setStatusButton.topAnchor.constraint(equalTo: self.avatarImageView.bottomAnchor, constant: 16)
        self.topSetStatusButtonOn?.priority = UILayoutPriority(rawValue: 999)
        let leadingSetStatusButton = self.setStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let trailingSetStatusButton = self.setStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        let heightSetStatusButton = self.setStatusButton.heightAnchor.constraint(equalToConstant: 50)
        let bottomStatusLabel = self.statusLabel.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: -18)
        let leadingStatusLabel = self.statusLabel.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor)
        let trailingStatusLabel = self.statusLabel.trailingAnchor.constraint(equalTo: fullNameLabel.trailingAnchor)
        NSLayoutConstraint.activate([
            topAvatarImageConstraint, leadingAvatarImageConstraint, widthAvatarImageConstraint,
            heightAvatarImageConstraint, topFullNameLabelConstraint, leadingFullNameLabelConstraint,
            trailingFullNameLabelConstraint,
            self.topSetStatusButtonOn, leadingSetStatusButton, trailingSetStatusButton,
            heightSetStatusButton, bottomStatusLabel, leadingStatusLabel, trailingStatusLabel
        ].compactMap({ $0}))
    }
    
    @objc private func didTapSetStatusButton() {
        if self.statusTextField.isHidden {
            self.statusTextField.alpha = 1
            NSLayoutConstraint.deactivate([self.topSetStatusButtonOff].compactMap({ $0 }))
            let topConstraint = self.statusTextField.topAnchor.constraint(equalTo: self.statusLabel.bottomAnchor, constant: 27)
            let leadingConstraint = self.statusTextField.leadingAnchor.constraint(equalTo: self.statusLabel.leadingAnchor)
            let trailingConstraint = self.statusTextField.trailingAnchor.constraint(equalTo: self.statusLabel.trailingAnchor)
            let heightStatusTextFieldConstraint = self.statusTextField.heightAnchor.constraint(equalToConstant: 34)
            self.topSetStatusButtonOn = self.setStatusButton.topAnchor.constraint(equalTo: self.avatarImageView.bottomAnchor, constant: 70)
            NSLayoutConstraint.activate([
                topConstraint, leadingConstraint, trailingConstraint, heightStatusTextFieldConstraint,
                self.topSetStatusButtonOn
            ].compactMap({ $0 }))
        } else {
            self.statusTextField.isHidden = false
            self.statusTextField.alpha = 0
            NSLayoutConstraint.deactivate([self.topSetStatusButtonOn].compactMap({ $0 }))
            if self.statusTextField.text != "" {
                self.statusLabel.text = self.statusTextField.text
                self.statusTextField.text = .none
            }
            self.topSetStatusButtonOff = self.setStatusButton.topAnchor.constraint(equalTo: self.avatarImageView.bottomAnchor, constant: 16)

            NSLayoutConstraint.activate([self.topSetStatusButtonOff].compactMap({ $0 }))
        }
        self.delegate?.didTapShowStatusButton(textFieldIsVisible: self.statusTextField.isHidden) { [weak self] in
            self?.statusTextField.isHidden.toggle()
        }
    }
}
