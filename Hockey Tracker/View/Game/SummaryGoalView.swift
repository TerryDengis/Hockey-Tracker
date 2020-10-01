//
//  SummaryGoalView.swift
//  Hockey Tracker
//
//  Created by Terry Dengis on 9/16/20.
//

import SwiftUI

struct SummaryGoalView: View {
    @EnvironmentObject var gameVM: GameVM
    var body: some View {
        HStack {
            //LazyVGrid(columns: [GridItem(.adaptive(minimum:30))], alignment: .leading)
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
        .padding(0)
        .font(.caption)
        
    }
}

struct SummaryScoreView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = GameVM()
        vm.setUrl( domainUrl + "/api/v1/game/2019021011/feed/live")
        
        return SummaryGoalView().environmentObject(vm)
    }
}
