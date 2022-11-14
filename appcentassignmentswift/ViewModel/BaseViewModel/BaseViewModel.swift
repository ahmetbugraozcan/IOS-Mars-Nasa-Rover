//
//  BaseViewModel.swift
//  appcentassignmentswift
//
//  Created by Ahmet Buğra Özcan on 11.11.2022.
//

import Foundation

protocol BaseViewModel: ObservableObject {
    var paginationPage: Int {get set}
    var filterPaginationPage: Int {get set}
    var isFirstFetchLoading: Bool {get set}
    var isPaginationLoading: Bool {get set}
    var isPopoverOpen: Bool {get set}
    var toast: FancyToast? {get set}
    var selectedItem: PhotoModel? {get set}
    var roverType: RoverTypeEnums {get set}
    var roverCameraFilterType: RoverCameraEnums? {get set}
    var nasaService: NasaServiceRepository { get set }
    var data : [PhotoModel?]? {get set}
    func loadMoreItemsIfNeeded(item: PhotoModel?) async
    func fetchFirstItems() async -> Void
    func showItemInPopup(item: PhotoModel?)
    func setRoverCameraFilter(value: RoverCameraEnums?) async
    var pageType: PageType {get set}
}
