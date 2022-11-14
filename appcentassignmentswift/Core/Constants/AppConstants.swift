//
//  AppConstants.swift
//  appcentassignmentswift
//
//  Created by Ahmet Buğra Özcan on 11.11.2022.
//

import Foundation



struct AppConstants {

    
    static let instance: AppConstants = AppConstants()
    
    private init(){
        // API KEY'i ilgili dosyadan getiren kod
        if let path = Bundle.main.path(forResource: "keys", ofType: "plist"){
            if let dict = NSDictionary(contentsOfFile: path) as? [String: AnyObject] {
                let key = dict["API_KEY"] as? String
                if(key == nil || key!.isEmpty){
                    apiKey = "DEMO_KEY"
                } else {
                    apiKey = dict["API_KEY"] as? String
                }
               
                
            }
        }
    }
    
     var baseUrl: String = "https://api.nasa.gov/mars-photos/api/v1/rovers"
     var imageNotFoundURL: String = "https://via.placeholder.com/150"
     var apiKey: String? = nil
     var paginationCount:Int = 25    
    
    
}
