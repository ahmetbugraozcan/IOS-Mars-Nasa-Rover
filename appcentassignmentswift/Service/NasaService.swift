//
//  NasaService.swift
//  appcentassignmentswift
//
//  Created by Ahmet Buğra Özcan on 11.11.2022.
//

import Foundation
import Alamofire

class NasaService: INasaService {
    
    static let instance: NasaService = NasaService()
    
   private init() {
        
    }
    
    func filterRoverCameras(roverType: RoverTypeEnums, page: Int, roverCameraType: RoverCameraEnums) async throws -> [PhotoModel?]?{
        
        let requestUrl: String = "\(AppConstants.instance.baseUrl)/\(roverType.rawValue)/photos?sol=1000&api_key=\(AppConstants.instance.apiKey ?? "")&page=\(page)&camera=\(roverCameraType.rawValue)"
        
        let request = AF.request(requestUrl)
        
        let responseData = try await request.serializingDecodable(NasaMarsPhotosResponseModel.self).response
        
        if(responseData.error != nil){
            throw responseData.error!
        }
        
        if(responseData.value != nil){
            return responseData.value!.photos
        }
        
        return nil;
    }
    
    func fetchRovers(roverType: RoverTypeEnums, page: Int) async throws -> [PhotoModel?]? {
   
        let requestUrl: String = "\(AppConstants.instance.baseUrl)/\(roverType.rawValue)/photos?sol=1000&api_key=\(AppConstants.instance.apiKey ?? "")&page=\(page)"
        
     
        let request = AF.request(requestUrl)
        
        try request.validate()
        let responseData = try await request.serializingDecodable(NasaMarsPhotosResponseModel.self).response
        

        if(responseData.error != nil){
            throw responseData.error!
        }
        
        if(responseData.value != nil){
            return responseData.value!.photos
        }
        
        return nil;
        
 
       
    }
    
    
}
