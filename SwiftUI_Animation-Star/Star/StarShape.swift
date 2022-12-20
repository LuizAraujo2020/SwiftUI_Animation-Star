//
//  StarShape.swift
//  SwiftUI_Animation-Star
//
//  Created by Luiz Araujo on 20/12/22.
//

import SwiftUI

struct StarShape: Shape {
    
    var cornerRadius: CGFloat = 20
    
    var animatableData: CGFloat {
        get { return cornerRadius }
        set { cornerRadius = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        let r = rect.width / 2
        let rc = cornerRadius
        let rn = r * 0.95 - rc
        
        // start angle at -18 degrees so that it points up
        var cangle = -18.0
        
        for i in 1 ... 5 {
            // compute center point of tip arc
            let cc = CGPoint(x: center.x + rn * CGFloat(cos(Angle(degrees: cangle).radians)), y: center.y + rn * CGFloat(sin(Angle(degrees: cangle).radians)))
            
            // compute tangent point along tip arc
            let p = CGPoint(x: cc.x + rc * CGFloat(cos(Angle(degrees: cangle - 72).radians)), y: cc.y + rc * CGFloat(sin(Angle(degrees: (cangle - 72)).radians)))
            
            if i == 1 {
                path.move(to: p)
            } else {
                path.addLine(to: p)
            }
            
            // add 144 degree arc to draw the corner
            path.addArc(center: cc, radius: rc, startAngle: Angle(degrees: cangle - 72), endAngle: Angle(degrees: cangle + 72), clockwise: false)
            
            // Move 144 degrees to the next point in the star
            cangle += 144
        }
        
        
        //
        cangle = -18.0
        let cc = CGPoint(x: center.x + rn * CGFloat(cos(Angle(degrees: cangle).radians)), y: center.y + rn * CGFloat(sin(Angle(degrees: cangle).radians)))

        let p = CGPoint(x: cc.x + rc * CGFloat(cos(Angle(degrees: cangle - 72).radians)), y: cc.y + rc * CGFloat(sin(Angle(degrees: (cangle - 72)).radians)))

        path.addLine(to: p)
        
        return path
    }
}

//// Draw our star shape in a view
//struct ContentView: View {
//    var body: some View {
//        Star(corners: 5, smoothness: 0.45)
//            .fill(.red)
//            .frame(width: 200, height: 200)
//            .background(.green)
//
//    }
//}

struct StarShape_Previews: PreviewProvider {
    static var previews: some View {
        StarShape()
//            .fill(.red)
//            .frame(width: 200, height: 200)
//            .background(.green)
//            .foregroundColor(.red)
    }
}


struct OctocatShape: Shape {
    
    // MARK:- variables
    
    // MARK:- functions
    func path(in rect: CGRect) -> Path {
        
        let cX: CGFloat = rect.midX
        let cY: CGFloat = rect.midY
        
        var path = Path()
        
        path.move(to: CGPoint(x: cX + 24.07, y: cY + 77.5))
        
        /// right
        path.addLine(to: CGPoint(x: cX + 24.07, y: cY + 52.94))
        path.addLine(to: CGPoint(x: cX + 24.06, y: cY + 53.12))
        path.addCurve(to: CGPoint(x: cX + 18.14, y: cY + 36.4), control1: CGPoint(x: cX + 24.6, y: cY + 46.95), control2: CGPoint(x: cX + 22.44, y: cY + 40.85))
        path.addCurve(to: CGPoint(x: cX + 58.99, y: cY + -8.06), control1: CGPoint(x: cX + 38.04, y: cY + 34.15), control2: CGPoint(x: cX + 58.99, y: cY + 26.6))
        path.addLine(to: CGPoint(x: cX + 58.99, y: cY + -8.06))
        path.addCurve(to: CGPoint(x: cX + 49.3, y: cY + -32.04), control1: CGPoint(x: cX + 58.99, y: cY + -17), control2: CGPoint(x: cX + 55.52, y: cY + -25.6))
        path.addLine(to: CGPoint(x: cX + 49.56, y: cY + -32.1))
        path.addCurve(to: CGPoint(x: cX + 48.72, y: cY + -56.2), control1: CGPoint(x: cX + 52.41, y: cY + -39.94), control2: CGPoint(x: cX + 52.11, y: cY + -48.58))
        path.addCurve(to: CGPoint(x: cX + 24.08, y: cY + -46.4), control1: CGPoint(x: cX + 48.9, y: cY + -55.79), control2: CGPoint(x: cX + 41.41, y: cY + -58.02))
        
        
        path.addLine(to: CGPoint(x: cX + 23.84, y: cY + -46.46))
        
        /// top
        path.addCurve(to: CGPoint(x: cX + -20.12, y: cY + -46.46), control1: CGPoint(x: cX + 9.44, y: cY + -50.32), control2: CGPoint(x: cX + -5.72, y: cY + -50.32))
        
        
        // left
        path.addCurve(to: CGPoint(x: cX + -45.17, y: cY + -55.79), control1: CGPoint(x: cX + -37.69, y: cY + -58.01), control2: CGPoint(x: cX + -45.11, y: cY + -55.79))
        path.addLine(to: CGPoint(x: cX + -45.22, y: cY + -55.69))
        path.addCurve(to: CGPoint(x: cX + -45.64, y: cY + -31.58), control1: CGPoint(x: cX + -48.48, y: cY + -48.01), control2: CGPoint(x: cX + -48.63, y: cY + -39.37))
        path.addLine(to: CGPoint(x: cX + -45.58, y: cY + -32.04))
        path.addCurve(to: CGPoint(x: cX + -55.27, y: cY + -8.05), control1: CGPoint(x: cX + -51.79, y: cY + -25.6), control2: CGPoint(x: cX + -55.27, y: cY + -17))
        path.addCurve(to: CGPoint(x: cX + -14.39, y: cY + 36.56), control1: CGPoint(x: cX + -55.27, y: cY + 26.53), control2: CGPoint(x: cX + -34.32, y: cY + 34.09))
        path.addLine(to: CGPoint(x: cX + -14.4, y: cY + 36.58))
        path.addCurve(to: CGPoint(x: cX + -20.36, y: cY + 52.93), control1: CGPoint(x: cX + -18.62, y: cY + 40.94), control2: CGPoint(x: cX + -20.78, y: cY + 46.88))
        path.addLine(to: CGPoint(x: cX + -20.36, y: cY + 77.5))
        
        
        // tail
        path.move(to: CGPoint(x: cX + -20.36, y: cY + 58.46))
        path.addCurve (to: CGPoint(x: cX + -64.79, y: cY + 39.42), control1: CGPoint(x: cX + -52.09, y: cY + 67.98), control2: CGPoint(x: cX + -52.09, y: cY + 42.59))
        
        
        return path
    }
}

struct OctocatShape_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(.all)
            OctocatShape()
            //                .trim(from: 0, to: 0.2)
                .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round, miterLimit: 8))
                .foregroundColor(Color.white)
        }
    }
}
