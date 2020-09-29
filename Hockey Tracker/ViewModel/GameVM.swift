//
//  GameVM.swift
//  Hockey Tracker
//
//  Created by Terry Dengis on 9/19/20.
//

import SwiftUI
import Combine

class GameVM: ObservableObject {
    @Published private var gameSummary: GameSummary?
    
    @AppStorage ("showGoals") var showGoals: Bool?
    @AppStorage ("showShots") var showShots: Bool?
    @AppStorage ("showMissedShots") var showMissedShots: Bool?
    @AppStorage ("showBlockedShots") var showBlockedShots: Bool?
    
    var gameLink: String
    
    init (gameLink: String) {
        self.gameLink = gameLink
    }
    
    func fetchGameData() {
        if let url = URL(string: gameLink ) {
            print (" game URL", gameLink)
            URLSession.shared.dataTask(with: url) { data, response, error in
                do {
                    if let json = data {
                        let decodedGame = try JSONDecoder().decode(GameSummary.self, from: json)
                        DispatchQueue.main.async {
                            self.gameSummary = decodedGame
                        }
                    } else {
                        print("No Data found at ", url)
                    }
                } catch {
                    print("Decode Error...", error)
                }
            }.resume()
        }
    }

    func gameData() -> GameSummary? {
        gameSummary
    }
    
    func setGameUrl (_ url: String) {
        print (url)
        gameLink = url
    }
    
    func teamColorFor (_ play: GameSummary.LiveData.Plays.Play) -> UIColor {
        if play.team?.triCode == gameSummary?.gameData.teams.away.triCode {
            return awayTeamColor
        } else {
            return homeTeamColor
        }
    }
    
    func eventImageFor (_ play: GameSummary.LiveData.Plays.Play) -> String {
        var imageStyle: String
        
        if play.team?.triCode == gameSummary?.gameData.teams.away.triCode {
            imageStyle = away
        } else {
            imageStyle = home
        }
        switch play.result.eventTypeId {
        case .goal:
            var scoreModifier = 0
            if shootOut {
                scoreModifier = 1
            }
            if play.team?.triCode == gameSummary?.gameData.teams.away.triCode {
                return "\(play.about.goals.away+scoreModifier)" + imageStyle
            } else {
                return "\(play.about.goals.home+scoreModifier)" + imageStyle
            }
        case .shot:
            return shot + imageStyle
        case .missedShot:
            return missedShot + imageStyle
        case .blockedShot:
            return blockedShot + imageStyle
        default:
            return imageStyle
        }
    }
    
    func xCoordinateFor (_ play: GameSummary.LiveData.Plays.Play) -> CGFloat {
        if let x = play.coordinates.x {
            //print ("x = \(x)")
            return CGFloat(x) + rinkWidth / 2.0
        }
        return 0.0
    }
    
    func yCoordinateFor (_ play: GameSummary.LiveData.Plays.Play) -> CGFloat{
        if let y = play.coordinates.y {
            //print ("y = \(y)")
            return CGFloat(y * -1) + rinkHeight / 2.0
        }
        return 0.0
    }
    
    func playsForPeriod(_ period: Int) -> [GameSummary.LiveData.Plays.Play] {
        var plays = [GameSummary.LiveData.Plays.Play]()
        
        if period > 0 {
            let startIndex = gameSummary?.liveData.plays.playsByPeriod[period-1].startIndex
            let endIndex = gameSummary?.liveData.plays.playsByPeriod[period-1].endIndex
            let allPlays = gameSummary?.liveData.plays.allPlays
            
            if startIndex != nil && endIndex != nil && allPlays != nil {
                for index in startIndex!...endIndex! {
                    if allPlays![index].result.eventTypeId == EventType.goal  && showGoals! ||
                        allPlays![index].result.eventTypeId == EventType.shot && showShots! ||
                        allPlays![index].result.eventTypeId == EventType.blockedShot && showBlockedShots! ||
                        allPlays![index].result.eventTypeId == EventType.missedShot && showMissedShots! {
                        plays.append(allPlays![index])
                    }
                }
            }
        }
        
        return plays
    }
    func  isGoal(_ play: GameSummary.LiveData.Plays.Play) -> Bool {
        if play.result.eventTypeId == .goal {
            return true
        }
        return false
    }
    var shootOut: Bool {
        if let lineScore = gameSummary?.liveData.linescore {
            return lineScore.hasShootout
        }
        return false
    }
    
    var periods: [LineScore.Period]? {
        if let periods = gameSummary?.liveData.linescore?.periods {
            return periods
        }
        return nil
    }
    
    var awayTeamAbbreviation: String {
        if let teamName = gameSummary?.gameData.teams.away.abbreviation {
            return teamName
        }
        else {
            return ("Unknown")
        }
    }
    
    var homeTeamAbbreviation: String {
        if let teamName = gameSummary?.gameData.teams.home.abbreviation {
            return teamName
        }
        else {
            return ("Unknown")
        }
    }
    
