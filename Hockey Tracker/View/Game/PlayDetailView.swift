//
//  PlayDetailView.swift
//  Hockey Tracker
//
//  Created by Terry Dengis on 9/28/20.
//

import SwiftUI

struct PlayDetailView: View {
    @EnvironmentObject var gameVM: GameStore
    var play: GameSummary.LiveData.Plays.Play
    
    var body: some View {
        VStack {
            Text(play.team!.name)
                .font(.largeTitle)
            Spacer()
            Text(play.result.description)
                .font(.body)
                .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                .multilineTextAlignment(.center)
            Spacer ()
            Text("\(play.about.ordinalNum) \(play.about.period <= 3 ? "Period" :"") @ \(play.about.periodTime)")
                .font(.title)
        }
        .foregroundColor(.primary)
        .padding()
    }
}

//struct PlayDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        let gameStore = GameStore(gameLink: domainUrl + "/api/v1/game/2019021011/feed/live")
//        let plays = gameStore.playsForPeriod(1)
//        let play = plays[10]
//
//        return PlayDetailView(play: play).environmentObject(gameStore)
//    }
//}

