//
//  OnboardingCollectionViewCell.swift
//  Bobo
//
//  Created by Azura Sakan Taufik on 29/04/21.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: OnboardingCollectionViewCell.self)
    @IBOutlet weak var slideImage: UIImageView!
    @IBOutlet weak var slideTitle: UITextView!
    @IBOutlet weak var slideDescription: UITextView!
    
    func setup(_ slide: OnboardingSlide) {
        slideImage.image = slide.image
        slideTitle.text = slide.title
        slideDescription.text = slide.description
    }
    
}
