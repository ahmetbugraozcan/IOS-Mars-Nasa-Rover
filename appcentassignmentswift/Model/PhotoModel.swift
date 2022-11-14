// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let roverModel = try? newJSONDecoder().decode(RoverModel.self, from: jsonData)

import Foundation


struct PhotoModel: Identifiable ,Codable {
    
    let id, sol: Int?
    let camera: Camera?
    let imgSrc: String?
    let earthDate: String?
    let rover: Rover?

    enum CodingKeys: String, CodingKey {
        case id, sol, camera
        case imgSrc = "img_src"
        case earthDate = "earth_date"
        case rover
    }
}

// MARK: - Camera
struct Camera: Codable {
    let id: Int?
    let name: String?
    let roverID: Int?
    let fullName: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case roverID = "rover_id"
        case fullName = "full_name"
    }
}

// MARK: - Rover
struct Rover: Codable {
    let id: Int?
    let name, landingDate, launchDate, status: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case landingDate = "landing_date"
        case launchDate = "launch_date"
        case status
    }
}

extension PhotoModel {
    static var sampleItem: PhotoModel = PhotoModel(id: 102693, sol: 1000, camera: Camera(id: 20, name: "FHAZ", roverID: 5, fullName: "Front Hazard Avoidance Camera"), imgSrc: "http://mars.jpl.nasa.gov/msl-raw-images/proj/msl/redops/ods/surface/sol/01000/opgs/edr/fcam/FLB_486265257EDR_F0481570FHAZ00323M_.JPG", earthDate: "2015-05-30", rover: Rover(
        id: 5, name: "Curiosity", landingDate: "2012-08-06", launchDate: "2011-11-26", status: "active"
    ))
}
