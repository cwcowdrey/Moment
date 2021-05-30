//
//  MeditationsViewController.swift
//  Moment
//
//  Created by Christopher Cowdrey on 5/20/21.
//

import Foundation
import UIKit

class MeditationsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var meditations = [[Meditation(title: "B 1", type: .breathing, instructions: "do it", description: "breath ok just do it"), Meditation(title: "B 2", type: .breathing, instructions: "do it", description: "breath ok just do it"), Meditation(title: "B 3", type: .breathing, instructions: "do it", description: "breath ok just do it"), Meditation(title: "B 4", type: .breathing, instructions: "do it", description: "breath ok just do it")], [Meditation(title: "M 1", type: .mantra, instructions: "do it", description: "breath ok just do it"), Meditation(title: "M 2", type: .mantra, instructions: "do it", description: "breath ok just do it"), Meditation(title: "M 3", type: .mantra, instructions: "do it", description: "breath ok just do it"), Meditation(title: "M 4", type: .mantra, instructions: "do it", description: "breath ok just do it")]]
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "MeditationCollectionViewHeader", for: indexPath) as? MeditationCollectionViewHeader else {
                fatalError()
            }
            
            let headerText = meditations[indexPath.section][indexPath.row].type.rawValue
            headerView.headerLabel.text = headerText
            return headerView
            
        default:
            assert(false, "invalid element")
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return meditations[section].count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return meditations.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MeditationCollectionViewCell", for: indexPath) as? MeditationCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.setupCell(with: meditations[indexPath.section][indexPath.row])
        return cell
        
    }
}
