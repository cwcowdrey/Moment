//
//  MeditationsViewController.swift
//  Moment
//
//  Created by Christopher Cowdrey on 5/20/21.
//

import Foundation
import UIKit

class MeditationsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var meditations = [[Meditation(title: "Shamatha", category: .breathing, instructions: "Shamatha breathing is a technique based on the idea of restoring your breath to its natural, calm state. It’s very common and popular among meditators, and has been described as focusing on keeping your breath “not too tight, not too loose”. It essentially serves to reset your breath \n\nBegin by gaining awareness of your body. Feel the weight of your feet on the floor, the tips of your fingers on your chair, and so forth. Keep your upper body straight, but not rigid, to allow easier breathing. When you feel ready, let your eyes gently close. Stay in tune with your natural breathing rhythm. If you feel yourself fighting to hold your breath longer, shorten your breaths to a more comfortable rhythm. It is natural for your mind to wander during this practice. When it does, simply return your attention to your breath.", time: "10 min", position: "Sitting", materials: "None", type: .shamatha), Meditation(title: "Kundalini", category: .breathing, instructions: "This practice emphasizes the importance of relaxed breathing, rather than stressful, chaotic breaths. It is best done lying on your back, but sitting is acceptable if that is more comfortable. \n\nTo begin, place one hand on top of your chest and the other on the middle of your stomach. Carefully and deliberately breath in through your nose and notice that your stomach is elevating the hand on top of it. The goal of this is keep the hand on your chest as still as possible, as chest breathing indicates high exertion or stress. Try to take full, deep breaths that fill your lungs, rather than shallow breaths that only reach your chest cavity. By doing this, you are strengthening your diaphragmatic breathing, which leads to more feelings of calm. ", time: "10 min", position: "Supine", materials: "None", type: .kundalini), Meditation(title: "4-7-8", category: .breathing, instructions: "4-7-8 is a breathing pattern exercise proven to lower anxiety and can help calm emotions stemming from panic. \n\nBegin the practice by resting the tip of your tongue against the roof of your mouth, right next to your front teeth. It is important to keep your tongue in this same position for the duration of this meditation. It can be challenging at first, but try to keep your tongue from moving while you breath in and out.  \n\nFirst, take a few normal breaths and let your heartrate settle. Next, keeping your mouth closed, inhale through your nose and slowly count to four. Then, hold your breath for seven seconds. Finally, exhale for eight seconds. It can also be helpful to make a whooshing sound as you exhale.", time: "10 min", position: "Sitting", materials: "None", type: .four78), Meditation(title: "Box Breathing", category: .breathing, instructions: "Box breathing is a very common and effective technique that you can do anywhere, whether it be sitting on the bus or at work. It is best to be in a sitting position with your back nicely supported and your feet firmly on the ground.  \n\nBegin by closing your eyes. Breathe in through your nose while counting to four at a relaxed pace. Take time to notice the air entering your body. Hold your breath inside while again counting slowly to four.  Finally, you may slowly exhale for 4 seconds. Repeat the previous steps to finish your “box” pattern. For best results, repeat the process for several minutes or until you begin to feel calm again. \n\nIf you find the process difficult at first, or are having a hard time holding your breath, feel free to lower your cycles to intervals of 3 seconds, or whichever time feels doable to you.", time: "10 min", position: "Sitting", materials: "None", type: .box)], [Meditation(title: "Soham", category: .mantra, instructions: "Soham is a Hindu mantra meaning \u{22}I am She/He/That\u{22}. It is a way of describing yourself as part of the universe or bigger picture, and understanding you are connected to it all. \n\nThis meditation is not complicated. Begin by relaxing your breathing and becoming aware of your body. Next, close your eyes and focus on taking deep breaths. Simply repeat the phrase \u{22}soham\u{22} in your mind slowly. \n\nYou might notice your thoughts begin to wander towards other areas, which is normal. When that happens, simply return to your mantra and repeat it to yourself again. Try to feel it deeply and embrace its meaning.", time: "10 min", position: "Sitting", materials: "None", type: .soham), Meditation(title: "Together", category: .mantra, instructions: "This is a short meditation that can be done anywhere; it can be done while commuting to work, during a stressful moment, or anytime it is needed. It also is a great way to finish off any other meditations you might try. Simply repeat the following words to yourself as many times as you would like. \n\n\u{22}Let us be together. Let us be nourished together. Let us be radiating truth, radiating the light of life. Let us grow together. Never shall we denounce anyone. Never entertain negativity. Om, Peace, Peace, Peace\u{22} \n\nThis mantra shows how all people rely on one another. When you are done, keep that same energy of togetherness in your mind as you continue your day.", time: "5 min", position: "Sitting", materials: "None", type: .together)], [Meditation(title: "Body Scan", category: .body, instructions: "When doing a body scan, lying down on your back is beneficial because it will allow you to relax more deeply. Of course, if you would prefer to practice it while sitting, that is perfectly fine. \n\nWhen you are ready, begin to become aware of your breath. Slow your breath rate to a comfortable pace and focus on taking deep breaths from your diaphragm. If you notice your chest moving significantly while breathing, this is a sign to take breaths stemming from your stomach instead of your chest. \n\nBegin the scan in your feet by directing your awareness down towards your feet. Notice how they feel on the carpet or if any other sensations are present. Your mind may begin to wander, and when it does, simply bring it back to the area on which you are focusing. \n\nSlowly continue these same principles through the rest of your body, all the way to the top of your head. If you feel tension in any areas, breath through it and allow yourself to relax.", time: "15 min", position: "Supine", materials: "None", type: .bodyscan), Meditation(title: "Chakras", category: .body, instructions: "Chakras are centers of energy that exist in several locations in our bodies. There are seven main ones, as follows: Crown (top of the head), Third Eye (between the eyes on the forehead), Throat, Heart, Solar Plexus,  Sacral (behind the belly button), and Root (bottom of the tailbone). \n\nFor this practice, you will start at the Crown chakra and work your way down. Imagine a ball of energy radiating at the location of your chakra. Now, breath in to that area, imagining that you are filling it with more and more energy and the area is expanding. \n\nThere is no rush in this process, and when you feel ready, move on to the next chakra. You might feel inclined to spend more time on some chakras than others. That is perfectly fine and feel free to follow that feeling. ", time: "10 min", position: "Sitting", materials: "None", type: .chakras), Meditation(title: "Be Lazy", category: .body, instructions: "For this meditation, you get to focus on being lazy. It’s a chance to let go of all your responsibilities and stressors in life and to just be as lazy as you would like. We put our bodies through quite a lot, and this meditation is designed to give them a chance to rest. \n\nBegin by taking a relaxed position. Sitting is often suggested, but lying down will also do fine. Ask yourself where you are feeling the most tension from the day. Is it in your shoulders? Is your jaw clenched, or your hands in fists? When you identify wherever it may be, breath deeply into that area. Let the tension dissipate. \n\nBring to mind a time when you were truly relaxed. Perhaps a rainy day in bed or bonfire on the beach. Now let that feeling of laziness wash over you. Immerse yourself fully in that moment and forget your current surroundings. \n\nSit with this feeling for several minutes or as long as you’d like. There’s no rush and nowhere to be. When you’re ready, you can get back to the tasks of the day, and keep that special feeling of laziness with you when things might start to become stressful again.", time: "10 min", position: "Sitting", materials: "None", type: .belazy)]]
    
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
            
            let headerText = meditations[indexPath.section][indexPath.row].category.rawValue
            headerView.headerLabel.text = "\(headerText) Meditations"
            return headerView
            
        default:
            return UICollectionReusableView()
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
