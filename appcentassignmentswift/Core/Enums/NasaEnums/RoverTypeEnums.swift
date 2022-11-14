//
//  NasaRequestEnums.swift
//  appcentassignmentswift
//
//  Created by Ahmet Buğra Özcan on 11.11.2022.
//

import Foundation

enum RoverTypeEnums: String {
    case curiosity = "curiosity"
    case spirit = "spirit"
    case opportunity = "opportunity"
  
}


extension RoverTypeEnums {
    static func getCameraEnums(value: RoverTypeEnums) -> [RoverCameraEnums]{
        switch value {
        case .curiosity:
            return [RoverCameraEnums.FHAZ, RoverCameraEnums.RHAZ, RoverCameraEnums.MAST, RoverCameraEnums.MAHLI, RoverCameraEnums.CHEMCAM, RoverCameraEnums.MARDI,RoverCameraEnums.NAVCAM]
        case .spirit:
            return [RoverCameraEnums.FHAZ, RoverCameraEnums.RHAZ, RoverCameraEnums.NAVCAM, RoverCameraEnums.PANCAM, RoverCameraEnums.MINITES]
        case .opportunity:
            return [
                RoverCameraEnums.FHAZ, RoverCameraEnums.RHAZ, RoverCameraEnums.NAVCAM, RoverCameraEnums.PANCAM, RoverCameraEnums.MINITES]
            
        }
    }
}
