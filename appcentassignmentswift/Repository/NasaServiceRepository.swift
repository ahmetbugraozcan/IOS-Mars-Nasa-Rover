//
//  NasaServiceRepository.swift
//  appcentassignmentswift
//
//  Created by Ahmet Buğra Özcan on 11.11.2022.
//

import Foundation


class NasaServiceRepository: INasaService {
    var nasaService: NasaService = NasaService.instance
    static let instance = NasaServiceRepository()
    private init(){
        
    }
    
    
    func fetchRovers(roverType: RoverTypeEnums, page: Int) async throws -> [PhotoModel?]? {
        return try await nasaService.fetchRovers(roverType: roverType, page: page)
    }
    
    func filterRoverCameras(roverType: RoverTypeEnums, page: Int, roverCameraType: RoverCameraEnums) async throws -> [PhotoModel?]? {
        return try await nasaService.filterRoverCameras(roverType: roverType, page: page, roverCameraType: roverCameraType)
    }
    
    
    
}
