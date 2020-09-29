//
//  PeriodView.swift
//  Hockey Tracker
//
//  Created by Terry Dengis on 9/17/20.
//

import SwiftUI

struct PeriodView: View {
    @ObservedObject var gameVM: GameVM
    @Binding var currentPeriod: Int
    
    var body: some View {
        HStack {
            if let periods = gameVM.periods {
                ForEach(periods, id: \.id) { period in
                    Button(period.ordinalNum) {
                        currentPeriod = period.id
                    }
                    .frame(width: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .border(currentPeriod == period.id ? Color.black : Color.yellow, width: 3)
                    .background(currentPeriod == period.id ? Color.black : Color.yellow)
                    .cornerRadius(5)

                }
                if gameVM.shootOut {
                    Button("SO") {
                        currentPeriod = 5
                    }
                    .frame(width: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .border(currentPeriod == 5 ? Color.black : Color.yellow, width: 3)
                    .background(currentPeriod == 5 ? Color.black : Color.yellow)
                    .cornerRadius(5)
                }
            }
            
        }
        .font(.subheadline)
    }
}

struct PeriodView_Previews: PreviewProvider {
    static var previews: some View {
        PeriodView(gameVM: GameVM(gameLink: domainUrl + "/api/v1/game/2019030234/feed/live"), currentPeriod: Binding.constant(2))
    }
}
