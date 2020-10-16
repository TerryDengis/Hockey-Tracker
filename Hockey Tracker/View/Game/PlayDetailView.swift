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
                .font(.title)
                .foregroundColor(Color(gameVM.teamColor((play.team?.triCode) ?? .Calgary)))
            Text(play.result.event)
                .font(.title2)
            let playersInvolved = gameVM.playersInvolvedIn(play)
            HStack {
                ForEach(playersInvolved, id:\.id) { player in
                    VStack {
                        Image("Silhouette")
                            .resizable()
                            .scaledToFit()
                            .frame(minWidth: 50, maxWidth: 100, minHeight: 50, maxHeight: 100)
                        Text(player.fullName)
                            .font(.body)
                        Text(player.link)
                    }
                    .padding()
                }
            }
            
            Text(play.result.description)
                .font(.title2)
                .lineLimit(4)
                .multilineTextAlignment(.center)
            
            Text("\(play.about.ordinalNum) \(play.about.period <= 3 ? "Period" :"") @ \(play.about.periodTime)")
                .font(.title)
        }
        .padding()
        .foregroundColor(.primary)
        .background(Color.secondary)

    }
}

struct PlayDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let gameStore = GameStore(gameLink: domainUrl + "/api/v1/game/2019021011/feed/live")
        let plays = gameStore.playsForPeriod(1)
        let play = plays[95]

        return PlayDetailView(play: play).environmentObject(gameStore)
    }
}

