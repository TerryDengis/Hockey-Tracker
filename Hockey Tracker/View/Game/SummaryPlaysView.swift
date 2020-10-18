//
//  SummaryPlaysView.swift
//  Hockey Tracker
//
//  Created by Terry Dengis on 10/18/20.
//

import SwiftUI

struct SummaryPlaysView: View {
    @EnvironmentObject var gameStore: GameStore
    @Environment(\.presentationMode) var presentationMode
    var forPeriod: Int
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("Background")
                    .edgesIgnoringSafeArea(.all)
                ScrollView {
                    let plays = gameStore.playsForPeriod(forPeriod)
                    ForEach(plays, id: \.id) { play in
                        VStack {
                            HStack {
                                Spacer()
                                Image(systemName: gameStore.eventImageFor(play))
                                    .imageScale(.large)
                                Text (play.ordinalEventTime())
                                Text(play.team?.name ?? "Unknown")
                                Spacer()
                            }
                            .background(Capsule().fill(Color("Secondary")))
                            .foregroundColor(Color(gameStore.teamColorFor(play)))
                            .padding(5)
                            .background(Capsule().fill(Color("Secondary")))
                            HStack {
                                Text(play.result.description)
                                    .font(.body)
                                    .lineLimit(.none)
                                    .multilineTextAlignment(.leading)
                                Spacer()
                            }
                            .padding(.horizontal)
                            .foregroundColor(Color("Primary"))
                            Divider()
                                .background(Color("Secondary"))
                        }
                        .padding(2)
                    }
                    
                }
                .navigationBarTitle("Plays", displayMode: .inline)
                .navigationBarItems(
                    trailing:
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Text("Done")
                        }
                )
            }
        } // NavigationView
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct SummaryPlaysView_Previews: PreviewProvider {
    static var previews: some View {
        let gameStore = GameStore(gameLink: domainUrl + "/api/v1/game/2019020968/feed/live")
        
        return SummaryPlaysView(forPeriod: 1).environmentObject(gameStore)
    }
}
