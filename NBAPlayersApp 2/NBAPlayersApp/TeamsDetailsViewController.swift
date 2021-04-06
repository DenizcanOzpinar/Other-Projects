//
//  TeamsDetailsViewController.swift
//  NBAPlayersApp
//
//  Created by Denizcan on 26.12.2020.
//

import UIKit

class TeamsDetailsViewController: UIViewController {

    
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var abbLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var conferenceLabel: UILabel!
    
    @IBOutlet weak var divisionLabel: UILabel!
    
    
    var team: Team?
    override func viewDidLoad() {
        super.viewDidLoad()
        teamNameLabel.text = team?.fullName
        abbLabel.text = team?.abbreviation
        cityLabel.text = team?.city
        conferenceLabel.text = team?.conference
        divisionLabel.text = team?.division
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
