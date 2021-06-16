//
//  MeditationsViewController.swift
//  Moment
//
//  Created by Christopher Cowdrey on 5/20/21.
//

import Foundation
import UIKit

class MeditationsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var meditations = [[Meditation(title: "Box Breathing", type: .breathing, instructions: "do it", description: "breath ok just do it", time: "10 min", position: "Sitting", materials: "beads"), Meditation(title: "5-3-1-1", type: .breathing, instructions: "do it", description: "breath ok just do it", time: "10 min", position: "Sitting", materials: "beads"), Meditation(title: "Slow Breath", type: .breathing, instructions: "do it", description: "breath ok just do it", time: "10 min", position: "Sitting", materials: "beads"), Meditation(title: "B 4", type: .breathing, instructions: "do it", description: "breath ok just do it", time: "10 min", position: "Sitting", materials: "beads"), Meditation(title: "B 5", type: .breathing, instructions: "do it", description: "breath ok just do it", time: "10 min", position: "Sitting", materials: "beads")], [Meditation(title: "M 1", type: .mantra, instructions: "do it", description: "breath ok just do it", time: "10 min", position: "Sitting", materials: "beads"), Meditation(title: "M 2", type: .mantra, instructions: "do it", description: "breath ok just do it", time: "10 min", position: "Sitting", materials: "beads"), Meditation(title: "M 3", type: .mantra, instructions: "do it", description: "breath ok just do it", time: "10 min", position: "Sitting", materials: "beads"), Meditation(title: "M 4", type: .mantra, instructions: "do it", description: "breath ok just do it", time: "10 min", position: "Sitting", materials: "beads")], [Meditation(title: "N 1", type: .nirvana, instructions: "do it", description: "breath ok just do it", time: "10 min", position: "Sitting", materials: "beads"), Meditation(title: "N 2", type: .nirvana, instructions: "do it", description: "breath ok just do it", time: "10 min", position: "Sitting", materials: "beads"), Meditation(title: "N 3", type: .nirvana, instructions: "do it", description: "breath ok just do it", time: "10 min", position: "Sitting", materials: "beads"), Meditation(title: "N 4", type: .nirvana, instructions: "do it", description: "breath ok just do it", time: "10 min", position: "Sitting", materials: "beads")]]
    
    let margin: CGFloat = 15.0
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var selectedMeditation = Meditation()
    
    override func viewDidLoad() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        navigationController?.navigationBar.prefersLargeTitles = true
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMeditationDetails" {
            guard let vc = segue.destination as? MeditationDetailsViewController else { return }
            
            vc.meditation = selectedMeditation
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedMeditation = meditations[indexPath.section][indexPath.row]
        self.performSegue(withIdentifier: "showMeditationDetails", sender: self)
        
        print(meditations[indexPath.section][indexPath.row].title)
    }
    
    
}


extension MeditationsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        
        flowLayout.minimumInteritemSpacing = margin
        flowLayout.minimumLineSpacing = margin
        flowLayout.sectionInset = UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
        
        // number of columns
        let noOfCellsInRow = 2
        
        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))
        
//        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
        let size = (collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow)
        return CGSize(width: size, height: size * 1.10)
    }
    
    
}
