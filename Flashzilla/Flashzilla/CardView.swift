//
//  CardView.swift
//  Flashzilla
//
//  Created by Larry Nguyen on 9/28/20.
//

import SwiftUI

struct CardView: View {
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @Environment(\.accessibilityEnabled) var accessibilityEnabled
    @State private var isShowingAnswer = false
    @State private var offset = CGSize.zero
    
    let card: Card
    var removal: (() -> Void)? = nil
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                .fill(
                    differentiateWithoutColor
                        ? Color.white
                        : Color.white
                        .opacity(1 - Double(abs(offset.width / 50)))
                )
                
                .background(
                    differentiateWithoutColor
                        ? nil
                        : RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                        .fill(offset.width > 0 ? Color.green : Color.red)
                )
                .shadow(radius: 10)
            
            VStack {
                if accessibilityEnabled {
                    Text(isShowingAnswer ? card.answer : card.prompt)
                        .font(.largeTitle)
                        .foregroundColor(.black)
                } else {
                    
                    Text(card.prompt)
                        .font(.largeTitle)
                        .foregroundColor(.black)
                    
                    if isShowingAnswer {
                        Text(card.answer)
                            .font(.title)
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding(20)
            .multilineTextAlignment(.center)
        }
        .frame(width: 450, height: 250)
        .rotationEffect(.degrees((Double(offset.width / 5))))
        .offset(x: offset.width * 5, y: 0)
        .opacity(2 - Double(abs(offset.width / 50)))
        .accessibility(addTraits: .isButton)
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    self.offset = gesture.translation
                }
                
                .onEnded { _ in
                    if abs(self.offset.width) > 100 {
                        // remove card
                        self.removal?()
                    } else {
                        self.offset = .zero
                    }
                }
        )
        .onTapGesture(count: 2, perform: {
            self.isShowingAnswer.toggle()
        })
        .animation(.spring())
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card.example)
    }
}
