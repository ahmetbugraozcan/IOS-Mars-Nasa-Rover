//
//  ViewExtension.swift
//  appcentassignmentswift
//
//  Created by Ahmet Buğra Özcan on 12.11.2022.
//

import Foundation
import SwiftUI

extension View {
    func onLoad(perform action: (() -> Void)? = nil) -> some View {
        modifier(ViewDidLoadModifier(perform: action))
    }
    
    func toastView(toast: Binding<FancyToast?>) -> some View {
        self.modifier(FancyToastModifier(toast: toast))
    }
}
