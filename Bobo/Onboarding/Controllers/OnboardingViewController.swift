//
//  OnboardingViewController.swift
//  Bobo
//
//  Created by Azura Sakan Taufik on 29/04/21.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var continueBtn: UIButton!
    
    var slides: [OnboardingSlide] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slides = [
            OnboardingSlide(title: "Welcome to Bobo", description: "Bobo is an app designed for you to be able to read bedtime stories for your kids whenever they may need you! By recording your voice, your child will be able to listen to you reading their bed time stories any night. Let’s begin!", image: #imageLiteral(resourceName: "Moon")),
            OnboardingSlide(title: "Beyond Imagination", description: "It is important for children to imagine as it helps them to be creative and have a dream. In the words of Albert Einstein; “Imagination is more important than knowledge. Knowledge is limited. Imagination encircles the world”.", image: #imageLiteral(resourceName: "Heart")),
            OnboardingSlide(title: "Foster Stronger Bonds", description: "While being physically together is the best way to have a bedtime story together, we understand that it’s not always possible due to work. Hre, Bobo wants to remove some of the barriers  and ensure your children can feel as if you are always with them.", image: #imageLiteral(resourceName: "Hug")),
        ]
    }

    @IBAction func onContinue(_ sender: Any) {
        
    }
}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        // Pass the data on that index
        cell.setup(slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
}
