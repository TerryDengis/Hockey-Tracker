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
                    .frame(width: 40, height: 40)
                Text (scheduleVM.awayTeamNameFor(game))
                Text ("\(scheduleVM.awayTeamScoreFor(game))")
            }
            HStack {
                Spacer()
                Text (scheduleVM.gameStatus(for: game))
                Image(systemName: "chevron.right")
                    .padding(.leading)
            }
            HStack {
                Image(scheduleVM.homeTeamNameFor(game))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                Text (scheduleVM.homeTeamNameFor(game))
                Text ("\(scheduleVM.homeTeamScoreFor(game))")
            }
        }
        .font(.title2)
    }
}

struct ScoreView_Previews: PreviewProvider {

    static var previews: some View {
        let vm = ScheduleStore()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from:"2020-08-30")!
        vm.setDate(date)
        let game = vm.games[0]
        
        return ScoreView(game: game).environmentObject(vm)
    }
}

