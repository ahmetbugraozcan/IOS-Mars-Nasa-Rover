//
//  TabView.swift
//  appcentassignmentswift
//
//  Created by Ahmet Buğra Özcan on 11.11.2022.
//

import SwiftUI

struct CustomTabView: View {
    @State var selectedIndex: Int = 0
    @StateObject var curiosityViewModel: CuriosityViewModel = CuriosityViewModel()
    @StateObject var spiritViewModel: SpiritViewModel = SpiritViewModel()
    @StateObject var opportunityViewModel: OpportunityViewModel = OpportunityViewModel()
    
    var body: some View {
        VStack {
            TabView(selection: $selectedIndex) {
                CuriosityView().tabItem {
                    Image(systemName: "antenna.radiowaves.left.and.right")
                    Text("Curiosity") }.tag(0).environmentObject(curiosityViewModel)
                
                OpportunityView().tabItem{
                    Image(systemName: "antenna.radiowaves.left.and.right")
                    Text("Opportunity")
                }.tag(1).environmentObject(opportunityViewModel)
                
           
                
                SpiritView().tabItem{
                    Image(systemName: "antenna.radiowaves.left.and.right")
                    Text("Spirit")
                }.tag(2).environmentObject(spiritViewModel)
            }
        }
            
        
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView()
    }
}
