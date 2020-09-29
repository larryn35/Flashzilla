//
//  CardView.swift
//  Flashzilla
//
//  Created by Larry Nguyen on 9/28/20.
//

import SwiftUI

struct CardView: View {
    @State private var isShowingAnswer = false
    let card: Card
    
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                .fill(Color.white)
                .shadow(radius: 10)
            
            VStack {
                Text(card.prompt)
                    .font(.largeTitle)
                    .foregroundColor(.black)
                
                if isShowingAnswer {
                    Text(card.answer)
                        .font(.title)
                        .foregroundColor(.gray)
                }
            }
            .padding(20)
            .multilineTextAlignment(.center)
        }
        .frame(width: 250, height: 250)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card.example)
    }
}
