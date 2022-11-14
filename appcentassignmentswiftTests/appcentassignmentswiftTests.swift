//
//  appcentassignmentswiftTests.swift
//  appcentassignmentswiftTests
//
//  Created by Ahmet Buğra Özcan on 10.11.2022.
//

import XCTest
@testable import appcentassignmentswift

final class appcentassignmentswiftTests: XCTestCase {
   
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
   
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() async throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
       await test_fetchRovers()
        await test_filterRoverCameras()
        
        
    }
    
    func test_fetchRovers() async {
        do{
            let nasaService = NasaServiceRepository.instance
            let response = try await nasaService.fetchRovers(roverType: RoverTypeEnums.spirit, page: 1)
            print("test_fetchRovers RESPONSE COUNT IS : \(response?.count ?? 0)")
            XCTAssert(response != nil, "Response is null")
        } catch{
            print("test_fetchRovers ERROR \(error)")
            XCTAssert(false, "test_fetchRovers ERROR \(error)")
        }
        
    }
    
    func test_filterRoverCameras() async {
        do{
            let nasaService = NasaServiceRepository.instance
            let response = try await nasaService.filterRoverCameras(roverType: RoverTypeEnums.curiosity, page: 1, roverCameraType: RoverCameraEnums.FHAZ)
            
            print("test_filterRoverCameras RESPONSE COUNT IS : \(response?.count ?? 0)")
            XCTAssert(response != nil, "Response is null : \(String(describing: response))")
        } catch{
            print("test_filterRoverCameras ERROR \(error)")
            
        }

    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
