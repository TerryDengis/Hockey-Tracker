//
//  SummaryShotsView.swift
//  Hockey Tracker
//
//  Created by Terry Dengis on 9/19/20.
//

import SwiftUI

struct SummaryShotsView: View {
    @ObservedObject var gameVM: GameVM
    
    var body: some View {
        HStack {
            //LazyVGrid(columns: [GridItem(.adaptive(minimum:30))], alignment: .leading) {
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
        .font(.caption)
    }
    
}

struct SummaryShotsView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryShotsView(gameVM: GameVM(gameLink: domainUrl + "/api/v1/game/2019021011/feed/live"))
    }
}