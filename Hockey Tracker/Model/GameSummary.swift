//
//  GameSummary.swift
//  NHL Game Tracker
//
//  Created by Terry Dengis on 12/29/18.
//  Copyright © 2018 Terry Dengis. All rights reserved.
//

import Foundation

// MARK: - GameSummary
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
        let players: [String: Player]
        let venue: Venue
        
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
            let codedGameState: String
            let detailedState: String
            let statusCode: StatusCode
            let startTimeTBD: Bool
        }
        
        struct Teams: Codable {
            let away, home: Team
            
            struct Team: Codable {
                let id: Int
                let name: String
                let link: String
                let venue: Venue
                let abbreviation: String
                let triCode: TeamCode?
                let teamName: String
                let locationName: String
                let firstYearOfPlay: String
                let division: Division
                let conference: Conference
                let franchise: Franchise
                let shortName: String
                let officialSiteUrl: String
                let franchiseId: Int
                let active: Bool
                
                struct Venue: Codable {
                    let id: Int?
                    let name: String
                    let link: String
                    let city: String
                    let timeZone: TimeZone
                }

                struct TimeZone: Codable {
                    let id: String
                    let offset: Int
                    let tz: String
                }
                
                struct Division: Codable {
                    let id: Int
                    let name: String
                    let nameShort: String?
                    let link: String
                    let abbreviation: String?
                }
                
                struct Conference: Codable {
                    let id: Int
                    let name: String
                    let link: String
                }
                
                struct Franchise: Codable {
                    let franchiseId: Int
                    let teamName: String
                    let link: String
                }
            }
        }
        
        struct Player: Codable {
            let id: Int
            let fullName, link, firstName, lastName: String
            let primaryNumber, birthDate, birthCity, birthCountry: String?
            let nationality, height: String
            let weight: Int
            let active, rookie: Bool
            let shootsCatches: String?
            let rosterStatus: String
            let primaryPosition: PrimaryPosition
            let currentAge: Int?
            let birthStateProvince: String?
            let alternateCaptain, captain: Bool?
            let currentTeam: CurrentTeam?
            
            struct PrimaryPosition: Codable {
                let code: String
                let name: String
                let type: PositionTypeCode
                let abbreviation: PositionCode
            }
            
            struct CurrentTeam: Codable {
                let id: Int
                let name, link, triCode: String
            }
        }
        
        struct Venue: Codable {
            let id: Int?
            let name: String
            let link: String
        }
    }
    
    // MARK: - LiveData
    struct LiveData: Codable {
        let plays: Plays
        // MARK: - Defined in Linescore.swift
        let linescore: Linescore?
        let boxscore: Boxscore?
        let decisions: Decisions?
        
        struct Boxscore: Codable {
            let teams: Teams
            let officials: [Officials]
            
            struct Teams: Codable {
                let away: TeamDetail
                let home: TeamDetail
                
                struct TeamDetail: Codable {
                    let team: Team
                    let teamStats: TeamStats
                    let players: [String: Player]
                    let goalies: [Int]
                    let skaters: [Int]
                    let onIce: [Int]
                    let onIcePlus: [OnIcePlus]
                    let scratches: [Int]
                    //let penaltyBox: ?????
                    let coaches: [Coaches]
                    
                    struct Team: Codable {
                        let id: Int
                        let name: String
                        let link: String
                        let abbreviation: String
                        let triCode: TeamCode
                    }
                    
                    struct TeamStats: Codable {
                        let teamSkaterStats: TeamSkaterStats
                        
                        struct TeamSkaterStats: Codable {
                            let goals, pim, shots: Int
                            let powerPlayPercentage: String
                            let powerPlayGoals, powerPlayOpportunities: Int
                            let faceOffWinPercentage: String?
                            let blocked, takeaways, giveaways, hits: Int?
                        }
                    }
                    
                    struct Player: Codable {
                        let person: Person
                        let jerseyNumber: String?
                        let position: Position
                        let stats: Stats?
                        
                        struct Person: Codable {
                            let id: Int
                            let fullName: String
                            let link: String
                            let shootsCatches: String?
                            let rosterStatus: String
                        }
                        
                        struct Position: Codable {
                            let code: PositionCode
                            let name: String
                            let type: PositionTypeCode
                            let abbreviation: String
                        }
                        
                        struct Stats: Codable {
                            let stats: SkaterStats?
                            
                            struct SkaterStats: Codable {
                                let timeOnIce: String
                                let assists, goals, shots, hits: Int
                                let powerPlayGoals, powerPlayAssists, penaltyMinutes, faceOffWins: Int
                                let faceoffTaken, takeaways, giveaways, shortHandedGoals: Int
                                let shortHandedAssists, blocked, plusMinus: Int
                                let evenTimeOnIce, powerPlayTimeOnIce, shortHandedTimeOnIce: String
                                let faceOffPct: Double?
                            }
                        }
                    }
                    
                    struct OnIcePlus: Codable {
                        let playerId, shiftDuration, stamina: Int
                    }
                    
                    struct Coaches: Codable {
                        let person: Person
                        let position: Position
                    
                        struct Person: Codable {
                            let fullName, link: String
                        }
                        
                        struct Position: Codable {
                            let code, name: String
                            let type: String
                            let abbreviation: String
                        }
                    }
                }
            }
            
            struct Officials: Codable {
                let official: Official
                let officialType: String
                
                struct Official: Codable {
                    let id: Int?
                    let fullName: String
                    let link: String
                }
            }
        }
        
        struct Decisions: Codable {
            let winner: Player?
            let loser: Player?
            let firstStar: Player?
            let secondStar: Player?
            let thirdStar: Player?
            
            struct Player: Codable {
                let id: Int
                let fullName: String
                let link: String
            }
        }
        
        struct Plays: Codable {
            let allPlays: [Play]
            let scoringPlays: [Int]
            let penaltyPlays: [Int]
            let playsByPeriod: [PlaysByPeriod]
            let currentPlay: CurrentPlay?
            
            struct Play: Codable {
                let players:[PlayersInvolved]?
                let result: PlayResult
                let about: About
                let coordinates: Coordinates
                let team: Team?
                
                struct PlayersInvolved: Codable {
                    let player: Player
                    let playerType: String
                    let seasonTotal: Int?
                    
                    struct Player: Codable, Identifiable {
                        var id: Int
                        let fullName: String
                        let link: String
                    }
                }
                
                struct PlayResult: Codable {
                    let event: String
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
                    let dateTime: String
                    let goals: Goals
                    
                    struct Goals: Codable {
                        let away, home: Int
                    }
                }
                
                struct Coordinates: Codable {
                    let x, y: Int?
                }

                struct Team: Codable {
                    let id: Int
                    let name: String
                    let link: String
                    let triCode: TeamCode?
                }
            }
            
            struct PlaysByPeriod: Codable {
                let startIndex: Int
                let plays: [Int]
                let endIndex: Int
            }
            
            struct CurrentPlay: Codable {
                let result: Result
                let about: About
                //let coordinates: ?????
                
                struct Result: Codable {
                    let event: String
                    let eventCode: String
                    let eventTypeId: EventType
                    let description: String
                }
                
                struct About: Codable {
                    let period: Int
                    let periodType: String
                    let ordinalNum: String
                    let periodTimeRemaining: String
                }
            }
        }
    }
}

extension GameSummary.LiveData.Plays.Play: Identifiable {
    var id: String { UUID().uuidString}
}
