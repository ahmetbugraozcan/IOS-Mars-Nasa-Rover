//
//  NasaImageContainer.swift
//  appcentassignmentswift
//
//  Created by Ahmet Buğra Özcan on 12.11.2022.
//

import SwiftUI
import Kingfisher

struct NasaImageContainer: View {
    var item: PhotoModel?
    var height: CGFloat?
    var body: some View {
        KFImage(URL(string: item?.imgSrc ?? AppConstants.instance.imageNotFoundURL)).resizable().frame(height: height ?? 200, alignment: .center)
    }
}

struct NasaImageContainer_Previews: PreviewProvider {
    static var previews: some View {
        NasaImageContainer(item: PhotoModel.sampleItem)
    }
}
