//
//  PlayDetailView.swift
//  Hockey Tracker
//
//  Created by Terry Dengis on 9/28/20.
//

import SwiftUI

struct PlayDetailView: View {
    @ObservedObject var gameVM: GameVM
    var play: GameSummary.LiveData.Plays.Play
    
    var body: some View {
        VStack {
            Text(play.team!.name)
                .font(.largeTitle)
            Spacer()
            Text(play.result.description)
                .font(.body)
            Spacer ()
            Text("\(play.about.ordinalNum) \(play.about.period <= 3 ? "Period" :"") @ \(play.about.periodTime)")
                .font(.title)
        }
        .padding()
    }
}

//struct PlayDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlayDetailView()
//    }
//}
