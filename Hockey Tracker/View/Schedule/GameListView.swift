//
//  GameListView.swift
//  Hockey Tracker
//
//  Created by Terry Dengis on 9/23/20.
//

import SwiftUI

struct GameListView: View {
    @EnvironmentObject var scheduleVM: ScheduleVM
    
    init() {
        UITableView.appearance().backgroundColor = .lightGray
    }
    
    var body: some View {
        let gamesList = scheduleVM.games
        // TODO: - needs to be in a form to color the background
        Form {
            List(gamesList, id: \.gamePk) { game in
                NavigationLink (
                    destination: RinkView(gameVM: GameVM(gameLink: domainUrl + scheduleVM.linkFor(game))),
                    label: {
                        ScoreView(scheduleVM: scheduleVM, game: game)
                    })
            }
            
            // TODO: - The selected row turns  gray?
            .listRowBackground(Color(UIColor.lightGray))
        } // form
    }
}

struct GameListView_Previews: PreviewProvider {
    static var previews: some View {
        GameListView()
    }
}
