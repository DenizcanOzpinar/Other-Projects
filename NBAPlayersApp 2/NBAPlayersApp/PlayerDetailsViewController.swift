//
//  PlayerDetailsViewController.swift
//  NBAPlayersApp
//
//  Created by Aleksandr Anosov on 24.12.2020.
//

import UIKit

class PlayerDetailsViewController: UIViewController {

    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var teamButton: UIButton!

    var player: Player?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = player?.name
        navigationController?.navigationBar.prefersLargeTitles = true
        positionLabel.text = player?.position
        heightLabel.text = player?.height
        teamButton.setTitle(player?.team.fullName, for: .normal)
    }
    
    @IBAction func onTeamButtonClick(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let teamDetailsViewController = storyboard.instantiateViewController(identifier: "TeamDetails") as! TeamDetailsViewController

        teamDetailsViewController.team = player?.team

        navigationController?.pushViewController(teamDetailsViewController, animated: true)
    }

}
