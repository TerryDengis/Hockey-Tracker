//
//  ScheduleVM.swift
//  Hockey Tracker
//
//  Created by Terry Dengis on 9/19/20.
//

import Foundation

class ScheduleVM: ObservableObject {
    @Published private var schedule: Schedule?
    private var scheduleDate = Date()

    init() {
        fetchScheduleData()
    }
    
    func setDate(_ date: Date) {
        scheduleDate = date
        fetchScheduleData()
    }
    
    var games: [Schedule.Games.GameDetail] {
        if let games = schedule?.totalItems {
            if games > 0, let gamesList = schedule?.dates[0].games {
                return gamesList
            }
        }
        
        return [Schedule.Games.GameDetail]()
    }
    
    func awayTeamNameFor (_ game: Schedule.Games.GameDetail) -> String {
        game.teams.away.team.name
    }
    
    func awayTeamScoreFor (_ game: Schedule.Games.GameDetail) -> Int {
        game.teams.away.score
    }
    
    func homeTeamNameFor (_ game: Schedule.Games.GameDetail) -> String {
        game.teams.home.team.name
    }
    
    func homeTeamScoreFor (_ game: Schedule.Games.GameDetail) -> Int {
        game.teams.home.score
    }
    
    func getStartTime (_ game: Schedule.Games.GameDetail) -> String {
        let formatter = DateFormatter ()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let gameDateString = formatter.date(from: game.gameDate) {
            return gameDateString.convertToString(dateformat: .timeAM)
        }
        return "error"
    }
    
    func gameStatus(for game: Schedule.Games.GameDetail) -> String {
        switch (game.status.statusCode) {
        case .scheduled, .pregame:
            return getStartTime(game)
        case .inProgress, .inProgressCritical:
            return "\(game.linescore.currentPeriodOrdinal ?? "Unkown") \(game.linescore.currentPeriodTimeRemaining!)"
        case .gameOver, .unofficial, .final:
            if game.linescore.currentPeriod == 3 {
                return "\(game.linescore.currentPeriodTimeRemaining!)"
            } else {
                return "\(game.linescore.currentPeriodTimeRemaining!) (\(game.linescore.currentPeriodOrdinal ?? "Unkown"))"
            }
        }
    }

    func linkFor (_ game: Schedule.Games.GameDetail) -> String {
        game.link
    }
    
    func keyFor (_ game: Schedule.Games.GameDetail) -> Int {
        game.gamePk
    }
    
    private func fetchScheduleData() {
        if let url = URL(string: scheduleUrl + scheduleDate.convertToString(dateformat: .reverseDate) + scheduleSuffix) {
            print (" schedule URL", url)
            URLSession.shared.dataTask(with: url) { data, response, error in
                do {
                    if let json = data {
                        let decodedGame = try JSONDecoder().decode(Schedule.self, from: json)
                        DispatchQueue.main.async {
                            self.schedule = decodedGame
                        }
                    } else {
                        print("No Data found at", url)
                    }
                } catch {
                    print("Schedule Decode Error...", error)
                }
            }.resume()
        }
    }
}