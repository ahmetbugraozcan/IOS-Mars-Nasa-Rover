//
//  ViewDidLoadModifier.swift
//  appcentassignmentswift
//
//  Created by Ahmet Buğra Özcan on 12.11.2022.
//

import Foundation
import SwiftUI

struct ViewDidLoadModifier: ViewModifier {
    @State private var didLoad = false
    
    private let action: (() -> Void)?
    
    init(perform action: (() -> Void)? = nil){
        self.action = action
    }
    
    func body(content: Content) -> some View {
        content.onAppear{
            if didLoad == false {
                didLoad = true
                action?()
            }
        }
    }
}
