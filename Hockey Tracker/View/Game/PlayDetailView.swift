//
//  PlayDetailView.swift
//  Hockey Tracker
//
//  Created by Terry Dengis on 9/28/20.
//

import SwiftUI

struct PlayDetailView: View {
    @EnvironmentObject var gameVM: GameStore
    @Environment(\.presentationMode) var presentationMode
    
    var play: GameSummary.LiveData.Plays.Play
    
    var body: some View {
        NavigationView {
            VStack {
                Image(play.team!.name)
                    .resizable()
                    .scaledToFit()
                    .frame(width:100, height: 100)
                Text(play.team!.name)
                    .font(.largeTitle)
                    .foregroundColor(Color(gameVM.teamColor((play.team?.triCode) ?? .Calgary)))
  
//                Text("\(play.about.goals.away)")
//                Text("\(play.about.goals.home)")
                
                Text(play.result.description)
                    .font(.title)
                    .lineLimit(.none)
                    .multilineTextAlignment(.center)
                    .padding()
                Spacer()
                Text("\(play.about.ordinalNum) \(play.about.period <= 3 ? "Period" :"") @ \(play.about.periodTime)")
                    .font(.title)
                Spacer()
            }
            .padding()
            .foregroundColor(.primary)
            .navigationBarTitle(play.result.event, displayMode: .inline)
            .navigationBarItems(
                trailing:
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Done")
                    }
            )
        }
        .background(Color.secondary)
        .navigationViewStyle(StackNavigationViewStyle())
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

