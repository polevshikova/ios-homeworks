//
//  FeedViewController.swift
//  Navigation
//
//  Created by Юлия Полевщикова on 26.02.2022.
//

import UIKit

class FeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Feed"
        let button = UIButton(frame: CGRect(x: 130, y: 770, width: 150, height: 40))
        view.addSubview(button)
        button.setTitle("open", for: .normal)
        button.backgroundColor = .systemGray2
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
    }
    
    @objc func buttonClicked() {
        let postViewController = PostViewController()
        navigationController?.pushViewController(postViewController, animated: true)
    }
}

struct Post {
    
    let title:String = "post"
}
