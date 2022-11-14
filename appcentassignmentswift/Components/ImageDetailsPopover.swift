//
//  ImageDetailsPopover.swift
//  appcentassignmentswift
//
//  Created by Ahmet Buğra Özcan on 13.11.2022.
//

import SwiftUI

struct ImageDetailsPopover: View {
    var selectedItem: PhotoModel?
    var geometry: GeometryProxy
    var body: some View {
    
            VStack(spacing: 0) {
                
                NasaImageContainer(item:selectedItem, height: geometry.size.height / 2)
                ScrollView{
                    VStack(alignment: .leading){
                        Text("Image Details")
                            .font(.title)
                            .fontWeight(.semibold).frame(maxWidth: .infinity)
                        Divider()
                        Group{
                            Text("Date Info:")
                                .font(.headline)
                            
                            
                            Text("Launch Date: \(selectedItem!.rover?.launchDate ?? "Unknown")")
                            Text("Landing Date: \(selectedItem!.rover?.landingDate ?? "Unknown")")
                            Text("Earth Date: \(selectedItem!.earthDate?.description ?? "Unknown")")
                            Divider()
                        }
                        Group{
                            Text("Rover Details")
                                .font(.headline)
                            Text("Rover Name: \(selectedItem!.rover?.name ?? "Unknown")")
                            Text("Rover Status: \(selectedItem!.rover?.status ?? "Unknown")")
                            Divider()
                        }
                        Group{
                            Text("Camera Details")
                                .font(.headline)
                            Text("Camera Name: \(selectedItem!.camera?.name ?? "Unknown")")
                        }
                        
                    }.frame(maxWidth: .infinity, maxHeight: geometry.size.height / 2,
                            alignment: .top).padding(.all)
                    
                
            }
            
        }
    }
}

struct ImageDetailsPopover_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader{ geometry in
            ImageDetailsPopover(selectedItem: PhotoModel.sampleItem, geometry: geometry)
        }
    }
}
