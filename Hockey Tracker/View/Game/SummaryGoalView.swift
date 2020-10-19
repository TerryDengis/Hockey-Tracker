//
//  SummaryGoalView.swift
//  Hockey Tracker
//
//  Created by Terry Dengis on 9/16/20.
//

import SwiftUI

struct SummaryGoalView: View {
    @EnvironmentObject var gameStore: GameStore
    var body: some View {
        HStack {
            VStack {
                Text ("Goals")
                    .fontWeight(.bold)
                Text (gameStore.awayTeamAbbreviation)
                Text (gameStore.homeTeamAbbreviation)
            }
            if let periods = gameStore.periods {
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
                Text ("\(gameStore.awayScore)")
                Text ("\(gameStore.homeScore)")
            }
        }
        .font(.body)
    }
}

struct SummaryScoreView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = GameStore()
        vm.setUrl( domainUrl + "/api/v1/game/2019021011/feed/live")
        
        return SummaryGoalView().environmentObject(vm)
    }
}
