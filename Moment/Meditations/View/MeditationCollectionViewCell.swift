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
    
    
    func setupCell(with meditation: Meditation) {
        titleLabel.text = meditation.title

    }
    
    
}

