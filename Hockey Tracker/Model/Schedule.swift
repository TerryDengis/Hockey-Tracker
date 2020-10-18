//
//  Schedule.swift
//  NHL Game Tracker
//
//  Created by Terry Dengis on 1/1/19.
//  Copyright © 2019 Terry Dengis. All rights reserved.
//

import Foundation

// MARK: - Schedule
struct Schedule: Codable {
    let copyright: String
    let totalItems: Int
    let totalEvents: Int
    let totalGames: Int
    let totalMatches: Int
    let wait: Int
    let dates: [Games]
    
    // MARK: - Games
    struct Games: Codable {
        let date: String
        let totalItems: Int
        let totalEvents: Int
        let totalGames: Int
        let totalMatches: Int
        let games: [GameDetail]
        //let events: [????]
        //matches: [????]
        
        struct GameDetail: Codable {
            let gamePk: Int
            let link: String
            let gameType: GameType
            let season: String
            let gameDate: String
            let status: Status
            let teams: Teams
            // MARK: - Linescore defined in Linescore.swift
            let linescore: Linescore
            let venue: Venue
            let content: Content
            
            struct Status: Codable {
                let abstractGameState: String
                let codedGameState: String
                let detailedState: String
                let statusCode: StatusCode
                let startTimeTBD: Bool
            }
            
            struct Teams: Codable {
                let away: TeamInfo
                let home: TeamInfo
            }
            
            struct TeamInfo: Codable {
                let leagueRecord: LeagueRecord
                let score: Int
                let team: TeamID
            }

            struct LeagueRecord: Codable {
                let wins: Int
                let losses: Int
                let ot: Int
                let type: String
            }
            
            struct TeamID: Codable {
                let id: Int
                let name: String
                let link: String
            }
            
            struct Venue: Codable {
                let id: Int?
                let name: String
                let link: String
            }
            
            struct Content: Codable {
                let link: String
            }
        }
    }
}






