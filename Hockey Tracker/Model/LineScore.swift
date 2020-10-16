//
//  LineScore.swift
//  Hockey Tracker
//
//  Created by Terry Dengis on 9/19/20.
//
import Foundation

struct Linescore: Codable {
    let currentPeriod: Int
    let currentPeriodOrdinal : String?
    let currentPeriodTimeRemaining: String?
    let periods: [Period]
    let shootoutInfo: Shootout
    let teams: Teams
    let powerPlayStrength: String
    let hasShootout: Bool
    let intermissionInfo: IntermissionInfo?
    let powerPlayInfo: PowerPlayInfo?
    
    struct Period: Codable, Identifiable {
        var id: Int
        let periodType: String
        let startTime: String?
        let endTime: String?
        let ordinalNum: String
        let home: Team
        let away: Team
        
        enum CodingKeys: String, CodingKey {
            case id = "num"
            case periodType, startTime, endTime, ordinalNum, home, away
        }
        
        struct Team: Codable, Hashable {
            let goals: Int
            let shotsOnGoal: Int
            let rinkSide: String?
        }
    }
    
    struct Shootout: Codable {
        let away: ShootoutInfo
        let home: ShootoutInfo
        
        struct ShootoutInfo: Codable {
            let scores: Int
            let attempts: Int
        }
    }
    
    struct Teams: Codable {
        let home: Team
        let away: Team
        
        struct Team: Codable {
            let team: TeamID
            let goals: Int
            let shotsOnGoal: Int
            let goaliePulled: Bool
            let numSkaters: Int
            let powerPlay: Bool
            
            struct TeamID: Codable {
                let id: Int
                let name: String
                let link: String
            }
        }
    }
    
    struct IntermissionInfo: Codable {
        let intermissionTimeRemaining: Int
        let intermissionTimeElapsed: Int
        let inIntermission: Bool
    }
    
    struct PowerPlayInfo: Codable {
        let situationTimeRemaining: Int
        let situationTimeElapsed: Int
        let inSituation: Bool
    }
}
