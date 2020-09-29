//
//import Foundation
//
//// MARK: - PlayoffOt
//struct GameSummary: Codable {
//    let copyright: String
//    let gamePk: Int
//    let link: String
//    let metaData: MetaData
//    let gameData: GameData
//    let liveData: LiveData
//}
//
//// MARK: - GameData
//struct GameData: Codable {
//    let game: Game
//    let datetime: Datetime
//    let status: Status
//    let teams: GameDataTeams
//    let players: [String: PlayerValue]
//    let venue: GameDataVenue
//}
//
//// MARK: - Datetime
//struct Datetime: Codable {
//    let dateTime, endDateTime: Date
//}
//
//// MARK: - Game
//struct Game: Codable {
//    let pk: Int
//    let season, type: String
//}
//
//// MARK: - PlayerValue
//struct PlayerValue: Codable {
//    let id: Int
//    let fullName, link, firstName, lastName: String
//    let primaryNumber, birthDate: String
//    let currentAge: Int
//    let birthCity: String
//    let birthStateProvince: String?
//    let birthCountry, nationality, height: String
//    let weight: Int
//    let active, alternateCaptain, captain, rookie: Bool
//    let shootsCatches: ShootsCatches
//    let rosterStatus: RosterStatus
//    let currentTeam: CurrentTeam
//    let primaryPosition: Position
//}
//
//// MARK: - CurrentTeam
//struct CurrentTeam: Codable {
//    let id: Int
//    let name: String
//    let link: String
//    let triCode, abbreviation: TriCodeEnum?
//}
//
//// MARK: - Position
//struct Position: Codable {
//    let code: ShootsCatches
//    let name, type: TypeEnum
//    let abbreviation: PrimaryPositionAbbreviation
//}
//
//enum PrimaryPositionAbbreviation: String, Codable {
//    case center = "C"
//    case defense = "D"
//    case goal = "G"
//    case headCoach = "Head Coach"
//    case leftwing = "LW"
//    case na = "N/A"
//    case rightwing = "RW"
//}
//
//enum ShootsCatches: String, Codable {
//    case c = "C"
//    case d = "D"
//    case g = "G"
//    case hc = "HC"
//    case l = "L"
//    case nA = "N/A"
//    case r = "R"
//}
//
//enum TypeEnum: String, Codable {
//    case center = "Center"
//    case defenseman = "Defenseman"
//    case forward = "Forward"
//    case goalie = "Goalie"
//    case headCoach = "Head Coach"
//    case leftWing = "Left Wing"
//    case rightWing = "Right Wing"
//    case unknown = "Unknown"
//}
//
//enum RosterStatus: String, Codable {
//    case n = "N"
//    case y = "Y"
//}
//
//// MARK: - Status
//struct Status: Codable {
//    let abstractGameState, codedGameState, detailedState, statusCode: String
//    let startTimeTBD: Bool
//}
//
//// MARK: - GameDataTeams
//struct GameDataTeams: Codable {
//    let away, home: PurpleAway
//}
//
//// MARK: - PurpleAway
//struct PurpleAway: Codable {
//    let id: Int
//    let name: CurrentTeamName
//    let link: CurrentTeamLink
//    let venue: AwayVenue
//    let abbreviation, triCode: TriCodeEnum
//    let teamName, locationName, firstYearOfPlay: String
//    let division: Division
//    let conference: CurrentTeam
//    let franchise: Franchise
//    let shortName: String
//    let officialSiteURL: String
//    let franchiseID: Int
//    let active: Bool
//    
//    enum CodingKeys: String, CodingKey {
//        case id, name, link, venue, abbreviation, triCode, teamName, locationName, firstYearOfPlay, division, conference, franchise, shortName
//        case officialSiteURL
//        case franchiseID
//        case active
//    }
//}
//
//// MARK: - Division
//struct Division: Codable {
//    let id: Int
//    let name: DivisionName
//    let nameShort: String?
//    let link: DivisionLink
//    let abbreviation: String?
//    let triCode: TriCodeEnum?
//}
//
//enum DivisionLink: String, Codable {
//    case apiV1Divisions17 = "/api/v1/divisions/17"
//    case apiV1Divisions18 = "/api/v1/divisions/18"
//    case apiV1Teams14 = "/api/v1/teams/14"
//    case apiV1Teams29 = "/api/v1/teams/29"
//}
//
//enum DivisionName: String, Codable {
//    case atlantic = "Atlantic"
//    case columbusBlueJackets = "Columbus Blue Jackets"
//    case metropolitan = "Metropolitan"
//    case tampaBayLightning = "Tampa Bay Lightning"
//}
//
//// MARK: - Franchise
//struct Franchise: Codable {
//    let franchiseID: Int
//    let teamName, link: String
//    
//    enum CodingKeys: String, CodingKey {
//        case franchiseID
//        case teamName, link
//    }
//}
//
//// MARK: - AwayVenue
//struct AwayVenue: Codable {
//    let id: Int?
//    let name, link, city: String
//    let timeZone: TimeZone
//}
//
//// MARK: - TimeZone
//struct TimeZone: Codable {
//    let id: String
//    let offset: Int
//    let tz: String
//}
//
//// MARK: - GameDataVenue
//struct GameDataVenue: Codable {
//    let name, link: String
//}
//
//// MARK: - LiveData
//struct LiveData: Codable {
//    let plays: Plays
//    let linescore: Linescore
//    let boxscore: Boxscore
//    let decisions: Decisions
//}
//
//// MARK: - Boxscore
//struct Boxscore: Codable {
//    let teams: BoxscoreTeams
//    let officials: [Official]
//}
//
//// MARK: - Official
//struct Official: Codable {
//    let official: FirstStar
//    let officialType: String
//}
//
//// MARK: - FirstStar
//struct FirstStar: Codable {
//    let id: Int
//    let fullName, link: String
//}
//
//// MARK: - BoxscoreTeams
//struct BoxscoreTeams: Codable {
//    let away: FluffyAway
//    let home: Home
//}
//
//// MARK: - FluffyAway
//struct FluffyAway: Codable {
//    let team: CurrentTeam
//    let teamStats: TeamStats
//    let players: AwayPlayers
//    let goalies, skaters, onIce: [Int]
//    let onIcePlus: [OnIcePlus]
//    let scratches: [Int]
//    let penaltyBox: [JSONAny]
//    let coaches: [Coach]
//}
//
//// MARK: - Coach
//struct Coach: Codable {
//    let person: CoachPerson
//    let position: Position
//}
//
//// MARK: - CoachPerson
//struct CoachPerson: Codable {
//    let fullName, link: String
//}
//
//// MARK: - OnIcePlus
//struct OnIcePlus: Codable {
//    let playerID, shiftDuration, stamina: Int
//    
//    enum CodingKeys: String, CodingKey {
//        case playerID
//        case shiftDuration, stamina
//    }
//}
//
//// MARK: - AwayPlayers
//struct AwayPlayers: Codable {
//    let id8480074: ID8471804Class
//    let id8478906, id8478506: ID8476431Class
//    let id8477416: ID8471804Class
//    let id8476449, id8476431, id8480205: ID8476431Class
//    let id8476850, id8476432: ID8471804Class
//    let id8479369, id8478831: ID8476431Class
//    let id8479400: ID8471804Class
//    let id8476870: ID8476431Class
//    let id8480762, id8471804, id8474679: ID8471804Class
//    let id8476913: ID8476431Class
//    let id8473422: ID8471804Class
//    let id8476914: Id8476
//    let id8474715, id8477505, id8475233: ID8471804Class
//    let id8478007: ID8476431Class
//    let id8474062, id8478567, id8477495, id8478882: ID8471804Class
//    let id8478460, id8480853: ID8471804Class
//    
//    enum CodingKeys: String, CodingKey {
//        case id8480074
//        case id8478906
//        case id8478506
//        case id8477416
//        case id8476449
//        case id8476431
//        case id8480205
//        case id8476850
//        case id8476432
//        case id8479369
//        case id8478831
//        case id8479400
//        case id8476870
//        case id8480762
//        case id8471804
//        case id8474679
//        case id8476913
//        case id8473422
//        case id8476914
//        case id8474715
//        case id8477505
//        case id8475233
//        case id8478007
//        case id8474062
//        case id8478567
//        case id8477495
//        case id8478882
//        case id8478460
//        case id8480853
//    }
//}
//
//// MARK: - ID8471804Class
//struct ID8471804Class: Codable {
//    let person: ID8471804Person
//    let jerseyNumber: String
//    let position: Position
//    let stats: ID8471804Stats
//}
//
//// MARK: - ID8471804Person
//struct ID8471804Person: Codable {
//    let id: Int
//    let fullName, link: String
//    let shootsCatches: ShootsCatches
//    let rosterStatus: RosterStatus
//}
//
//// MARK: - ID8471804Stats
//struct ID8471804Stats: Codable {
//    let skaterStats: SkaterStats
//}
//
//// MARK: - SkaterStats
//struct SkaterStats: Codable {
//    let timeOnIce: String
//    let assists, goals, shots, hits: Int
//    let powerPlayGoals, powerPlayAssists, penaltyMinutes, faceOffWINS: Int
//    let faceoffTaken, takeaways, giveaways, shortHandedGoals: Int
//    let shortHandedAssists, blocked, plusMinus: Int
//    let evenTimeOnIce, powerPlayTimeOnIce, shortHandedTimeOnIce: String
//    let faceOffPct: Double?
//    
//    enum CodingKeys: String, CodingKey {
//        case timeOnIce, assists, goals, shots, hits, powerPlayGoals, powerPlayAssists, penaltyMinutes
//        case faceOffWINS
//        case faceoffTaken, takeaways, giveaways, shortHandedGoals, shortHandedAssists, blocked, plusMinus, evenTimeOnIce, powerPlayTimeOnIce, shortHandedTimeOnIce, faceOffPct
//    }
//}
//
//// MARK: - ID8476431Class
//struct ID8476431Class: Codable {
//    let person: ID8471804Person
//    let jerseyNumber: String
//    let position: Position
//    let stats: StatsClass
//}
//
//// MARK: - StatsClass
//struct StatsClass: Codable {
//}
//
//// MARK: - Id8476
//struct Id8476: Codable {
//    let person: ID8471804Person
//    let jerseyNumber: String
//    let position: Position
//    let stats: ID8476914Stats
//}
//
//// MARK: - ID8476914Stats
//struct ID8476914Stats: Codable {
//    let goalieStats: GoalieStats
//}
//
//// MARK: - GoalieStats
//struct GoalieStats: Codable {
//    let timeOnIce: String
//    let assists, goals, pim, shots: Int
//    let saves, powerPlaySaves, shortHandedSaves, evenSaves: Int
//    let shortHandedShotsAgainst, evenShotsAgainst, powerPlayShotsAgainst: Int
//    let decision: String
//    let savePercentage: Double
//    let powerPlaySavePercentage: Int
//    let shortHandedSavePercentage: Int?
//    let evenStrengthSavePercentage: Double
//}
//
//// MARK: - TeamStats
//struct TeamStats: Codable {
//    let teamSkaterStats: TeamSkaterStats
//}
//
//// MARK: - TeamSkaterStats
//struct TeamSkaterStats: Codable {
//    let goals, pim, shots: Int
//    let powerPlayPercentage: String
//    let powerPlayGoals, powerPlayOpportunities: Int
//    let faceOffWinPercentage: String
//    let blocked, takeaways, giveaways, hits: Int
//}
//
//// MARK: - Home
//struct Home: Codable {
//    let team: Division
//    let teamStats: TeamStats
//    let players: HomePlayers
//    let goalies, skaters, onIce: [Int]
//    let onIcePlus: [OnIcePlus]
//    let scratches: [Int]
//    let penaltyBox: [JSONAny]
//    let coaches: [Coach]
//}
//
//// MARK: - HomePlayers
//struct HomePlayers: Codable {
//    let id8480172: ID8476431Class
//    let id8476826: ID8471804Class
//    let id8470601: ID8476431Class
//    let id8476624, id8474567: ID8471804Class
//    let id8474568: ID8476431Class
//    let id8476453, id8474870, id8476399, id8474031: ID8471804Class
//    let id8478477, id8475167, id8474151, id8474034: ID8471804Class
//    let id8480186: ID8476431Class
//    let id8476292, id8478010: ID8471804Class
//    let id8478472, id8475809: ID8476431Class
//    let id8478519: ID8471804Class
//    let id8477409: ID8476431Class
//    let id8478416, id8476975, id8473986: ID8471804Class
//    let id8476883: Id8476
//    let id8474564: ID8476431Class
//    let id8479410: ID8471804Class
//    
//    enum CodingKeys: String, CodingKey {
//        case id8480172
//        case id8476826
//        case id8470601
//        case id8476624
//        case id8474567
//        case id8474568
//        case id8476453
//        case id8474870
//        case id8476399
//        case id8474031
//        case id8478477
//        case id8475167
//        case id8474151
//        case id8474034
//        case id8480186
//        case id8476292
//        case id8478010
//        case id8478472
//        case id8475809
//        case id8478519
//        case id8477409
//        case id8478416
//        case id8476975
//        case id8473986
//        case id8476883
//        case id8474564
//        case id8479410
//    }
//}
//
//// MARK: - Decisions
//struct Decisions: Codable {
//    let winner, loser, firstStar, secondStar: FirstStar
//    let thirdStar: FirstStar
//}
//
//// MARK: - Linescore
//struct Linescore: Codable {
//    let currentPeriod: Int
//    let currentPeriodOrdinal: CurrentPeriodOrdinal
//    let currentPeriodTimeRemaining: String
//    let periods: [Period]
//    let shootoutInfo: ShootoutInfo
//    let teams: LinescoreTeams
//    let powerPlayStrength: String
//    let hasShootout: Bool
//    let intermissionInfo: IntermissionInfo
//    let powerPlayInfo: PowerPlayInfo
//}
//
//enum CurrentPeriodOrdinal: String, Codable {
//    case ot = "OT"
//    case the1St = "1st"
//    case the2Nd = "2nd"
//    case the2Ot = "2OT"
//    case the3Ot = "3OT"
//    case the3RD = "3rd"
//    case the4Ot = "4OT"
//    case the5Ot = "5OT"
//}
//
//// MARK: - IntermissionInfo
//struct IntermissionInfo: Codable {
//    let intermissionTimeRemaining, intermissionTimeElapsed: Int
//    let inIntermission: Bool
//}
//
//// MARK: - Period
//struct Period: Codable {
//    let periodType: PeriodType
//    let startTime, endTime: Date
//    let num: Int
//    let ordinalNum: CurrentPeriodOrdinal
//    let home, away: PeriodAway
//}
//
//// MARK: - PeriodAway
//struct PeriodAway: Codable {
//    let goals, shotsOnGoal: Int
//    let rinkSide: RinkSide
//}
//
//enum RinkSide: String, Codable {
//    case rinkSideLeft = "left"
//    case rinkSideRight = "right"
//}
//
//enum PeriodType: String, Codable {
//    case overtime = "OVERTIME"
//    case regular = "REGULAR"
//}
//
//// MARK: - PowerPlayInfo
//struct PowerPlayInfo: Codable {
//    let situationTimeRemaining, situationTimeElapsed: Int
//    let inSituation: Bool
//}
//
//// MARK: - ShootoutInfo
//struct ShootoutInfo: Codable {
//    let away, home: ShootoutInfoAway
//}
//
//// MARK: - ShootoutInfoAway
//struct ShootoutInfoAway: Codable {
//    let scores, attempts: Int
//}
//
//// MARK: - LinescoreTeams
//struct LinescoreTeams: Codable {
//    let home, away: TentacledAway
//}
//
//// MARK: - TentacledAway
//struct TentacledAway: Codable {
//    let team: CurrentTeam
//    let goals, shotsOnGoal: Int
//    let goaliePulled: Bool
//    let numSkaters: Int
//    let powerPlay: Bool
//}
//
//// MARK: - Plays
//struct Plays: Codable {
//    let allPlays: [AllPlay]
//    let scoringPlays, penaltyPlays: [Int]
//    let playsByPeriod: [PlaysByPeriod]
//    let currentPlay: CurrentPlay
//}
//
//// MARK: - AllPlay
//struct AllPlay: Codable {
//    let result: AllPlayResult
//    let about: About
//    let coordinates: AllPlayCoordinates
//    let players: [PlayerElement]?
//    let team: Division?
//}
//
//// MARK: - About
//struct About: Codable {
//    let eventIdx, eventID, period: Int
//    let periodType: PeriodType
//    let ordinalNum: CurrentPeriodOrdinal
//    let periodTime, periodTimeRemaining: String
//    let dateTime: Date
//    let goals: Goals
//    
//    enum CodingKeys: String, CodingKey {
//        case eventIdx
//        case eventID
//        case period, periodType, ordinalNum, periodTime, periodTimeRemaining, dateTime, goals
//    }
//}
//
//// MARK: - Goals
//struct Goals: Codable {
//    let away, home: Int
//}
//
//// MARK: - AllPlayCoordinates
//struct AllPlayCoordinates: Codable {
//    let x, y: Int?
//}
//
//// MARK: - PlayerElement
//struct PlayerElement: Codable {
//    let player: FirstStar
//    let playerType: PlayerType
//    let seasonTotal: Int?
//}
//
//enum PlayerType: String, Codable {
//    case assist = "Assist"
//    case blocker = "Blocker"
//    case drewBy = "DrewBy"
//    case goalie = "Goalie"
//    case hittee = "Hittee"
//    case hitter = "Hitter"
//    case loser = "Loser"
//    case penaltyOn = "PenaltyOn"
//    case playerID = "PlayerID"
//    case scorer = "Scorer"
//    case shooter = "Shooter"
//    case winner = "Winner"
//}
//
//// MARK: - AllPlayResult
//struct AllPlayResult: Codable {
//    let event: Description
//    let eventCode: String
//    let eventTypeID: EventTypeID
//    let resultDescription: String
//    let secondaryType: SecondaryType?
//    let penaltySeverity: String?
//    let penaltyMinutes: Int?
//    let strength: Strength?
//    let gameWinningGoal, emptyNet: Bool?
//    
//    enum CodingKeys: String, CodingKey {
//        case event, eventCode
//        case eventTypeID
//        case resultDescription
//        case secondaryType, penaltySeverity, penaltyMinutes, strength, gameWinningGoal, emptyNet
//    }
//}
//
//enum Description: String, Codable {
//    case blockedShot = "Blocked Shot"
//    case faceoff = "Faceoff"
//    case gameEnd = "Game End"
//    case gameOfficial = "Game Official"
//    case gameScheduled = "Game Scheduled"
//    case giveaway = "Giveaway"
//    case goal = "Goal"
//    case hit = "Hit"
//    case missedShot = "Missed Shot"
//    case penalty = "Penalty"
//    case periodEnd = "Period End"
//    case periodOfficial = "Period Official"
//    case periodReady = "Period Ready"
//    case periodStart = "Period Start"
//    case shot = "Shot"
//    case stoppage = "Stoppage"
//    case takeaway = "Takeaway"
//}
//
//enum EventTypeID: String, Codable {
//    case blockedShot = "BLOCKED_SHOT"
//    case faceoff = "FACEOFF"
//    case gameEnd = "GAME_END"
//    case gameOfficial = "GAME_OFFICIAL"
//    case gameScheduled = "GAME_SCHEDULED"
//    case giveaway = "GIVEAWAY"
//    case goal = "GOAL"
//    case hit = "HIT"
//    case missedShot = "MISSED_SHOT"
//    case penalty = "PENALTY"
//    case periodEnd = "PERIOD_END"
//    case periodOfficial = "PERIOD_OFFICIAL"
//    case periodReady = "PERIOD_READY"
//    case periodStart = "PERIOD_START"
//    case shot = "SHOT"
//    case stop = "STOP"
//    case takeaway = "TAKEAWAY"
//}
//
//enum SecondaryType: String, Codable {
//    case backhand = "Backhand"
//    case deflected = "Deflected"
//    case delayingGamePuckOverGlass = "Delaying Game - Puck over glass"
//    case hiSticking = "Hi-sticking"
//    case holding = "Holding"
//    case slapShot = "Slap Shot"
//    case slashing = "Slashing"
//    case snapShot = "Snap Shot"
//    case tooManyMenOnTheIce = "Too many men on the ice"
//    case tripping = "Tripping"
//    case wrapAround = "Wrap-around"
//    case wristShot = "Wrist Shot"
//}
//
//// MARK: - Strength
//struct Strength: Codable {
//    let code, name: String
//}
//
//// MARK: - CurrentPlay
//struct CurrentPlay: Codable {
//    let result: CurrentPlayResult
//    let about: About
//    let coordinates: StatsClass
//}
//
//// MARK: - CurrentPlayResult
//struct CurrentPlayResult: Codable {
//    let event: Description
//    let eventCode: String
//    let eventTypeID: EventTypeID
//    let resultDescription: Description
//    
//    enum CodingKeys: String, CodingKey {
//        case event, eventCode
//        case eventTypeID
//        case resultDescription
//    }
//}
//
//// MARK: - PlaysByPeriod
//struct PlaysByPeriod: Codable {
//    let startIndex: Int
//    let plays: [Int]
//    let endIndex: Int
//}
//
