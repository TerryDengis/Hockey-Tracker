//
//  ChevronView.swift
//  Hockey Tracker
//
//  Created by Terry Dengis on 9/19/20.
//

import SwiftUI

struct ChevronView: View {
    @EnvironmentObject var gameStore: GameStore
    var play: GameSummary.LiveData.Plays.Play
    var displayWidth: CGFloat
    
    @State private var showPlayDetails = false
    
    var body: some View {
        Group {
            EventView(play: play, displayWidth: displayWidth, showPlayDetails: $showPlayDetails)
                .sheet(isPresented: $showPlayDetails) {
                    PlayDetailView(play:play).environmentObject(gameStore)
                        //.frame(width: 500, height: 600)
            }
        }

        .transition(AnyTransition.asymmetric(
                        insertion: .slide,
                        removal: .slide))
        .animation(.easeInOut(duration: 1))
    }
}

//struct ChevronView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChevronView(scaleFactor: Binding.constant(4.0))
//    }
//}

struct EventView: View {
    @EnvironmentObject var gameStore: GameStore
    var play: GameSummary.LiveData.Plays.Play
    var displayWidth: CGFloat
    @Binding var showPlayDetails: Bool

    @State private var rotation = 0.0
    @State private var scale: CGFloat = 1.0
    
    var body: some View {
        VStack {
            Image(systemName: gameStore.eventImageFor(play))
                .font(.system(size: chevronFont , weight:.bold))
                .foregroundColor(Color(gameStore.teamColor(play.teamCode())))
                .onTapGesture {
                    self.showPlayDetails.toggle()
                }
                .rotationEffect(.degrees(play.isGoal() ? rotation : 0))
                .animation( Animation.linear(duration: 2).repeatForever(autoreverses: false))
                .scaleEffect(play.isGoal() ? scale : 1.0)
                //.animation( Animation.linear(duration: 2).repeatForever(autoreverses: true))
                .onAppear {
                    self.rotation = 360
                    scale = 1.5
                }
                .position(x: play.xCoordinate() * (displayWidth / rinkWidth), y: play.yCoordinate() * (displayWidth / rinkWidth))
        }
    }
    
    var chevronFont: CGFloat {
        if displayWidth/rinkWidth < 3.0 {
            return 10
        } else if displayWidth/rinkWidth < 4.10 {
            return 15
        } else {
            return 20
        }
        
    }
}
