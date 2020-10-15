//
//  ScoreView.swift
//  Hockey Tracker
//
//  Created by Terry Dengis on 9/17/20.
//

import SwiftUI

struct ScoreView: View {
    @EnvironmentObject var scheduleVM: ScheduleStore
    var game: Schedule.Games.GameDetail
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack  {
                Image(scheduleVM.awayTeamNameFor(game))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                Text (scheduleVM.awayTeamNameFor(game))
                Text ("\(scheduleVM.awayTeamScoreFor(game))")
            }
            HStack {
                Spacer()
                Text (scheduleVM.gameStatus(for: game))
            }
            HStack {
                Image(scheduleVM.homeTeamNameFor(game))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                Text (scheduleVM.homeTeamNameFor(game))
                Text ("\(scheduleVM.homeTeamScoreFor(game))")
            }
        }
    }
}

//struct ScoreView_Previews: PreviewProvider {
//    static var previews: some View {
//        ScoreView()
//    }
//}
