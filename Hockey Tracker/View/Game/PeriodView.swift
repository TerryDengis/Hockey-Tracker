//
//  PeriodView.swift
//  Hockey Tracker
//
//  Created by Terry Dengis on 9/17/20.
//

import SwiftUI

struct PeriodView: View {
    @EnvironmentObject var gameStore: GameStore
    @Binding var currentPeriod: Int
    
    var body: some View {
        HStack {
            if let periods = gameStore.periods {
                ForEach(periods, id: \.id) { period in
                    Button(period.ordinalNum) {
                        withAnimation {
                            currentPeriod = period.id
                        }
                    }
                    .frame(width: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .border(currentPeriod == period.id ? Color.black : Color.yellow, width: 3)
                    .background(currentPeriod == period.id ? Color.black : Color.yellow)
                    .foregroundColor(Color("Primary"))
                    .cornerRadius(5)
                }
                if gameStore.shootOut {
                    Button("SO") {
                        currentPeriod = 5
                    }
                    .frame(width: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .border(currentPeriod == 5 ? Color.black : Color.yellow, width: 3)
                    .background(currentPeriod == 5 ? Color.black : Color.yellow)
                    .foregroundColor(Color("Primary"))
                    .cornerRadius(5)
                }
            }
            
        }
        .font(.subheadline)
    }
}

struct PeriodView_Previews: PreviewProvider {
    static var previews: some View {

        let vm = GameStore()
        vm.setUrl( domainUrl + "/api/v1/game/2019021011/feed/live")
        
        return PeriodView(currentPeriod: Binding.constant(2)).environmentObject(vm)
    }
}
