//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Юлия Полевщикова on 08.03.2022.
//

import UIKit

class PhotosViewController: UIViewController {
    
    private enum Constants {
        static let itemCount: CGFloat = 3
    }
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        return layout
    }()
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: "PhotosCollectionViewCell")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "DefaultCollectionCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()

    private var collectionDataSource : [CollectionViewModel] = [CollectionViewModel(image: "1.jpeg"),
                                                                CollectionViewModel(image: "2.jpeg"),
                                                                CollectionViewModel(image: "3.jpeg"),
                                                                CollectionViewModel(image: "4.jpeg"),
                                                                CollectionViewModel(image: "5.jpeg"),
                                                                CollectionViewModel(image: "6.jpeg"),
                                                                CollectionViewModel(image: "7.jpeg"),
                                                                CollectionViewModel(image: "8.jpeg"),
                                                                CollectionViewModel(image: "9.jpeg"),
                                                                CollectionViewModel(image: "10.jpeg"),
                                                                CollectionViewModel(image: "11.jpeg"),
                                                                CollectionViewModel(image: "12.jpeg"),
                                                                CollectionViewModel(image: "13.jpeg"),
                                                                CollectionViewModel(image: "14.jpeg"),
                                                                CollectionViewModel(image: "15.jpeg"),
                                                                CollectionViewModel(image: "16.jpeg"),
                                                                CollectionViewModel(image: "17.jpeg"),
                                                                CollectionViewModel(image: "18.jpeg"),
                                                                CollectionViewModel(image: "19.jpeg"),
                                                                CollectionViewModel(image: "20.jpeg")]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.title = "Photo Gallery"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func setupView() {
        self.view.addSubview(self.collectionView)
        
        let topConstraint = self.collectionView.topAnchor.constraint(equalTo: self.view.topAnchor)
        let bottomConstraint = self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        let leadingConstraint = self.collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let trailingConstraint = self.collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        
        NSLayoutConstraint.activate([
            topConstraint, bottomConstraint,leadingConstraint, trailingConstraint
        ])
    }
    
    private func itemSize(for width: CGFloat, with spacing: CGFloat) -> CGSize {
        let neededWidth = width - 4 * spacing
        let itemWidth = floor(neededWidth / Constants.itemCount)
        return CGSize(width: itemWidth, height: itemWidth)
    }
}

extension PhotosViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.collectionDataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosCollectionViewCell", for: indexPath) as? PhotosCollectionViewCell else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCollectionCell", for: indexPath)
            cell.backgroundColor = .black
            return cell
        }
        cell.backgroundColor = .systemGray6
        let photos = collectionDataSource[indexPath.row]
        cell.photoGalleryImages.image = UIImage(named: photos.image)
        cell.photoGalleryImages.contentMode = .scaleAspectFill
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt: IndexPath) -> CGSize {
        let spacing = ( collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.minimumInteritemSpacing
        return self.itemSize(for: collectionView.frame.width, with: spacing ?? 0)
    }
}
