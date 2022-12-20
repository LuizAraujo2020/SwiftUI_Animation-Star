//
//  ContentView.swift
//  SwiftUI_Animation-Star
//
//  Created by Luiz Araujo on 20/12/22.
//
// Resources:
// https://stackoverflow.com/questions/63650216/how-to-create-a-swiftui-roundedstar-shape
// https://github.com/Shubham0812/SwiftUI-Animations

import SwiftUI

struct ContentView: View {
    // MARK:- variables
    @State var resetStrokes: Bool   = true
    @State var strokeStart: CGFloat = 0
    @State var strokeEnd: CGFloat   = 0
    @State var animationEnded: Bool = false
    
    // MARK:- views
    var body: some View {
        if animationEnded {
            ZStack {
//                Color.black
//                    .edgesIgnoringSafeArea(.all)
//                StarShape()
//                    .fill(.yellow)
                CuteStarView()
            }
//            .frame(width: 300, height: 300)
        } else {
            ZStack {
//                Color.black
//                    .edgesIgnoringSafeArea(.all)
                StarShape()
                    .stroke(style: StrokeStyle(lineWidth: 2.5, lineCap: .round, lineJoin: .round, miterLimit: 5))
                    .foregroundColor(Color.white)
                    .opacity(0.0)
                
                StarShape()
                    .trim(from: strokeStart, to: strokeEnd)
                    .stroke(style: StrokeStyle(lineWidth: 40, lineCap: .round, lineJoin: .round, miterLimit: 10))
                    .foregroundColor(Color.orange)
                    .onAppear() {
                        var counter = 0
                        Timer.scheduledTimer(withTimeInterval: 0.35, repeats: true) { timer in
                            if (self.strokeEnd >= 1) {
                                if (self.resetStrokes) {
                                    Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { _ in
                                        self.strokeEnd = 0
                                        self.strokeStart = 0
                                        self.resetStrokes.toggle()
                                    }
                                    self.resetStrokes = false
                                }
                            }
                            counter += 1
                            withAnimation(Animation.easeOut(duration: 0.5)) {
                                self.strokeEnd += 0.1
                                self.strokeStart = self.strokeEnd - 1.5
                                
                                // Gets the end of the animation
                                if (counter == 11) {
                                    print("ACABIOU")
                                    animationEnded = true
                                }
                            }
                        }
                    }
                VStack{
                    Spacer()
                    HStack {
                        Spacer()
                        Text("@Shubham_iosdev")
                            .foregroundColor(.white)
                            .font(.system(size: 28, weight: .medium, design: .monospaced))
                            .opacity(0.3)
                    }.padding(.trailing, 16)
                }
            }
//            .frame(width: 300, height: 300)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
