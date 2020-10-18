//
//  SummaryShotsView.swift
//  Hockey Tracker
//
//  Created by Terry Dengis on 9/19/20.
//

import SwiftUI

struct SummaryShotsView: View {
    @EnvironmentObject var gameVM: GameStore
    
    var body: some View {
        HStack {
            VStack {
                Text ("Shots")
                    .fontWeight(.bold)
                Text (gameVM.awayTeamAbbreviation)
                Text (gameVM.homeTeamAbbreviation)
            }
            if let periods = gameVM.periods {
                
                ForEach(periods, id: \.id) { period in
                    VStack {
                        Text(period.ordinalNum)
                        Text("\(period.away.shotsOnGoal)")
                        Text("\(period.home.shotsOnGoal)")
                    }
                }
            }
            VStack {
                Text ("Tot")
                    .fontWeight(.bold)
                Text ("\(gameVM.awayShots)")
                Text ("\(gameVM.homeShots)")
            }
        }
        .font(.body)
    }
}

struct SummaryShotsView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = GameStore()
        vm.setUrl(domainUrl + "/api/v1/game/2019021011/feed/live")
        
        return SummaryShotsView().environmentObject(vm)
    }
}
