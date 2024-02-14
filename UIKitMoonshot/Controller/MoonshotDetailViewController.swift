//
//  MoonshotDetailViewController.swift
//  UIKitMoonshot
//
//  Created by Güray Gül on 11.02.2024.
//

import UIKit

class MoonshotDetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerView: MoonshotDetailHeaderView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    var mission: Mission?
    var astronauts = [String: Astronaut]()
    
    private let sectionInsets = UIEdgeInsets(top: 20.0, left: 10.0, bottom: 20.0, right: 10.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        if let mission = mission {
            headerView.missionDateLabel.text = mission.formattedLaunchDate
            headerView.missionHeaderImageView.image = UIImage(named: mission.image)
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        astronauts = Bundle.main.decode(from: "astronauts.json")
    }
    
}

extension MoonshotDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mission", for: indexPath) as! MissionHighlightTableViewCell
        
        cell.missionDetailDescription.text = mission?.description
        return cell
    }
}

extension MoonshotDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let mission = mission {
            mission.crew.count
        } else {
            1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "crew", for: indexPath) as! MissionCrewCollectionViewCell
        
        cell.layer.cornerRadius = 30
        cell.layer.borderWidth = 1.0
        cell.layer.borderColor = UIColor.gray.cgColor
        
        if let mission = mission {
            let crewMember = mission.crew[indexPath.item]
            if let astronaut = astronauts[crewMember.name] {
                cell.crewName.text = astronaut.name
                cell.crewImage.image = UIImage(named: astronaut.id)
                cell.crewRole.text = crewMember.role
            }
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showAstronautDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAstronautDetail" {
            if let indexPath = collectionView.indexPathsForSelectedItems?.first {
                let destinationController = segue.destination as! AstronautDetailViewController
                // destinationController.astronaut = self.astronauts[indexPath.row]
                let astronautId = mission?.crew[indexPath.item].name
                
                if let astronaut = astronauts[astronautId!] {
                    destinationController.astronaut = astronaut
                }
            }
        }
    }
    
}
