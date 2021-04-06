//
//  TeamDetailsViewController.swift
//  NBAPlayersApp
//
//  Created by Aleksandr Anosov on 25.12.2020.
//

import UIKit

class TeamDetailsViewController: UIViewController {

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var conferenceLabel: UILabel!

    @IBOutlet weak var nameLabel: UILabel!
    var team: Team?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = team?.name
        navigationController?.navigationBar.prefersLargeTitles = true
        cityLabel.text = team?.city
        conferenceLabel.text = team?.conference
    }

}
