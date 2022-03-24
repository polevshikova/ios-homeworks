//
//  InfoViewController.swift
//  Navigation
//
//  Created by Юлия Полевщикова on 18.02.2022.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Info"
        let button = UIButton(frame: CGRect(x: 130, y: 770, width: 150, height: 40))
        view.addSubview(button)
        button.setTitle("Show alert", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(alertClicked), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 90).isActive = true
        button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -90).isActive = true
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -90).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    @objc func alertClicked() {
        let alert = UIAlertController(title: "Attention", message: "Message", preferredStyle: .alert)
        let okBtn = UIAlertAction(title: "yep", style: .default, handler: nil)
        let noBtn = UIAlertAction(title: "no", style: .destructive, handler: nil)
        alert.addAction(okBtn)
        alert.addAction(noBtn)
        present(alert, animated: true, completion: nil)
        print("alert work")
    }
}
