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
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = meditation.title
        
        setupNavBar()
    }
    
    func setupNavBar() {
        self.title = "How to Do \(meditation.title)"
    }
    
}
