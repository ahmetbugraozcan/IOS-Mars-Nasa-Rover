//
//  CuriosityViewModel.swift
//  appcentassignmentswift
//
//  Created by Ahmet Buğra Özcan on 11.11.2022.
//

import Foundation

class CuriosityViewModel: BaseViewModel {


    @Published var isPaginationLoading: Bool = false
    @Published var isFirstFetchLoading: Bool = true
    var toast: FancyToast? = nil

    @Published var isPopoverOpen: Bool = false
    @Published var selectedItem: PhotoModel? = nil


    var roverType: RoverTypeEnums = RoverTypeEnums.curiosity
    @Published var roverCameraFilterType: RoverCameraEnums? = nil

    var paginationPage: Int = 1
    var filterPaginationPage = 1
    var nasaService = NasaServiceRepository.instance


    var data: [PhotoModel?]?
    var filteredData: [PhotoModel?]? = []
    var pageType: PageType = PageType.idle

    func setRoverCameraFilter(value: RoverCameraEnums?) async {
     
        filterPaginationPage = 1
        // buraya giriyor isek idle durumuna geçiyoruz demektir
        if(value == nil) {
            DispatchQueue.main.async {
                self.roverCameraFilterType = nil
            }
            pageType = PageType.idle
            return
        }


        DispatchQueue.main.sync {
            self.isFirstFetchLoading = true
            self.isPaginationLoading = false
            self.filteredData?.removeAll()
            self.roverCameraFilterType = value
        }

        await fetchFilterItems()
//        try! await Task.sleep(nanoseconds: 4000000000)
        DispatchQueue.main.async {
            self.isFirstFetchLoading = false
            self.pageType = PageType.filtering
        }
    }

    func fetchFilterItems() async {

        if(isPaginationLoading || roverCameraFilterType == nil) {
            return
        }

        do {
            defer {
                DispatchQueue.main.async {


                    self.isPaginationLoading = false
                }
            }
            DispatchQueue.main.sync {
                self.isPaginationLoading = true
            }

            let results = try await nasaService.filterRoverCameras(roverType: roverType, page: filterPaginationPage, roverCameraType: roverCameraFilterType!)
            filterPaginationPage += 1
            DispatchQueue.main.async {

                if(results != nil) {
                    self.filteredData?.append(contentsOf: results!)
                }


            }
        } catch {
            toast = FancyToast(type: .error, title: "Error", message: error.localizedDescription)
        
        }


    }

    func fetchFirstItems() async {
        do {
            defer {
                DispatchQueue.main.async {
                    self.isFirstFetchLoading = false
                }
            }

            DispatchQueue.main.sync {
                self.isFirstFetchLoading = true
            }

            let results = try await nasaService.fetchRovers(roverType: roverType, page: paginationPage)
            paginationPage += 1
            DispatchQueue.main.async {
                if(results != nil) {
                    self.data = results
                }
            }
        } catch {

            toast = FancyToast(type: .error, title: "Error", message: error.localizedDescription)
        }
    }

    func fetchNext() async {
        if(isPaginationLoading) {
            return
        }

        do {
            defer { DispatchQueue.main.async {
                self.isPaginationLoading = false
            }
            }

            DispatchQueue.main.sync {
                self.isPaginationLoading = true
            }

            //         try! await Task.sleep(nanoseconds: 4000000000)

            let results = try await nasaService.fetchRovers(roverType: roverType, page: paginationPage)
            paginationPage += 1
            DispatchQueue.main.async {
                if(results != nil) {
                    self.data?.append(contentsOf: results ?? [])
                }

            }
        } catch {
  
            toast = FancyToast(type: .error, title: "Error", message: error.localizedDescription)
        }
    }



    func loadMoreItemsIfNeeded(item: PhotoModel?) async {
        if item == nil || data == nil || data!.count < AppConstants.instance.paginationCount {
            return
        }

        if(checkIsLastItemOfList(item: item, list: data)) {
            
            await fetchNext()
        }
    }

    func filterMoreItemsIfNeeded(item: PhotoModel?) async {
        if item == nil || data == nil || filteredData!.count < AppConstants.instance.paginationCount {
            return
        }
        if(checkIsLastItemOfList(item: item, list: filteredData)) {
            await fetchFilterItems()
        }
    }

    func showItemInPopup(item: PhotoModel?) {
        if(item == nil) {
            return
        }
        selectedItem = item
        isPopoverOpen = true


    }

    fileprivate func checkIsLastItemOfList(item: PhotoModel?, list: [PhotoModel?]?) -> Bool {
        return ((list?.count ?? 0) - 1) == list?.lastIndex { $0?.id == item!.id ?? 0 }
    }



}
