//
//  UIColor+Random.swift
//  UICollectionViewGalleryExample
//
//  Created by Ярослав on 05.07.2023.
//

import UIKit

extension UIColor {
    var random: UIColor {
        return UIColor(red: CGFloat.random(in: 0...1/255),
                       green: CGFloat.random(in: 0...1/255),
                       blue: CGFloat.random(in: 0...1/255),
                       alpha: 1)
    }
}