    var awayTeam: String {
        if let teamName = gameSummary?.gameData.teams.away.teamName {
            return teamName
        }
        else {
            return ("Unknown")
        }
    }
    
    var homeTeam: String {
        if let teamName = gameSummary?.gameData.teams.home.teamName {
            return teamName
        }
        else {
            return ("Unknown")
        }
    }
    
    var awayTeamCode: TeamCode? {
        if let teamCode = gameSummary?.gameData.teams.away.triCode {
            return teamCode
        }
        else {
            return nil
        }
    }
    
    var homeTeamCode: TeamCode? {
        if let teamCode = gameSummary?.gameData.teams.home.triCode {
            return teamCode
        }
        else {
            return nil
        }
    }
    
    var awayTeamColor: UIColor {
        if let teamCode = gameSummary?.gameData.teams.away.triCode {
            return teamColor(teamCode)
        }
        return UIColor.black
    }
    
    var homeTeamColor: UIColor {
        if let teamCode = gameSummary?.gameData.teams.home.triCode {
            return teamColor(teamCode)
        }
        return UIColor.black
    }
    
    var awayScore: Int {
        if let score = gameSummary?.liveData.linescore?.teams.away.goals {
            return score
        }
        return -1
    }
    
    var homeScore: Int {
        if let score = gameSummary?.liveData.linescore?.teams.home.goals {
            return score
        }
        return -1
    }
    
    var awayShots: Int {
        if let shots = gameSummary?.liveData.linescore?.teams.away.shotsOnGoal {
            return shots
        }
        return -1
    }
    
    var homeShots: Int {
        if let shots = gameSummary?.liveData.linescore?.teams.home.shotsOnGoal {
            return shots
        }
        return -1
    }
    
    var gameStatus: String {

        if let period = gameSummary?.liveData.linescore?.currentPeriodOrdinal {
            if let time = gameSummary?.liveData.linescore?.currentPeriodTimeRemaining {
                if gameSummary?.gameData.status.statusCode == StatusCode.final {
                    return time
                } else {
                    return period + " " + time
                }
            }
        }
        return "Scheduled"
    }
        
    private func teamColor (_ team: TeamCode) -> UIColor {
        switch team {
        case .Anaheim:
            return UIColor(hexString: anaheim)
        case .Arizona:
            return UIColor(hexString: arizona)
        case .Boston:
            return UIColor(hexString: boston)
        case .Buffalo:
            return UIColor(hexString: buffalo)
        case .Calgary:
            return UIColor(hexString: calgary)
        case .Carolina:
            return UIColor(hexString: carolina)
        case .Chicago:
            return UIColor(hexString: chicago)
        case .Colorado:
            return UIColor(hexString: colorado)
        case .Columbus:
            return UIColor(hexString: columbus)
        case .Dallas:
            return UIColor(hexString: dallas)
        case .Detroit:
            return UIColor(hexString: detroit)
        case .Edmonton:
            return UIColor(hexString: edmonton)
        case .Florida:
            return UIColor(hexString: florida)
        case .LosAngeles:
            return UIColor(hexString: losAngeles)
        case .Minnesota:
            return UIColor(hexString: minnesota)
        case .Montreal:
            return UIColor(hexString: montreal)
        case .Nashville:
            return UIColor(hexString: nashville)
        case .Islanders:
            return UIColor(hexString: newYorkIslanders)
        case .NewJersey:
            return UIColor(hexString: newJersey)
        case .Rangers:
            return UIColor(hexString: newYork)
        case .Ottawa:
            return UIColor(hexString: ottawa )
        case .Philadelphia:
            return UIColor(hexString: philadelphia)
        case .Pittsburgh:
            return UIColor(hexString: pittsburgh)
        case .SanJose:
            return UIColor(hexString: sanJose)
        case .StLouis:
            return UIColor(hexString: stLouis)
        case .TampaBay:
            return UIColor(hexString: tampaBay)
        case .Toronto:
            return UIColor(hexString: toronto)
        case .Vancouver:
            return UIColor(hexString: vancouver)
        case .Vegas:
            return UIColor(hexString: vegas)
        case .Washington:
            return UIColor(hexString: washington)
        case .Winnipeg:
            return UIColor(hexString: winnipeg)
            
        // Old Teams
        case .Atlanta:
            return UIColor(hexString: atlanta)
        case .AtlantaFlames:
            return UIColor(hexString: atlanta)
        case .ColRock:
            return UIColor(hexString: colorado)
        case.Hartford:
            return UIColor(hexString: hartford)
        case .MinnesotaNS:
            return UIColor(hexString:minnestotaNS)
        case .Winnipeg92:
            return UIColor(hexString: winnipeg)
        case .Phoenix:
            return UIColor(hexString: arizona)
        case .Quebec:
            return UIColor(hexString: quebec)
        // case .California:
        // case .Cleveland:
        // case .KansasCity:
        // case .Oakland:
        default:
            return UIColor.blue
        }
    }
}
