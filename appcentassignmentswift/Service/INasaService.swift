//
//  INasaService.swift
//  appcentassignmentswift
//
//  Created by Ahmet Buğra Özcan on 11.11.2022.
//

import Foundation

protocol INasaService {
    func fetchRovers(roverType: RoverTypeEnums,page: Int) async throws -> [PhotoModel?]?
    
    func filterRoverCameras(roverType: RoverTypeEnums, page: Int, roverCameraType: RoverCameraEnums) async throws -> [PhotoModel?]?
}
