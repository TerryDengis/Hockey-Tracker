//
//  HeaderComponent.swift
//  Honeymoon
//
//  Created by Terry Dengis on 10/12/20.
//

import SwiftUI

struct HeaderComponent: View {
    var body: some View {
        VStack (alignment: .center, spacing: 20) {
            Capsule()
                .frame(width: 120, height: 6)
                .foregroundColor(Color("Primary"))
                .opacity(0.2)
            Image("NHL-Logo")
                .resizable()
                .scaledToFit()
                .frame(height:100)
        }
    }
}

struct HeaderComponent_Previews: PreviewProvider {
    static var previews: some View {
        HeaderComponent()
            .previewLayout(.fixed(width: 375, height: 128))
    }
}
