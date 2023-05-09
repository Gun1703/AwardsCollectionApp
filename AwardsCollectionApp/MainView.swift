//
//  MainView.swift
//  AwardsCollectionApp
//
//  Created by Alexey Efimov on 17.06.2021.
//

import SwiftUI

struct MainView: View {
    @State private var awardIsShowing = false
    
    var body: some View {
        VStack {
            Button(action: buttonAction) {
                Text(awardIsShowing ? "Hide Award" : "Show Award")
                Spacer()
                Image(systemName: "chevron.up.square")
                    .scaleEffect(awardIsShowing ? 2 : 1)
                    .rotationEffect(.degrees(awardIsShowing ? 0 : 180))
            }
            
            Spacer()
            if awardIsShowing {
                CustomAwardView()
                    .frame(width: 200, height: 200)
                    .transition(.leadingSlide)
            }
            
            Spacer()
        }
        .font(.headline)
        .padding()
    }
    
    private func buttonAction() {
        withAnimation {
            awardIsShowing.toggle()
        }
    }
}

extension AnyTransition {
    static var leadingSlide: AnyTransition {
        let insertion = AnyTransition.move(edge: .top)
            .combined(with: .slide)
        let removal = AnyTransition.move(edge: .bottom)
            .combined(with: .offset(CGSize(width: 200, height: 0)))
        
        return .asymmetric(insertion: insertion, removal: removal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
