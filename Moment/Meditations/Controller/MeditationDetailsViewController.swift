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
    @IBOutlet weak var titleLabel: UILabel!
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
        styleStackViews()
    }
    
    func styleStackViews() {
        mainStackView.setCustomSpacing(10, after: infoStackView)
        mainStackView.setCustomSpacing(10, after: instructionsHeader)
        infoStackView.addBottomBorderWithColor(color: UIColor.init(hex: "E1E4E9", alpha: 1), width: 2)
    }
    
    func setupNavBar() {
        self.title = "Meditation Details"
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationController?.navigationBar.tintColor = .white
    }
    
    func setupMeditationInfo() {
        titleLabel.text = meditation.title
        timeValueLabel.text = meditation.time
        positionValueLabel.text = meditation.position
        materialsValueLabel.text = meditation.materials
        descriptionLabel.text = "Happy meditating!"
        instructionsLabel.text = meditation.instructions
    }
}

extension UIView {
    func addBottomBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height, width: UIScreen.main.bounds.width - 20, height: width)
        self.layer.addSublayer(border)
    }
}
