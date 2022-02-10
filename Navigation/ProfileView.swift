//
//  ProfileView.swift
//  Navigation
//
//  Created by Юлия Полевщикова on 10.02.2022.
//

import UIKit

class ProfileView: UIView {
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var bioTextView: UITextView!
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            self.setupView()
        }
        
        required init?(coder: NSCoder) {
            super.init(coder: coder)
            self.setupView()
        }
        
        private func setupView() {
            let view = self.loadViewFromXib()
            view.frame = self.bounds // здесь view, загруженная из xib-файла, добавляется на вьюху класса. Ее размер соответствует размеру вьюхе класса и растягивается так же, как и сама вьюха класса.
            
            view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            self.addSubview(view)
        }
        
        private func loadViewFromXib() -> UIView {
            guard let view = Bundle.main.loadNibNamed("ProfileView", owner: nil, options: nil)?.first as? UIView else { return UIView() }
            
            return view
        }

}

