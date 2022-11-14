//
//  CuriosityView.swift
//  appcentassignmentswift
//
//  Created by Ahmet Buğra Özcan on 11.11.2022.
//

import SwiftUI
import Kingfisher

struct CuriosityView: View {
    @EnvironmentObject var viewModel: CuriosityViewModel
    @State var isPopoverForRoverOpen = false
  
    var body: some View {
        CuriosityBody()
    }
   

}

struct CuriosityView_Previews: PreviewProvider {
    static var previews: some View {
        CuriosityView().environmentObject(CuriosityViewModel())
    }
}
