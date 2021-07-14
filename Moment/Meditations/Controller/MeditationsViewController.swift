//
//  MeditationsViewController.swift
//  Moment
//
//  Created by Christopher Cowdrey on 5/20/21.
//

import Foundation
import UIKit

class MeditationsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var meditations = [[Meditation(title: "Box Breathing", type: .breathing, instructions: "Box breathing is a very common and effective technique that you can do anywhere, whether it be sitting on the bus or at work. It is best to be in a sitting position with your back nicely supported and your feet firmly on the ground.  \n\nBegin by closing your eyes. Breathe in through your nose while counting to four at a relaxed pace. Take time to notice the air entering your body. Hold your breath inside while again counting slowly to four.  Finally, you may slowly exhale for 4 seconds. Repeat the previous steps to finish your “box” pattern. For best results, repeat the process for several minutes or until you begin to feel calm again. \n\nIf you find the process difficult at first, or are having a hard time holding your breath, feel free to lower your cycles to intervals of 3 seconds, or whichever time feels doable to you.", description: "this meditation will make you feel relaxed. navy seals do it so it will work for you too. Enjoy.", time: "10 min", position: "Sitting", materials: "beads"), Meditation(title: "Kundalini", type: .breathing, instructions: "do it", description: "breath ok just do it", time: "10 min", position: "Sitting", materials: "beads"), Meditation(title: "4-7-8", type: .breathing, instructions: "Prepare for the practice by resting the tip of your tongue against the roof of your mouth, right behind your top front teeth. You’ll need to keep your tongue in place throughout the practice. It takes practice to keep from moving your tongue when you exhale. Exhaling during 4-7-8 breathing can be easier for some people when they purse their lips. \n\nFirst, let your lips part. Make a whooshing sound, exhaling completely through your mouth. Next, close your lips, inhaling silently through your nose as you count to four in your head. Then, for seven seconds, hold your breath. Make another whooshing exhale from your mouth for eight seconds.", description: "breath ok just do it", time: "10 min", position: "Sitting", materials: "beads"), Meditation(title: "Shamatha", type: .breathing, instructions: "do it", description: "breath ok just do it", time: "10 min", position: "Sitting", materials: "beads"), Meditation(title: "Zhuanqi", type: .breathing, instructions: "do it", description: "breath ok just do it", time: "10 min", position: "Sitting", materials: "beads")], [Meditation(title: "M 1", type: .mantra, instructions: "do it", description: "breath ok just do it", time: "10 min", position: "Sitting", materials: "beads"), Meditation(title: "M 2", type: .mantra, instructions: "do it", description: "breath ok just do it", time: "10 min", position: "Sitting", materials: "beads"), Meditation(title: "M 3", type: .mantra, instructions: "do it", description: "breath ok just do it", time: "10 min", position: "Sitting", materials: "beads"), Meditation(title: "M 4", type: .mantra, instructions: "do it", description: "breath ok just do it", time: "10 min", position: "Sitting", materials: "beads")], [Meditation(title: "N 1", type: .nirvana, instructions: "do it", description: "breath ok just do it", time: "10 min", position: "Sitting", materials: "beads"), Meditation(title: "N 2", type: .nirvana, instructions: "do it", description: "breath ok just do it", time: "10 min", position: "Sitting", materials: "beads"), Meditation(title: "N 3", type: .nirvana, instructions: "do it", description: "breath ok just do it", time: "10 min", position: "Sitting", materials: "beads"), Meditation(title: "N 4", type: .nirvana, instructions: "do it", description: "breath ok just do it", time: "10 min", position: "Sitting", materials: "beads")]]
    
    let margin: CGFloat = 15.0
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var selectedMeditation = Meditation()
    
    override func viewDidLoad() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "MeditationCollectionViewHeader", for: indexPath) as? MeditationCollectionViewHeader else {
                fatalError()
            }
            
            let headerText = meditations[indexPath.section][indexPath.row].type.rawValue
            headerView.headerLabel.text = "\(headerText) Meditations"
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
