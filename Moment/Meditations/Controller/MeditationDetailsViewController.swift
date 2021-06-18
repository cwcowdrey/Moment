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
    
    @IBOutlet weak var bannerImage: UIImageView!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var timeHeaderLabel: UILabel!
    @IBOutlet weak var timeValueLabel: UILabel!
    
    @IBOutlet weak var positionHeaderLabel: UILabel!
    @IBOutlet weak var positionValueLabel: UILabel!
    
    @IBOutlet weak var materialsHeaderLabel: UILabel!
    @IBOutlet weak var materialsValueLabel: UILabel!
    
    
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
                
        setupNavBar()
        setupMeditationInfo()
    }
    
    func setupNavBar() {
        self.title = "How to Do \(meditation.title)"
    }
    
    
    func setupMeditationInfo() {
        timeValueLabel.text = meditation.time
        positionValueLabel.text = meditation.position
        materialsValueLabel.text = meditation.materials
        
        descriptionLabel.text = meditation.description
    }
    
}
