//
//  SummaryGoalView.swift
//  Hockey Tracker
//
//  Created by Terry Dengis on 9/16/20.
//

import SwiftUI

struct SummaryGoalView: View {
    @EnvironmentObject var gameVM: GameStore
    var body: some View {
        HStack {
            VStack {
                Text ("Goals")
                    .fontWeight(.bold)
                Text (gameVM.awayTeamAbbreviation)
                Text (gameVM.homeTeamAbbreviation)
            }
            if let periods = gameVM.periods {
                ForEach(periods, id: \.id) { period in
                    VStack {
                        Text(period.ordinalNum)
                        Text("\(period.away.goals)")
                        Text("\(period.home.goals)")
                    }
                }
            }
            VStack {
                Text ("Tot")
                    .fontWeight(.bold)
                Text ("\(gameVM.awayScore)")
                Text ("\(gameVM.homeScore)")
            }
        }
        .font(.caption)
    }
}

struct SummaryScoreView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = GameStore()
        vm.setUrl( domainUrl + "/api/v1/game/2019021011/feed/live")
        
        return SummaryGoalView().environmentObject(vm)
    }
}
