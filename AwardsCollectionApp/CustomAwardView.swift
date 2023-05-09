//
//  CustomAwardView.swift
//  AwardsCollectionApp
//
//  Created by Gleb Gunin on 09.05.2023.
//

import SwiftUI

struct CustomAwardView: View {
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            let size = min(width, height)
            let middle = size / 2
            let halfMiddle = middle / 2
            let nearLine = size * 0.1
            let farLine = size * 0.9
            
            Path { path in
                path.addArc(
                    center: CGPoint(x: 200, y: 200),
                    radius: middle,
                    startAngle: .degrees(270),
                    endAngle: .degrees(180),
                    clockwise: true
                )
            }
            .stroke(Color.mint, lineWidth: 10)
            
            Path { path in
                path.addArc(
                    center: CGPoint(x: 0, y: 200),
                    radius: middle,
                    startAngle: .degrees(0),
                    endAngle: .degrees(270),
                    clockwise: true
                )
            }
            .stroke(Color.yellow, lineWidth: 10)
            
            Path { path in
                path.move(to: CGPoint(x: middle, y: halfMiddle))
                path.addQuadCurve(
                    to: CGPoint(x: middle, y: farLine),
                    control: CGPoint(x: nearLine, y: 0)
                )
                path.addQuadCurve(
                    to: CGPoint(x: middle, y: farLine),
                    control: CGPoint(x: nearLine, y: 0)
                )
            }
            .fill(
                Gradient(colors: [.red, .orange])
            )
            
            Path { path in
                path.move(to: CGPoint(x: middle, y: halfMiddle))
                path.addQuadCurve(
                    to: CGPoint(x: middle, y: farLine),
                    control: CGPoint(x: farLine, y: 0)
                )
            }
            .fill(
                Gradient(colors: [.red, .orange])
            )
            
            Path { path in
                path.addArc(
                    center: CGPoint(x: 0, y: 0),
                    radius: middle,
                    startAngle: .degrees(90),
                    endAngle: .degrees(0),
                    clockwise: true
                )
            }
            .stroke(Color.purple, lineWidth: 10)

            Path { path in
                path.addArc(
                    center: CGPoint(x: 200, y: 0),
                    radius: middle,
                    startAngle: .degrees(180),
                    endAngle: .degrees(90),
                    clockwise: true
                )
            }
            .stroke(Color.blue, lineWidth: 10)
        }
    }
}

struct CustomAwardView_Previews: PreviewProvider {
    static var previews: some View {
        CustomAwardView()
            .frame(width: 200, height: 200)
    }
}
