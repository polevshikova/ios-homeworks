//
//  LogInViewController.swift
//  Navigation
//
//  Created by Юлия Полевщикова on 23.02.2022.
//

import UIKit

private var loginPasswordStackView: UIStackView {
    let stackView = UIStackView()
    stackView.backgroundColor = .systemGray6
    stackView.clipsToBounds = true
    stackView.axis = .vertical
    stackView.distribution = .fillEqually
    stackView.layer.borderWidth = 0.5
    stackView.layer.borderColor = UIColor.lightGray.cgColor
    stackView.layer.cornerRadius = 10
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
}

class LogInViewController: UIView {

    class UIViewController: UIView {

        }
}
