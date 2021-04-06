//
//  GameDetailsViewController.swift
//  NBAPlayersApp
//
//  Created by Denizcan on 26.12.2020.
//

import UIKit

class GameDetailsViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var homeScoreLabel: UILabel!
    @IBOutlet weak var homeLabel: UILabel!
    @IBOutlet weak var visitorLabel: UILabel!
    
    @IBOutlet weak var visitorScoreLable: UILabel!
    
    @IBOutlet weak var homeTeamButton: UIButton!
    
    @IBOutlet weak var visitorTeamButton: UIButton!
    
    
    var game: Game?
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = game?.name
        statusLabel.text = game?.status
        dateLabel.text = game?.date
        homeLabel.text = game?.home_team.fullName
        homeScoreLabel.text = game?.scoreHome
        visitorLabel.text = game?.visitor_team.fullName
        visitorScoreLable.text = game?.scoreVisitor
        

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
    @IBAction func inVisitorButtonClick(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let teamsDetailsViewController = storyboard.instantiateViewController(identifier: "TeamsDetails") as! TeamsDetailsViewController

        teamsDetailsViewController.team = game?.visitor_team

        navigationController?.pushViewController(teamsDetailsViewController, animated: true)
    }
    
    @IBAction func onHomeButtonClick(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let teamsDetailsViewController = storyboard.instantiateViewController(identifier: "TeamsDetails") as! TeamsDetailsViewController

        teamsDetailsViewController.team = game?.home_team

        navigationController?.pushViewController(teamsDetailsViewController, animated: true)
    }
    

}
