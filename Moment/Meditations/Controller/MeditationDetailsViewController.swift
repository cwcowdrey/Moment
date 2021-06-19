//
//  MeditationDetailsViewController.swift
//  Moment
//
//  Created by Christopher Cowdrey on 6/2/21.
//

import Foundation
import UIKit

class MeditationDetailsViewController: UIViewController {
    
    var meditation = Meditation()
    
    @IBOutlet weak var mainStackView: UIStackView!
    
    
    @IBOutlet weak var bannerImage: UIImageView!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var timeHeaderLabel: UILabel!
    @IBOutlet weak var timeValueLabel: UILabel!
    
    @IBOutlet weak var positionHeaderLabel: UILabel!
    @IBOutlet weak var positionValueLabel: UILabel!
    
    @IBOutlet weak var materialsHeaderLabel: UILabel!
    @IBOutlet weak var materialsValueLabel: UILabel!
    
    
    @IBOutlet weak var instructionsLabel: UILabel!
    
    @IBOutlet weak var instructionsHeader: UILabel!
    
    @IBOutlet weak var infoStackView: UIStackView!
    
    
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
                
        setupNavBar()
        setupMeditationInfo()
        
        mainStackView.setCustomSpacing(5, after: infoStackView)
        mainStackView.setCustomSpacing(10, after: instructionsHeader)
        
        infoStackView.layer.borderWidth = 2
        infoStackView.layer.borderColor = UIColor.lightGray.cgColor
        
        bannerImage.layer.borderWidth = 2
        bannerImage.layer.borderColor = UIColor.lightGray.cgColor
        
//        infoStackView.addBottomBorderWithColor(color: .lightGray, width: 2)
    }
    
    func setupNavBar() {
        self.title = "How to Do \(meditation.title)"
    }
    
    
    func setupMeditationInfo() {
        timeValueLabel.text = meditation.time
        positionValueLabel.text = meditation.position
        materialsValueLabel.text = meditation.materials
        
        descriptionLabel.text = meditation.description
        
        instructionsLabel.text = meditation.instructions
    }
    
}


extension UIView {
    func addTopBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: width)
        self.layer.addSublayer(border)
    }

    func addRightBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: self.frame.size.width - width, y: 0, width: width, height: self.frame.size.height)
        self.layer.addSublayer(border)
    }

    func addBottomBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: width)
        self.layer.addSublayer(border)
    }

    func addLeftBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: 0, width: width, height: self.frame.size.height)
        self.layer.addSublayer(border)
    }
}
