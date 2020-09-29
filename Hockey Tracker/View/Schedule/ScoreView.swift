//
//  ScoreView.swift
//  Hockey Tracker
//
//  Created by Terry Dengis on 9/17/20.
//

import SwiftUI

struct ScoreView: View {
    @ObservedObject var scheduleVM: ScheduleVM
    var game: Schedule.Games.GameDetail
    
    var body: some View {
        HStack {
            Spacer ()
            Image(scheduleVM.awayTeamNameFor(game))
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
            Text (scheduleVM.awayTeamNameFor(game))
            Text ("\(scheduleVM.awayTeamScoreFor(game))")
            
            Text ("at")
            
            Image(scheduleVM.homeTeamNameFor(game))
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
            Text (scheduleVM.homeTeamNameFor(game))
            Text ("\(scheduleVM.homeTeamScoreFor(game))")
            Text (scheduleVM.gameStatus(for: game))
            Spacer ()
        }
        
        
//        HStack {
//            HStack {
//                Text(gameVM.awayTeam)
//                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
//                Text("\(gameVM.awayScore)")
//            }
//            .foregroundColor(Color(gameVM.awayTeamColor))
//            Text ("at")
//            HStack {
//                Text (gameVM.homeTeam)
//                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
//                Text ("\(gameVM.homeScore)")
//            }
//            .foregroundColor(Color(gameVM.homeTeamColor))
//            Text (gameVM.gameStatus)
//        }
//        .font(.headline)
    }
}

//struct ScoreView_Previews: PreviewProvider {
//    static var previews: some View {
//        ScoreView()
//    }
//}
