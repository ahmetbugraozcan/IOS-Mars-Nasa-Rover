//
//  OpportunityView.swift
//  appcentassignmentswift
//
//  Created by Ahmet Buğra Özcan on 11.11.2022.
//

import SwiftUI

struct OpportunityView: View {
  
        @EnvironmentObject var viewModel: OpportunityViewModel

    var body: some View {
        OpportunityBody()
    }
}

struct OpportunityView_Previews: PreviewProvider {
    static var previews: some View {
        OpportunityView()
    }
}
