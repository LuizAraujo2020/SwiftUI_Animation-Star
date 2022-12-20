//
//  CuteStarView.swift
//  SwiftUI_Animation-Star
//
//  Created by Luiz Araujo on 20/12/22.
//

import SwiftUI

struct CuteStarView: View {
    
    // MARK:- variables
    let animationDuration: Double = 0.25
    
    @State var isAnimating: Bool = false
    @State var shrinkIcon: Bool = false
    @State var floatLike: Bool = false
    @State var showFlare: Bool = false
    
    
    var body: some View {
//        ZStack {
//            StarShape()
//                .fill(.cyan)
//                .frame(width: 300)
//
//            StarShape()
//                .overlay(path.stroke(Color.black, lineWidth: 2))
//        }
        ZStack {
            if (floatLike) {
                CapusuleGroupView(isAnimating: $floatLike)
                    .offset(y: -130)
                    .scaleEffect(self.showFlare ? 1.75 : 0.5)
                    .opacity(self.floatLike ? 1 : 0)
                    .animation(Animation.spring().delay(animationDuration / 2))
            }
            
            StarShape()
                .stroke(Color.orange, lineWidth: 50)
            
            Color.yellow
                .clipShape(StarShape())
        }   .padding()
            .onAppear {
                if (!floatLike) {
                    self.floatLike.toggle()
                    self.isAnimating.toggle()
                    self.shrinkIcon.toggle()
                    Timer.scheduledTimer(withTimeInterval: animationDuration, repeats: false) { _ in
                        self.shrinkIcon.toggle()
                        self.showFlare.toggle()
                    }
                } else {
                    self.isAnimating = false
                    self.shrinkIcon = false
                    self.showFlare = false
                    self.floatLike = false
                }
            }
    }
}

struct CuteStarView_Previews: PreviewProvider {
    static var previews: some View {
        CuteStarView()
    }
}
