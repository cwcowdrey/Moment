//
//  MeditationsViewController.swift
//  Moment
//
//  Created by Christopher Cowdrey on 5/20/21.
//

import Foundation
import UIKit

class MeditationsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var meditations = [[Meditation(title: "Box Breathing", type: .breathing, instructions: "Box breathing is a very common and effective technique that you can do anywhere, whether it be sitting on the bus or at work. It is best to be in a sitting position with your back nicely supported and your feet firmly on the ground.  \n\nBegin by closing your eyes. Breathe in through your nose while counting to four at a relaxed pace. Take time to notice the air entering your body. Hold your breath inside while again counting slowly to four.  Finally, you may slowly exhale for 4 seconds. Repeat the previous steps to finish your “box” pattern. For best results, repeat the process for several minutes or until you begin to feel calm again. \n\nIf you find the process difficult at first, or are having a hard time holding your breath, feel free to lower your cycles to intervals of 3 seconds, or whichever time feels doable to you.", description: "this meditation will make you feel relaxed. navy seals do it so it will work for you too. Enjoy.", time: "10 min", position: "Sitting", materials: "None"), Meditation(title: "Kundalini", type: .breathing, instructions: "This practice emphasizes the practice of relaxed breathing, rather than stressful, chaotic breaths. It is best done lying on your back, but sitting is acceptable if that is more comfortable. \n\nTo begin, place one hand on top of your chest and the other on the middle of your stomach. Carefully and deliberately breath in through your nose and notice that your stomach is elevating the hand on top of it. The goal of this is keep the hand on your chest as still as possible, as chest breathing indicated high exertion or stress. Try to take full, deep breaths that fill your lungs, rather than shallow breaths that only reach your chest cavity. By doing this, you are strengthening your diaphragmatic breathing, which leads to more feelings of calm. ", description: "breath ok just do it", time: "10 min", position: "Supine", materials: "None"), Meditation(title: "4-7-8", type: .breathing, instructions: "4-7-8 is a breathing pattern exercise proven to lower anxiety and can help calm emotions stemming from panic. \n\nBegin the practice by resting the tip of your tongue against the roof of your mouth, right next to your front teeth. It is important to keep your tongue in this same position for the duration of this meditation. It can be challenging at first, but try to keep your tongue from moving while you breath in and out.  \n\nFirst, take a few normal breaths and let your heartrate settle. Next, keeping your mouth closed, inhale through your nose and slowly count to four. Then, hold your breath for seven seconds. Finally, exhale for eight seconds. It can also be helpful to make a whooshing sound as you exhale..", description: "breath ok just do it", time: "10 min", position: "Sitting", materials: "None"), Meditation(title: "Shamatha", type: .breathing, instructions: "Shamatha breathing is a technique based on the idea of restoring your breath to its natural, calm state. It’s very common and popular among meditators, and has been described as focusing on keeping your breath  “not too tight, not too loose”. It essentially serves to reset your breath \n\nBegin by gaining awareness of your body. Feel the weight of your feet on the floor, the tips of your fingers on your chair, and so forth. Keep your upper body straight, but not rigid, to allow easier breathing. When you feel ready, let your eyes gently close. Stay in tune with your natural breathing rhythm. If you feel yourself fighting to hold your breath longer, shorten your breaths to a more comfortable rhythm. It is natural for your mind to wander during this practice. When it does, simply return your attention to your breath. ", description: "breath ok just do it", time: "10 min", position: "Sitting", materials: "None")], [Meditation(title: "M 1", type: .mantra, instructions: "do it", description: "breath ok just do it", time: "10 min", position: "Sitting", materials: "None"), Meditation(title: "M 2", type: .mantra, instructions: "do it", description: "breath ok just do it", time: "10 min", position: "Sitting", materials: "None"), Meditation(title: "M 3", type: .mantra, instructions: "do it", description: "breath ok just do it", time: "10 min", position: "Sitting", materials: "None"), Meditation(title: "M 4", type: .mantra, instructions: "do it", description: "breath ok just do it", time: "10 min", position: "Sitting", materials: "None")], [Meditation(title: "Body Scan", type: .body, instructions: "When doing a body scan, lying down on your back is beneficial because it will allow you to relax more deeply. Of course, if you would prefer to practice it while sitting, that is perfectly fine. \n\nWhen you are ready, begin to become aware of your breath. Slow your breath rate to a comfortable pace and focus on taking deep breaths from your diaphragm. If you notice your chest moving significantly while breathing, this is a sign to take breaths stemming from your stomach instead of your chest. \n\nBegin the scan in your feet. Direct your awareness down towards your feet. Notice how they feel on the carpet or if any other sensations are present. Your mind may begin to wander, and when it does, simply bring it back to the area on which you are focusing. \n\nSlowly continue these same principles through the rest of your body, all the way to the top of your head. If you feel tension in any areas, breath through it and allow yourself to relax.", description: "breath ok just do it", time: "15 min", position: "Supine", materials: "None"), Meditation(title: "N 2", type: .body, instructions: "do it", description: "breath ok just do it", time: "10 min", position: "Sitting", materials: "None"), Meditation(title: "N 3", type: .body, instructions: "do it", description: "breath ok just do it", time: "10 min", position: "Sitting", materials: "None"), Meditation(title: "N 4", type: .body, instructions: "do it", description: "breath ok just do it", time: "10 min", position: "Sitting", materials: "None")]]
    
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
