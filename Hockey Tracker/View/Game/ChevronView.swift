//
//  ChevronView.swift
//  Hockey Tracker
//
//  Created by Terry Dengis on 9/19/20.
//

import SwiftUI

struct ChevronView: View {
    @ObservedObject var gameVM: GameVM
    @State private var showPlayDetails = false
    @State private var tappedPlay:GameSummary.LiveData.Plays.Play?
    
    var period: Int
    var scaleFactor: CGFloat
    
    var body: some View {
        let plays = gameVM.playsForPeriod(period)
        
        ForEach(plays, id: \.id) { play in
            Image(systemName: gameVM.eventImageFor(play))
                .position(x: gameVM.xCoordinateFor(play) * scaleFactor, y: gameVM.yCoordinateFor(play) * scaleFactor)
                .font(.system(size: chevronFont + (gameVM.isGoal(play) ? 5: 0), weight: .bold))
                .foregroundColor(Color(gameVM.teamColorFor(play)))

                .onTapGesture {
                    self.tappedPlay = play
                    self.showPlayDetails.toggle()
                }
                .popover(isPresented: $showPlayDetails) {
                    PlayDetailView(gameVM: gameVM, play: tappedPlay!)
                }
                .transition(.asymmetric (
                                insertion: AnyTransition.scale.animation(.linear(duration:2)),
                                removal: AnyTransition.scale.animation(.easeInOut(duration:2)
                                )))
//                .rotationEffect(.degrees(gameVM.isGoal(play) ? 360 : 0))
//                .animation(gameVM.isGoal(play) ? Animation.linear(duration: 1).repeatForever(autoreverses: false) : .default)

        }
    }
    var chevronFont: CGFloat {
        if scaleFactor < 3.0 {
            return 10
        } else if scaleFactor < 4.10 {
            return 15
        } else {
            return 20
        }

    }
}

//struct ChevronView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChevronView(scaleFactor: Binding.constant(4.0))
//    }
//}
