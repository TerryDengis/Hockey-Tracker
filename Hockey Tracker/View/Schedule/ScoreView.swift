//
//  ScoreView.swift
//  Hockey Tracker
//
//  Created by Terry Dengis on 9/17/20.
//

import SwiftUI

struct ScoreView: View {
    @EnvironmentObject var scheduleStore: ScheduleStore
    var game: Schedule.Games.GameDetail
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack  {
                Image(scheduleStore.awayTeamNameFor(game))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                Text (scheduleStore.awayTeamNameFor(game))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color("Primary"))
                Text ("\(scheduleStore.awayTeamScoreFor(game))")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color("Primary"))
            }
            
            HStack {
                Spacer()
                Text (scheduleStore.gameStatus(for: game))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color("Primary"))
                Image(systemName: "chevron.right")
                    .padding(.leading)
            }
            HStack {
                Image(scheduleStore.homeTeamNameFor(game))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                Text (scheduleStore.homeTeamNameFor(game))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color("Primary"))
                Text ("\(scheduleStore.homeTeamScoreFor(game))")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color("Primary"))
            }
        }
        .font(.body)
    }
}

struct ScoreView_Previews: PreviewProvider {

    static var previews: some View {
        let vm = ScheduleStore()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from:"2020-08-30")!
        vm.setDate(date)
        let game = vm.games[0]
        
        return ScoreView(game: game).environmentObject(vm)
    }
}

