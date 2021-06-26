//
//  AboutViewController.swift
//  Moment
//
//  Created by Christopher Cowdrey on 5/20/21.
//

import Foundation
import UIKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var mainStackView: UIStackView!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var benefitsHeader: UILabel!
    @IBOutlet weak var benefitsLabel: UILabel!
    
    
        
    override func viewDidLoad() {
        setText()
    }
    
    func setText() {
        headerLabel.text = "What is Moment?"

        descriptionLabel.text = "Moment is a meditation app that's a little different than most of the other meditation apps you might find out there. Most noticably, our meditations are not guided. At Moment, we believe peace can only truly be found during times of quiet and solitude. These are the time when we can authentically be ourselves and when the most learning can occur."
        
        
        benefitsLabel.attributedText = bulletPointList(strings: ["Increased self confidence", "better happy life", "better decision making"])
    }
    
    func bulletPointList(strings: [String]) -> NSAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.headIndent = 15
//        paragraphStyle.minimumLineHeight = 22
//        paragraphStyle.maximumLineHeight = 22
        paragraphStyle.tabStops = [NSTextTab(textAlignment: .left, location: 15)]

        let stringAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.paragraphStyle: paragraphStyle
        ]

        let string = strings.map({ "•\t\($0)" }).joined(separator: "\n")

        return NSAttributedString(string: string,
                                  attributes: stringAttributes)
    }
    
}
