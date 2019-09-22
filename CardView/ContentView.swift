//
//  ContentView.swift
//  CardView
//
//  Created by LiYong on 22.09.19.
//  Copyright © 2019 Liyong. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var show = false
    @State var viewPosition = CGSize.zero
    
    var body: some View {
        ZStack(){
            
            CardView(imageName: "charleyrivers")
                .cornerRadius(10)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -400 : -60)
                .scaleEffect(0.8)
                .rotationEffect(Angle(degrees: show ? 15 : 0))
                .animation(.easeInOut(duration: 0.4))
                .offset(x: viewPosition.width, y: viewPosition.height)
            
            CardView(imageName: "hiddenlake")
                .cornerRadius(10)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -200 : -30)
                .scaleEffect(0.9)
                .rotationEffect(Angle(degrees: show ? 10 : 0))
                .animation(.easeInOut(duration: 0.3))
                .offset(x: viewPosition.width, y: viewPosition.height)
            
            CardView(imageName: "stmarylake")
                .cornerRadius(10)
                .shadow(radius: 20)
                .offset(x: viewPosition.width, y: viewPosition.height)
                .scaleEffect(1.0)
                .rotationEffect(Angle(degrees: show ? 5 : 0))
                .animation(.easeInOut(duration: 0.2))
                .onTapGesture {
                    self.show.toggle()
            }
            .gesture(
                DragGesture()
                    .onChanged { value in
                        self.viewPosition = value.translation
                        self.show = true
                }
                .onEnded { _ in
                    self.viewPosition = CGSize.zero
                    self.show = false
                }
            )
            
            
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif


struct CardView: View {
    
    var imageName:String
    
    var body: some View {
        return VStack {
             Image(imageName).resizable()
                           .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        }
        .frame(width: 340.0, height: 220.0)
    }
}



