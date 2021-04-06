//
//  Game.swift
//  NBAPlayersApp
//
//  Created by Denizcan on 26.12.2020.
//

import Foundation

struct GamesResponse: Decodable {
    let data: [Game]
}

struct Game: Decodable {
    
    let status: String
    let season: Int
    let period: Int
    let postseason: Bool
    let visitor_team_score: Int
    let home_team_score: Int
    let home_team: Team
    let date: String
    let visitor_team: Team
    var name: String {
        home_team.fullName+" - " + visitor_team.fullName
    }
    var scoreHome: String{
        String(home_team_score)
    }
    var scoreVisitor: String {
        String(visitor_team_score)
    }
    
}
