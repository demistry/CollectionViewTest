//
//  HeaderCollectionReusableView.swift
//  CollectionViewTest
//
//  Created by David Ilenwabor on 16/01/2021.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {

    class var identifier: String {
        return String(describing: self)
    }
    
    class var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
