//
//  Schedule.swift
//  NHL Game Tracker
//
//  Created by Terry Dengis on 1/1/19.
//  Copyright © 2019 Terry Dengis. All rights reserved.
//

import Foundation

struct Schedule: Codable {
    //let copyright: String
    let totalItems: Int
    let totalEvents: Int
    let totalGames: Int
    let totalMatches: Int
    let wait: Int
    let dates: [Games]
    
    struct Games: Codable {
        let date: String
        let totalItems, totalEvents, totalGames, totalMatches: Int
        let games: [GameDetail]
        
        struct GameDetail: Codable {
            let gamePk: Int
            let link: String
            let gameType: GameType
            let season: String
            let gameDate: String
            let status: Status
            let teams: Teams
            let linescore: LineScore
            
            struct Teams: Codable {
                let away: TeamInfo
                let home: TeamInfo
            }
            struct TeamInfo: Codable {
                let score: Int
                let team: TeamID
            }
            struct Status: Codable {
                
                let abstractGameState: String
                let codedGameState: String
                let detailedState: String
                let statusCode: StatusCode
                let startTimeTBD: Bool
            }
            
            struct TeamID: Codable {
                let id: Int
                let name: String
                let link: String
            }
        }
    }
}






