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
    
    var body: some View {
        let gamesList = scheduleVM.games
        
        ScrollView {
            LazyVStack(spacing: 1) {
                if scheduleVM.games.count == 0 {
                    Text("No Games Scheduled")
                        .font(.largeTitle)
                        .foregroundColor(Color("Primary"))
                    Spacer()
                } 
                ForEach(0..<gamesList.count, id:\.self) { index in
                    NavigationLink (
                        destination: RinkView(gameStore: GameStore(gameLink: domainUrl + scheduleVM.linkFor(gamesList[index]))),
                        label: {
                            VStack{
                                ScoreView(game: gamesList[index]).environmentObject(scheduleVM)
                                    .padding(5)
                                Divider()
                                    .background(Color("Secondary"))
                            }
                        })
                        .background(Color("Background"))
                }
            }
        }
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
