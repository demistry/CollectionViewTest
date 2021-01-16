//
//  SecondHeaderCollectionReusableView.swift
//  CollectionViewTest
//
//  Created by David Ilenwabor on 16/01/2021.
//

import UIKit

class SecondHeaderCollectionReusableView: UICollectionReusableView {

    @IBOutlet var heightConstraint: NSLayoutConstraint!
    class var identifier: String {
        return String(describing: self)
    }
    
    class var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        heightConstraint.constant = 0
        // Initialization code
    }
    
    func setHeight(big: Bool) {
        heightConstraint.constant = big ? 50 : 0
    }
    
}
