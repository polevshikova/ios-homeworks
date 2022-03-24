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

