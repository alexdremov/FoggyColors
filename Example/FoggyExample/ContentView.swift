//
//  ContentView.swift
//  FoggyExample
//
//  Created by Alex Dremov on 10.02.2022.
//

import SwiftUI
import FoggyColors

struct ContentView: View {
    @State var started: Bool = false
    var body: some View {
        if !started {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text("FoggyColors.")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.indigo)
                    .padding(.bottom, 3)
                Text("Beautiful randomly generated colored shapes on the background.")
                    .font(.title2)
                    .fontWeight(.light)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.leading)
                    .opacity(0.8)
            }
            .padding()
            Spacer()
        }
            .frame(width: 330, height: 530, alignment: .center)
            .background(FoggyColorsView())
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20).stroke(.indigo, lineWidth: 7)
            )
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    started = true
                }
            }
        } else {
            FoggyColorsView(
            blurRadius: 64,
            globalOpacity: 0.8,
            elementOpacity: 0.4,
            animated: true,
            numberShapes: 15
            )
                .ignoresSafeArea()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
