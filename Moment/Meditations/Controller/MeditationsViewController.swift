//
//  MeditationsViewController.swift
//  Moment
//
//  Created by Christopher Cowdrey on 5/20/21.
//

import Foundation
import UIKit

class MeditationsViewController: UIViewController {
    
    var meditations = [[Meditation]]()
    var selectedMeditation = Meditation()
    var meditationManager = MeditationDataManager()
    let margin: CGFloat = 15.0
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        collectionView.delegate = self
        collectionView.dataSource = self
        navigationController?.navigationBar.prefersLargeTitles = true
        meditations = meditationManager.getMeditations()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMeditationDetails" {
            guard let vc = segue.destination as? MeditationDetailsViewController else { return }
            
            vc.meditation = selectedMeditation
        }
    }
}


// MARK: - Setup CollectionView Cells / Selection
extension MeditationsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedMeditation = meditations[indexPath.section][indexPath.row]
        self.performSegue(withIdentifier: "showMeditationDetails", sender: self)
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
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "MeditationCollectionViewHeader", for: indexPath) as? MeditationCollectionViewHeader else {
                fatalError()
            }
            
            let headerText = meditations[indexPath.section][indexPath.row].category.rawValue
            headerView.headerLabel.text = "\(headerText) Meditations"
            return headerView
            
        default:
            return UICollectionReusableView()
        }
    }
}

extension MeditationsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            let noOfCellsInRow = 3
            let totalSpace = margin + margin + margin * CGFloat(noOfCellsInRow - 1)
            let size = (collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow)
            return CGSize(width: size, height: 250)
        } else {
            let noOfCellsInRow = 2
            
            let totalSpace = margin + margin + margin * CGFloat(noOfCellsInRow - 1)
            let size = (collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow)
            return CGSize(width: size, height: 185)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
    }
}
