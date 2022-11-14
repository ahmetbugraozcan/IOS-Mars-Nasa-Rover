//
//  FancyToastModel.swift
//  appcentassignmentswift
//
//  Created by Ahmet Buğra Özcan on 13.11.2022.
//

struct FancyToast: Equatable {
    var type: FancyToastStyle
    var title: String
    var message: String
    var duration: Double = 3
}
