//
//  RinkView.swift
//  Hockey Tracker
//
//  Created by Terry Dengis on 9/16/20.
//

import SwiftUI

struct RinkView: View {
    @StateObject var gameStore: GameStore
    
    @AppStorage ("showGoals") var showGoals: Bool?
    @AppStorage ("showShots") var showShots: Bool?
    @AppStorage ("showMissedShots") var showMissedShots: Bool?
    @AppStorage ("showBlockedShots") var showBlockedShots: Bool?
    
    @State private var currentPeriod: Int = 0
    @State private var showSettings: Bool = false
    @State private var showPlays: Bool = false
    
    let orientationChanged = NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)
        .makeConnectable()
        .autoconnect()
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color("Background")
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    PeriodView(currentPeriod: $currentPeriod).environmentObject(gameStore)
                        .padding(.top)
                    ScrollView(.vertical) {
                        ZStack {
                            Image("Rink")
                                .resizable()
                                .scaledToFit()
                            let plays = gameStore.playsForPeriod(currentPeriod)
                            ForEach(plays, id: \.id) { play in
                                ChevronView(play: play, displayWidth: geometry.size.width).environmentObject(gameStore)
                            }
                            .zIndex(1)
                        }
                        HStack {
                            VStack(alignment: .leading) {
                                SummaryShotsView()
                                    .environmentObject(gameStore)
                                    .padding(.bottom, 5)
                                SummaryGoalView()
                                    .environmentObject(gameStore)
                                    .padding(.bottom, 5)
                            }
                            .foregroundColor(Color("Primary"))
                            Spacer()
                        }
                        Spacer()
                    } // ScrollView
                    .navigationBarTitle(Text ("\(gameStore.awayTeam) \(gameStore.awayScore) at \(gameStore.homeTeam) \(gameStore.homeScore) \(gameStore.gameStatus)"))
                    .navigationBarItems (
                        leading: Image(systemName: "play")
                            .imageScale(.large)
                            .foregroundColor(.blue)
                            .onTapGesture {
                                self.showPlays.toggle()
                            }
                            .popover(isPresented: $showPlays) {
                                SummaryPlaysView(forPeriod: currentPeriod)
                                    .environmentObject(gameStore)
                            },
                        trailing:
                            Image(systemName: "gear")
                            .imageScale(.large)
                            .foregroundColor(.blue)
                            .onTapGesture {
                                self.showSettings.toggle()
                            }
                            .popover(isPresented: $showSettings) {
                                SettingsView().environmentObject(gameStore)
                                    .frame(width: 350, height: 300)
                            }
                    )
                    .onAppear {
                        if showGoals == nil {
                            showGoals = true
                        }
                        if showShots == nil {
                            showShots = false
                        }
                        if showMissedShots == nil {
                            showMissedShots = false
                        }
                        if showBlockedShots == nil {
                            showBlockedShots = false
                        }
                        gameStore.fetchGameData()
                }
                }
            }
        } // Geometry
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RinkView(gameStore: GameStore(gameLink: domainUrl + "/api/v1/game/2019021011/feed/live"))
        }
    }
}
