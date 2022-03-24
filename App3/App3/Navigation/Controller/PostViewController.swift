//
//  PostViewController.swift
//  Navigation
//
//  Created by Юлия Полевщикова on 18.02.2022.
//

import UIKit

class PostViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemGray3
        let myPost = Post()
        let titleLabel = UILabel()
        titleLabel.text = myPost.title
        title = titleLabel.text
        navigationItem.backButtonTitle = "назад"
        let infoImage = UIImage(named: "info")
        let infoButton = UIBarButtonItem(image: infoImage, style: .plain, target: self, action: #selector(buttonInfoClicked))
        navigationItem.rightBarButtonItem = infoButton
    }
        
    @objc func buttonInfoClicked() {
        let infoViewController = InfoViewController()
        navigationController?.pushViewController(infoViewController, animated: true)
    }

}
