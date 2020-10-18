//// MARK: - Game
//struct Game: Codable {
//    let liveData: LiveData
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
//    let away: PurpleAway
//    let home: Home
//}
//
//// MARK: - PurpleAway
//struct PurpleAway: Codable {
//    let team: Team
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
//// MARK: - Position
//struct Position: Codable {
//    let code, name: String
//    let type: TypeEnum
//    let abbreviation: String
//}
//
//enum TypeEnum: String, Codable {
//    case defenseman = "Defenseman"
//    case forward = "Forward"
//    case goalie = "Goalie"
//    case headCoach = "Head Coach"
//    case unknown = "Unknown"
//}
//
//// MARK: - OnIcePlus
//struct OnIcePlus: Codable {
//    let playerID, shiftDuration, stamina: Int
//    
//    enum CodingKeys: String, CodingKey {
//        case playerID = "playerId"
//        case shiftDuration, stamina
//    }
//}
//
//// MARK: - AwayPlayers
//struct AwayPlayers: Codable {
//    let id8470966: ID8470966Class
//    let id8474628, id8476979, id8477935: Id84
//    let id8474736: ID8470966Class
//    let id8474673, id8476356, id8475762, id8479346: Id84
//    let id8476873, id8474150, id8476346, id8479314: Id84
//    let id8478397: Id84
//    let id8478430: ID8470966Class
//    let id8478396, id8473473, id8477497: Id84
//    let id8479496: ID8479496Class
//    let id8478585, id8477496, id8478233: Id84
//    
//    enum CodingKeys: String, CodingKey {
//        case id8470966 = "ID8470966"
//        case id8474628 = "ID8474628"
//        case id8476979 = "ID8476979"
//        case id8477935 = "ID8477935"
//        case id8474736 = "ID8474736"
//        case id8474673 = "ID8474673"
//        case id8476356 = "ID8476356"
//        case id8475762 = "ID8475762"
//        case id8479346 = "ID8479346"
//        case id8476873 = "ID8476873"
//        case id8474150 = "ID8474150"
//        case id8476346 = "ID8476346"
//        case id8479314 = "ID8479314"
//        case id8478397 = "ID8478397"
//        case id8478430 = "ID8478430"
//        case id8478396 = "ID8478396"
//        case id8473473 = "ID8473473"
//        case id8477497 = "ID8477497"
//        case id8479496 = "ID8479496"
//        case id8478585 = "ID8478585"
//        case id8477496 = "ID8477496"
//        case id8478233 = "ID8478233"
//    }
//}
//
//// MARK: - ID8470966Class
//struct ID8470966Class: Codable {
//    let person: ID8470966Person
//    let jerseyNumber: String
//    let position: Position
//    let stats: StatsClass
//}
//
//// MARK: - ID8470966Person
//struct ID8470966Person: Codable {
//    let id: Int
//    let fullName, link: String
//    let shootsCatches: ShootsCatches
//    let rosterStatus: RosterStatus
//}
//
//enum RosterStatus: String, Codable {
//    case n = "N"
//    case y = "Y"
//}
//
//enum ShootsCatches: String, Codable {
//    case l = "L"
//    case r = "R"
//}
//
//// MARK: - StatsClass
//struct StatsClass: Codable {
//}
//
//// MARK: - Id84
//struct Id84: Codable {
//    let person: ID8470966Person
//    let jerseyNumber: String
//    let position: Position
//    let stats: ID8473473Stats
//}
//
//// MARK: - ID8473473Stats
//struct ID8473473Stats: Codable {
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
//        case faceOffWINS = "faceOffWins"
//        case faceoffTaken, takeaways, giveaways, shortHandedGoals, shortHandedAssists, blocked, plusMinus, evenTimeOnIce, powerPlayTimeOnIce, shortHandedTimeOnIce, faceOffPct
//    }
//}
//
//// MARK: - ID8479496Class
//struct ID8479496Class: Codable {
//    let person: ID8470966Person
//    let jerseyNumber: String
//    let position: Position
//    let stats: ID8479496Stats
//}
//
//// MARK: - ID8479496Stats
//struct ID8479496Stats: Codable {
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
//// MARK: - Team
//struct Team: Codable {
//    let id: Int
//    let name: Name
//    let link: Link
//    let abbreviation: Abbreviation?
//    let triCode: Abbreviation
//}
//
//enum Abbreviation: String, Codable {
//    case bos = "BOS"
//    case cgy = "CGY"
//}
//
//enum Link: String, Codable {
//    case apiV1Teams20 = "/api/v1/teams/20"
//    case apiV1Teams6 = "/api/v1/teams/6"
//}
//
//enum Name: String, Codable {
//    case bostonBruins = "Boston Bruins"
//    case calgaryFlames = "Calgary Flames"
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
//    let team: Team
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
//    let id8470638, id8473419: Id84
//    let id8475807: ID8470966Class
//    let id8471276: Id84
//    let id8471695: ID8479496Class
//    let id8477956, id8475745, id8477941, id8480944: Id84
//    let id8479325, id8478468, id8480901, id8475780: Id84
//    let id8478443, id8476792, id8476891, id8476374: Id84
//    let id8478498: Id84
//    let id8475186, id8477320: ID8470966Class
//    let id8478075, id8465009: Id84
//    
//    enum CodingKeys: String, CodingKey {
//        case id8470638 = "ID8470638"
//        case id8473419 = "ID8473419"
//        case id8475807 = "ID8475807"
//        case id8471276 = "ID8471276"
//        case id8471695 = "ID8471695"
//        case id8477956 = "ID8477956"
//        case id8475745 = "ID8475745"
//        case id8477941 = "ID8477941"
//        case id8480944 = "ID8480944"
//        case id8479325 = "ID8479325"
//        case id8478468 = "ID8478468"
//        case id8480901 = "ID8480901"
//        case id8475780 = "ID8475780"
//        case id8478443 = "ID8478443"
//        case id8476792 = "ID8476792"
//        case id8476891 = "ID8476891"
//        case id8476374 = "ID8476374"
//        case id8478498 = "ID8478498"
//        case id8475186 = "ID8475186"
//        case id8477320 = "ID8477320"
//        case id8478075 = "ID8478075"
//        case id8465009 = "ID8465009"
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
//    case the1St = "1st"
//    case the2Nd = "2nd"
//    case the3RD = "3rd"
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
//    let rinkSide: String
//}
//
//enum PeriodType: String, Codable {
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
//    let home, away: TeamsHome
//}
//
//// MARK: - TeamsHome
//struct TeamsHome: Codable {
//    let team: Team
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
//    let players: [Player]?
//    let team: Team?
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
//        case eventID = "eventId"
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
//// MARK: - Player
//struct Player: Codable {
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
//    let secondaryType, penaltySeverity: String?
//    let penaltyMinutes: Int?
//    let strength: Strength?
//    let gameWinningGoal, emptyNet: Bool?
//    
//    enum CodingKeys: String, CodingKey {
//        case event, eventCode
//        case eventTypeID = "eventTypeId"
//        case resultDescription = "description"
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
//        case eventTypeID = "eventTypeId"
//        case resultDescription = "description"
//    }
//}
//
//// MARK: - PlaysByPeriod
//struct PlaysByPeriod: Codable {
//    let startIndex: Int
//    let plays: [Int]
//    let endIndex: Int
//}
