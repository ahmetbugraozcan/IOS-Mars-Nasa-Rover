//
//  SpiritView.swift
//  appcentassignmentswift
//
//  Created by Ahmet Buğra Özcan on 11.11.2022.
//

import SwiftUI

struct SpiritView: View {
    @EnvironmentObject var viewModel: SpiritViewModel
    
    var body: some View {
        SpiritBody()
    }
}

struct SpiritView_Previews: PreviewProvider {
    static var previews: some View {
        SpiritView()
    }
}
