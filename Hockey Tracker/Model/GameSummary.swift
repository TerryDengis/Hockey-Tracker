//
//  GameSummary.swift
//  NHL Game Tracker
//
//  Created by Terry Dengis on 12/29/18.
//  Copyright © 2018 Terry Dengis. All rights reserved.
//

import Foundation

struct GameSummary: Codable {
    let copyright: String
    let gamePk: Int
    let link: String
    let metaData: MetaData
    let gameData: GameData
    let liveData: LiveData
    
    // MARK: - MetaData
    struct MetaData: Codable {
        let wait: Int
        let timeStamp: String
    }
    
    // MARK: - GameData
    struct GameData: Codable {
        let game: GameInfo
        let datetime: DateTime
        let status: Status
        let teams: Teams
//        let players: [Player]
//        let venue: GameDataVenue
        
        struct GameInfo: Codable {
            let pk: Int
            let season: String
            let type: GameType
        }
        
        struct DateTime: Codable {
            let dateTime: String
            let endDateTime: String?
        }
        
        struct Status: Codable {
            let abstractGameState: String
            //let codedGameState: String
            let detailedState: String
            let statusCode: StatusCode
        }
        
        struct Teams: Codable {
            let away, home: Team
            
            struct Team: Codable {
                let id: Int
                let link: String
                let abbreviation: String
                let triCode: TeamCode?
                let teamName: String
                let name: String
            }
        }
    }
    
    // MARK: - LiveData
    struct LiveData: Codable {
        let plays: Plays
        let linescore: LineScore?
        
        struct Plays: Codable {
            let allPlays: [Play]
            let scoringPlays, penaltyPlays: [Int]
            let playsByPeriod: [PlaysByPeriod]
            let currentPlay: CurrentPlay?
            
            struct CurrentPlay: Codable {
                let about: About
                
                struct About: Codable {
                    
                    let period: Int
                    let periodType: String
                    let ordinalNum: String
                    let periodTimeRemaining: String
                }
            }
            
            struct PlaysByPeriod: Codable {
                let startIndex: Int
                let plays: [Int]
                let endIndex: Int
            }
            
            struct Play: Codable {
                let result: PlayResult
                let about: About
                let coordinates: Coordinates
                let team: CurrentTeamClass?
                
                struct Coordinates: Codable {
                    let x, y: Int?
                }
                
                struct PlayResult: Codable {
                    let eventCode: String
                    let eventTypeId: EventType
                    let description: String

                }
                struct About: Codable {
                    let eventIdx: Int
                    let period: Int
                    let periodType: String
                    let ordinalNum: String
                    let periodTime: String
                    let periodTimeRemaining: String
                    
                    let goals: Goals

                }

                struct Goals: Codable {
                    let away, home: Int
                }
                
                struct CurrentTeamClass: Codable {
                    let id: Int
                    let name: String
                    let link: String
                    let triCode: TeamCode?
                }
                
                
            }

        }
    }
}
extension GameSummary.LiveData.Plays.Play: Identifiable {
    var id: String { UUID().uuidString}
}



