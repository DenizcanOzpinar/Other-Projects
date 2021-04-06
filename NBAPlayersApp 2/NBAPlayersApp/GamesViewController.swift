//
//  GamesViewController.swift
//  NBAPlayersApp
//
//  Created by Denizcan on 26.12.2020.
//

import UIKit

class GamesViewController: UIViewController ,UITableViewDataSource, UITableViewDelegate{

 
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var gameErrorLabel: UILabel!
    @IBOutlet weak var gameActivityIndicatorView: UIActivityIndicatorView!
    
    @IBOutlet weak var gameReloadButton: UIButton!
    

    var games: [Game] = []
    let apiClient: ApiClient = ApiClientImpl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Games"
        navigationController?.navigationBar.prefersLargeTitles = true
        reloadGames()
    }
    
    @IBAction func gameReloadButton(_ sender: Any) {
        reloadGames()
    }

    private func reloadGames() {
        showLoading()
        apiClient.getGames(completion: { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let games):
                    self.games = games
                    self.showData()
                case .failure:
                    self.games = []
                    self.showError()
                }
                self.tableView.reloadData()
            }
        })
    }

    private func showLoading() {
        gameActivityIndicatorView.startAnimating()
        gameReloadButton.isHidden = true
        gameErrorLabel.isHidden = true
    }

    private func showData() {
        gameActivityIndicatorView.stopAnimating()
        gameActivityIndicatorView.isHidden = true
        gameReloadButton.isHidden = true
        gameErrorLabel.isHidden = true
    }

    private func showError() {
        gameActivityIndicatorView.stopAnimating()
        gameReloadButton.isHidden = false
        gameErrorLabel.isHidden = false
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GameCell", for: indexPath)

        let game = games[indexPath.row]
        cell.textLabel?.text = game.name
        cell.detailTextLabel?.text = game.status
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let gameDetailsViewController = storyboard.instantiateViewController(identifier: "GameDetails") as! GameDetailsViewController

        let game = games[indexPath.row]
        gameDetailsViewController.game = game

        navigationController?.pushViewController(gameDetailsViewController, animated: true)
        
        
    }

}
