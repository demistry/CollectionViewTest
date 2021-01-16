//
//  ViewController.swift
//  CollectionViewTest
//
//  Created by David Ilenwabor on 16/01/2021.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var pinnedView: UIView!
    var bool: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pinnedView.isUserInteractionEnabled = false //since there are no interactions on the pinned view
        collectionView.register(HeaderCollectionReusableView.nib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.headerReferenceSize = CGSize(width: view.frame.width, height: 250)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView.collectionViewLayout = layout
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 300
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let totalWidth = collectionView.frame.width - collectionView.contentInset.left - collectionView.contentInset.right
        let halfWidth = totalWidth / 2
        let widthOfCell = halfWidth - 8
        if let cell = collectionView.cellForItem(at: indexPath) as? BackdropCollectionViewCell {
            cell.imageViewHeightConstraint.constant = widthOfCell
        }
        print("width of cell... \(widthOfCell)")
        let size = CGSize(width: widthOfCell, height: widthOfCell + 59)//59 is from sum of heights of 2 labels in the cell and their vertical constraints
        return size

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCollectionReusableView.identifier, for: indexPath) as! HeaderCollectionReusableView
        return header
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        if scrollView.contentOffset.y >= 184 { //subtract height of Follow button + bottom constraint constant from total supplementary view height, thats min height to show pinned view (In this case (250 - ( 50 + 16 ) = 184)
            if bool {
                return //to avoid multiple calls...
            }
            bool = true
            UIView.animate(withDuration: 0.15) { [weak self] in
                guard let self = self else { return }
                self.pinnedView.alpha = 1
            }
        } else {
            if !bool {
                return //to avoid multiple calls...
            }
            bool = false
            UIView.animate(withDuration: 0.15) { [weak self] in
                guard let self = self else { return }
                self.pinnedView.alpha = 0
            }
        }
    }
}


