//
//  PlusPhotoView.swift
//  Navigation
//
//  Created by Юлия Полевщикова on 24.03.2022.
//

import UIKit

class ZoomPhotoView: UIView {

    private lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.toAutoLayout()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var exitButton: UIButton = {
        let exitButton = UIButton()
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        exitButton.setTitle("x", for: .normal)
        exitButton.addTarget(self, action: #selector(exitTapped), for: .touchUpInside)
        exitButton.backgroundColor = .gray
        exitButton.layer.cornerRadius = 10
        return exitButton
    }()
    
    func set(image: String) {
        photoImageView.image = UIImage(named: image)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.drawSelf()
        self.backgroundColor = .white
        self.alpha = 0
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func drawSelf() {
        self.addSubviews(exitButton, photoImageView)
        
        var constraints = [NSLayoutConstraint]()
        
        NSLayoutConstraint.activate([
            self.exitButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            self.exitButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            self.exitButton.heightAnchor.constraint(equalToConstant: 40),
            self.exitButton.widthAnchor.constraint(equalToConstant: 40),
            
            self.photoImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.photoImageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            self.photoImageView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
    
    @objc func exitTapped() {

        UIView.animate(withDuration: 0.5) {
            self.alpha = 0
        }
    }
}
