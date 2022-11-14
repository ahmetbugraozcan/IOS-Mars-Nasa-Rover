//
//  SplashView.swift
//  appcentassignmentswift
//
//  Created by Ahmet Buğra Özcan on 14.11.2022.
//

import SwiftUI

struct SplashView: View {
    @State var isActive: Bool = true
    var body: some View {
        GeometryReader{ geometry in
            VStack(spacing: 0){
                if(isActive){
                    Spacer()
                    LottieView(lottieFile: LottieEnum.marsrover.rawValue, animationSpeed: 3).frame(height: geometry.size.height / 3)
                    Text("MARS ROVER PHOTOS").font(.title)
                    Text("Explore Mars rover photos...").font(.footnote)
                    Spacer()
                } else {
                    CustomTabView()
                }
            }
        }.onAppear {

            DispatchQueue.main.asyncAfter(deadline: .now() + 2.3) {
                withAnimation {
                    self.isActive = false
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
