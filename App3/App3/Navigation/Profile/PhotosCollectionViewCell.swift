//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Юлия Полевщикова on 08.03.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {

    lazy var photoGalleryImages: UIImageView = {
        let photoGalleryImages = UIImageView()
        photoGalleryImages.clipsToBounds = true
        photoGalleryImages.translatesAutoresizingMaskIntoConstraints = false
        return photoGalleryImages
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(self.photoGalleryImages)

        let labelCenterYAnchor = self.photoGalleryImages.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)
        let labelCenterXAnchor = self.photoGalleryImages.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor)
        let heightAnchor = self.photoGalleryImages.heightAnchor.constraint(equalTo: self.contentView.heightAnchor)
        let widthAnchor = self.photoGalleryImages.widthAnchor.constraint(equalTo: self.contentView.widthAnchor)

        NSLayoutConstraint.activate([labelCenterYAnchor, labelCenterXAnchor, heightAnchor, widthAnchor])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
