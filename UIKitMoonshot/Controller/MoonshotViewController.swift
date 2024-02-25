//
//  MoonshotViewController.swift
//  UIKitMoonshot
//
//  Created by Güray Gül on 1.02.2024.
//

import UIKit

class MoonshotViewController: UIViewController {
    
    @IBOutlet weak var moonshotCollectionView: UICollectionView!
    
    private var identifier = "moonshotCell"
    private let sectionInsets = UIEdgeInsets(top: 20.0, left: 10.0, bottom: 20.0, right: 10.0)
    
    private var missions = [Mission]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        moonshotCollectionView.dataSource = self
        moonshotCollectionView.delegate = self
        
        missions = Bundle.main.decode(from: "missions.json")
    }
    
}

extension MoonshotViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return missions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let moonshotCell = moonshotCollectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! MoonshotCollectionViewCell
        
        let mission = missions[indexPath.row]
        
        moonshotCell.layer.cornerRadius = 10 // Set your desired corner radius value
        
        // If you want to add a border, you can also add it here
        moonshotCell.layer.borderWidth = 1.0
        moonshotCell.layer.borderColor = UIColor.gray.cgColor
        
        moonshotCell.missionName.text = "Apollo \(mission.id)"
        moonshotCell.missionDate.text = mission.formattedLaunchDate
        moonshotCell.missionImage.image = UIImage(named: mission.image)
        
        return moonshotCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = moonshotCollectionView.indexPathsForSelectedItems?.first {
                let destinationController = segue.destination as! MoonshotDetailViewController
                destinationController.mission = self.missions[indexPath.row]
            }
        }
    }
    
    
}

// MARK: - Configuring collection view cells size

extension MoonshotViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemsPerRow: CGFloat = 2
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem * 1.25)
    }
    
    func collectionView(
        _ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return sectionInsets
        }
    
    func collectionView(
        _ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return sectionInsets.left
        }
}
