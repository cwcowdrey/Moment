//
//  MeditationCollectionViewCell.swift
//  Moment
//
//  Created by Christopher Cowdrey on 5/21/21.
//

import Foundation
import UIKit

class MeditationCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var tryItButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .black
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupCell(with meditation: Meditation) {
        
        
        iconImage.image = UIImage(named: meditation.type.rawValue)
        
        titleLabel.text = meditation.title
        self.backgroundColor = .white
        
        switch meditation.category {
        case .breathing:
            styleCell(color: UIColor.init(hex: "#68edc6", alpha: 1))
        case .mantra:
            styleCell(color: UIColor.init(hex: "#8E8FDD", alpha: 1))
        case .body:
            styleCell(color: UIColor.init(hex: "#90bede", alpha: 1))
        }
    }
    
    func styleCell(color: UIColor) {
        
        // set banner color
        view.backgroundColor = color
        
        self.sendSubviewToBack(view)
        
        //format image
        iconImage.layer.cornerRadius = iconImage.bounds.size.width / 4
        iconImage.clipsToBounds = true
        iconImage.layer.borderWidth = 3.0
        iconImage.layer.borderColor = color.cgColor
        
        // style the border
        self.layer.borderWidth = 4.0
        self.layer.borderColor = color.cgColor
        self.layer.cornerRadius = 20.0
        self.clipsToBounds = true
        
        // style the button
        tryItButton.layer.borderWidth = 2.0
        tryItButton.layer.borderColor = color.cgColor
        tryItButton.layer.cornerRadius = 10.0
        tryItButton.clipsToBounds = true
    }
}

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }
        
        assert(hexFormatted.count == 6, "Invalid hex code used.")
        
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)
        
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: alpha)
    }
}
