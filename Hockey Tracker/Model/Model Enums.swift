//
//  Enums.swift
//  Hockey Tracker
//
//  Created by Terry Dengis on 9/19/20.
//

import Foundation

enum GameType: String, Codable {
    case regularSeason = "R"
    case preseason = "PR"
    case playoff = "P"
}

enum TeamCode: String, Codable {
    case Anaheim = "ANA" //    Anaheim (Mighty) Ducks
    case Arizona = "ARI" //     Arizona Coyotes
    case Boston = "BOS"//    Boston Bruins
    case Buffalo = "BUF" //     Buffalo Sabres
    case Calgary = "CGY" //     Calgary Flames
    case Carolina = "CAR" //     Carolina Hurricanes
    case Chicago = "CHI" //     Chicago Blackhawks
    case Colorado = "COL" //    Colorado Avalanche
    case Columbus = "CBJ" //     Columbus Blue Jackets
    case Dallas = "DAL" //     Dallas Stars
    case Detroit = "DET" //    Detroit Red Wings
    case Edmonton = "EDM" //     Edmonton Oilers
    case Florida = "FLA" //    Florida Panthers
    case LosAngeles = "LAK" //    Los Angeles Kings
    case Minnesota = "MIN" //    Minnesota Wild
    case Montreal = "MTL" //    Montreal Canadiens
    case Nashville = "NSH" //    Nashville Predators
    case Islanders = "NYI" //    New York Islanders
    case NewJersey = "NJD" //    New Jersey Devils
    case Rangers = "NYR" //    New York Rangers
    case Ottawa = "OTT" //    Ottawa Senators
    case Philadelphia = "PHI" //    Philadelphia Flyers
    case Pittsburgh = "PIT" //    Pittsburgh Penguins
    case SanJose = "SJS" //    San Jose Sharks
    case Seattle = "SEA" //    Seattle Kraken
    case StLouis = "STL" //    St. Louis Blues
    case TampaBay = "TBL" //    Tampa Bay Lightning
    case Toronto = "TOR" //    Toronto Maple Leafs
    case Vancouver = "VAN" //    Vancouver Canucks
    case Vegas = "VGK" // Vegas Golden Knights
    case Washington = "WSH" //    Washington Capitals
    case Winnipeg = "WPG" //    Winnipeg Jets
    
    // Old Teams
    case AtlantaFlames = "AFM" //    Atlanta Flames
    case Atlanta = "ATL" //     Atlanta Thrashers
    case California = "CSE" //    California Seals
    case Cleveland = "CBN" //    Cleveland Barons
    case ColRock = "CLR" //   Colorado Rockies
    case Hartford = "HFD" //    Hartford Whalers
    case KansasCity = "KCS" //    Kansas City Scouts
    case MinnesotaNS = "MNS" //    Minnesota North Stars
    case Oakland = "OAK" //    Oakland Seals
    case Phoenix = "PHX" //    Phoenix Coyotes
    case Quebec = "QUE" //    Quebec Nordiques
    case Winnipeg92 = "WIN" //    Winnipeg Jets (1979-92)
}

enum EventType: String, Codable {
    case blockedShot = "BLOCKED_SHOT"
    case faceoff = "FACEOFF"
    case gameEnd = "GAME_END"
    case gameScheduled = "GAME_SCHEDULED"
    case giveaway = "GIVEAWAY"
    case goal = "GOAL"
    case hit = "HIT"
    case missedShot = "MISSED_SHOT"
    case penalty = "PENALTY"
    case periodEnd = "PERIOD_END"
    case periodOfficial = "PERIOD_OFFICIAL"
    case periodReady = "PERIOD_READY"
    case periodStart = "PERIOD_START"
    case shot = "SHOT"
    case stop = "STOP"
    case takeaway = "TAKEAWAY"
    case challenge = "CHALLENGE"
    case shootoutComplete = "SHOOTOUT_COMPLETE"
    case gameOfficial = "GAME_OFFICIAL"
}

enum StatusCode: String, Codable {
    case scheduled = "1"
    case pregame = "2"
    case inProgress = "3"
    case inProgressCritical = "4"
    case gameOver = "5"
    case unofficial = "6"
    case final = "7"
    case preview = "8"
    case postponed = "9"
}

enum PositionCode: String, Codable {
    case center = "C"
    case defenseman = "D"
    case goalie = "G"
    case leftWing = "LW"
    case left = "L"
    case rightWing = "RW"
    case right = "R"
    case notApplicable = "N/A"
}

enum PositionTypeCode: String, Codable {
    case defenseman = "Defenseman"
    case forward = "Forward"
    case goalie = "Goalie"
    case unknown = "Unknown"
}
