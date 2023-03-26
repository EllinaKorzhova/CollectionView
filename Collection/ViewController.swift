//
//  ViewController.swift
//  Collection
//
//  Created by Эллина Коржова on 26.03.23.
//

import UIKit




class ViewController: UIViewController {

   var cellidentifier = "cell"
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 20
        layout.sectionInset = .init(top: 0, left: 10, bottom: 20, right: 10)

        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .systemIndigo
        collection.delegate = self
        collection.dataSource = self
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellidentifier)
        return collection
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.frame = view.bounds
        view.addSubview(collectionView)
        self.navigationController?.navigationBar.prefersLargeTitles = true
        title = "Colllection"
        }
    }

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = view.frame.width - 40
        let height: CGFloat = collectionView.frame.height / 2
        return CGSize(width: width, height: height)
    }

    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint> ){
        let pageWidth: CGFloat = view.frame.width - 40
        let cellWidth = pageWidth + 20
        let targetXContentOffset = targetContentOffset.pointee.x / cellWidth
        targetContentOffset.pointee.x = round(targetXContentOffset) * cellWidth - 20
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView( _ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        50
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellidentifier, for: indexPath)
        cell.backgroundColor = .systemYellow
        cell.layer.cornerRadius = 20
        return cell
    }
}
