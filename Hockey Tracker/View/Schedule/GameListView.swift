//
//  GameListView.swift
//  Hockey Tracker
//
//  Created by Terry Dengis on 9/23/20.
//

import SwiftUI
import UIKit

struct GameListView: View {
    @EnvironmentObject var scheduleVM: ScheduleStore
    
    init() {
        UITableView.appearance().backgroundColor = .lightGray
        UITableViewCell.appearance().selectionStyle = .none
        UITableView.appearance().separatorStyle = .singleLine
        UITableView.appearance().separatorColor = .black
    }
    
    var body: some View {
        let gamesList = scheduleVM.games
        
        
        // TODO: - needs to be in a form to color the background
        Form {
            List(gamesList, id: \.gamePk) { game in
                NavigationLink (
                    destination: RinkView(gameStore: GameStore(gameLink: domainUrl + scheduleVM.linkFor(game))),
                    label: {
                        ScoreView(game: game).environmentObject(scheduleVM)
                            .padding()
                    })
            }
            .listRowBackground(Color(UIColor.systemGray2))
            //.listRowBackground(scheduleVM.indexOf(game!) % 2 == 0 ? Color(UIColor.lightGray) : Color.gray)
            .listRowInsets(EdgeInsets(top: -1, leading: -1, bottom: -1, trailing: -1))

        } // form
    }
}

struct GameListView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = ScheduleStore()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from:"2020-08-30")!
        
        vm.setDate(date)
        return GameListView().environmentObject(vm)
    }
}
