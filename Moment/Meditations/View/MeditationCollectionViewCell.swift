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
        
        titleLabel.text = meditation.title
        
        switch meditation.type {
        case .breathing:
            self.backgroundColor = .white
            styleCell(color: UIColor.init(hexString: "#e5e1ee"))
        case .mantra:
            self.backgroundColor = .white
            styleCell(color: UIColor.init(hexString: "#68edc6"))
        case .nirvana:
            self.backgroundColor = .white
            styleCell(color: UIColor.init(hexString: "#90bede"))
        }
        
    }
    
    func styleCell(color: UIColor) {
        
        //set banner color
//        var frame = self.bounds
//        frame.origin.y = -frame.size.height * 0.65
//        let view = UIView(frame: frame)
        
//        view.frame = frame
        
//        view.accessibilityIdentifier = "hello"
        view.backgroundColor = color
        
//        view.removeFromSuperview()
        
//        self.addSubview(view)
        self.sendSubviewToBack(view)
        
        //format image
        iconImage.layer.cornerRadius = iconImage.bounds.size.width / 2
        iconImage.clipsToBounds = true
        iconImage.layer.borderWidth = 4.0
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
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        return String(format:"#%06x", rgb)
    }
}
