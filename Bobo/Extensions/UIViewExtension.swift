//
//  UIViewExtension.swift
//  Bobo
//
//  Created by Azura Sakan Taufik on 29/04/21.
//

import Foundation
import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat{
        get{
            return self.cornerRadius
        }
        set{
            self.layer.cornerRadius = newValue
        }
    }
}
