//
//  LottieWithMessage.swift
//  appcentassignmentswift
//
//  Created by Ahmet Buğra Özcan on 13.11.2022.
//

import SwiftUI

struct LottieWithMessage: View {
    var lottieEnum: LottieEnum
    var message: String
    var height: CGFloat
    
    var body: some View {
        VStack {
            LottieView(lottieFile: lottieEnum.rawValue)
                .frame(height: height)
            Text(message)
                .font(.title)
        }
    }
}

struct LottieWithMessage_Previews: PreviewProvider {
    static var previews: some View {
        LottieWithMessage(
            lottieEnum: LottieEnum.notfound, message: "No data found", height: 300
        )
    }
}
