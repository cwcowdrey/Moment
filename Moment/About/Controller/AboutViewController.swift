//
//  AboutViewController.swift
//  Moment
//
//  Created by Christopher Cowdrey on 5/20/21.
//

import Foundation
import UIKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imageStackView: UIStackView!
    @IBOutlet weak var taglineLabel: UILabel!
    
    
        
    override func viewDidLoad() {
        setText()
    }
    
    func setText() {
        headerLabel.text = "What is Moment?"
        
        descriptionLabel.text = "Moment believes that true power comes from within and you don't need any prerecorded instructions on how to do it. All of our meditations give you the tools you need to go out on your own and explore. Enjoy!"
        
        taglineLabel.text = "Live in the Moment!"
        
    }
    
}
