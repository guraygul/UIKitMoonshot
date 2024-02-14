//
//  AstronautDetailViewController.swift
//  UIKitMoonshot
//
//  Created by Güray Gül on 14.02.2024.
//

import UIKit

class AstronautDetailViewController: UIViewController {

    @IBOutlet weak var astronautTableView: UITableView!
    @IBOutlet weak var astronautHeaderView: AstronautDetailImageView!
    
    var astronaut: Astronaut?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        astronautTableView.delegate = self
        astronautTableView.dataSource = self
        
        if let astronaut = astronaut {
            astronautHeaderView.astronautDetailImageView.image = UIImage(named: astronaut.id)
        }
        
    }

}

extension AstronautDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "astronaut", for: indexPath) as! AstronautDetailTableViewCell
        
        if let astronaut = astronaut {
            cell.astroanutDescription.text = astronaut.description
        }
        
        return cell
    }
    
}
