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
    
    var mission: Mission?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let mission = mission {
            headerView.missionDateLabel.text = mission.formattedLaunchDate
            headerView.missionHeaderImageView.image = UIImage(named: mission.image)
            
        }
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    

}

extension MoonshotDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MissionDetailTextCell", for: indexPath) as! MissionHighlightTableViewCell
        
        cell.missionDetailDescription.text = mission?.description
        return cell
    }
}
