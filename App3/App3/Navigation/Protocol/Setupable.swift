//
//  Setupable.swift
//  Navigation
//
//  Created by Юлия Полевщикова on 08.03.2022.
//

import UIKit

protocol ViewModelProtocol {}

protocol Setupable {
    func setup(with viewModel: ViewModelProtocol)
}

protocol ChangeViewsDelegate: AnyObject {
    func viewsChanged(at indexPath: IndexPath)
}

protocol ChangeLikesDelegate: AnyObject {
    func likesChanged()
}
