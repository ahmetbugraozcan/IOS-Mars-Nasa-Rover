//
//  SpiritView.swift
//  appcentassignmentswift
//
//  Created by Ahmet Buğra Özcan on 13.11.2022.
//

import SwiftUI

struct SpiritBody: View {
    @EnvironmentObject var viewModel: SpiritViewModel
    
    var body: some View {
        GeometryReader { geometry in
            Group {
                if(viewModel.isFirstFetchLoading) {
                    ProgressView()
                }
                else {

                    NavigationStack {
                        Group {
                            switch viewModel.pageType {
                            case PageType.filtering:
                                if(viewModel.filteredData == nil || viewModel.filteredData!.isEmpty) {
                                    LottieWithMessage(lottieEnum: LottieEnum.notfound, message: "No data found", height: geometry.size.height / 3)
                                } else {
                                    buildFilterBody(geometry: geometry)
                                }
                            case PageType.idle:
                                if(viewModel.data == nil || viewModel.data!.isEmpty) {
                                    LottieWithMessage(lottieEnum: LottieEnum.notfound, message: "No data found", height: geometry.size.height / 3)
                                } else {

                                    buildBody(geometry: geometry)
                                }
                            }
                        }.navigationTitle("Spirit").toolbar {
                            toolBarItems()
                        }
                    }

                }
            }.toastView(toast: $viewModel.toast).onLoad {
                Task.detached {
                    await viewModel.fetchFirstItems()
                }
            }.environmentObject(viewModel)

        }
    }
    
    fileprivate func buildBody(geometry: GeometryProxy) -> some View {
        return VStack {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.data!, id: \.self?.id) { item in
                        NasaImageContainer(item: item, height: geometry.size.height / 3)
                            .onAppear {
                                Task.detached {
                                    await viewModel.loadMoreItemsIfNeeded(item: item)
                                }
                            }.onTapGesture {
                                viewModel.showItemInPopup(item:item)
                            }
                    }
                }
                if(viewModel.isPaginationLoading) {
                    ProgressView().padding(.all)
                }
            }
            
        }.sheet(isPresented: $viewModel.isPopoverOpen) {
            if(viewModel.selectedItem == nil) {
                Text("An error occured")
            } else {
                ImageDetailsPopover(selectedItem: viewModel.selectedItem,geometry: geometry)
            }
        }
    }
    fileprivate func toolBarItems() -> ToolbarItem<(), Menu<Text, TupleView<(Button<Text>, ForEach<[RoverCameraEnums], RoverCameraEnums, Button<Text>>)>>> {
        return ToolbarItem(placement: .navigationBarTrailing) {
            Menu("\(viewModel.roverCameraFilterType == nil ? "ALL" : viewModel.roverCameraFilterType!.rawValue)") {
                Button("ALL") {
                    Task.detached {
                        await viewModel.setRoverCameraFilter(value: nil)
                    }
                }
                ForEach(RoverTypeEnums.getCameraEnums(value: viewModel.roverType), id: \.self) { item in
                    Button(item.rawValue) {
                        Task.detached {
                            
                            await viewModel.setRoverCameraFilter(value: item)
                            
                        }
                    }
                }
            }
        }
    }
    
    fileprivate func buildFilterBody(geometry: GeometryProxy) -> some View {
        return VStack {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.filteredData!, id: \.self?.id) { item in
                        NasaImageContainer(item: item, height: geometry.size.height / 3)
                            .onAppear {
                                Task.detached {
                                    await viewModel.filterMoreItemsIfNeeded(item: item)
                                }
                            }.onTapGesture {
                                viewModel.showItemInPopup(item:item)
                            }
                    }
                }
                if(viewModel.isPaginationLoading) {
                    ProgressView().padding(.all)
                }
            }
            
        }.sheet(isPresented: $viewModel.isPopoverOpen) {
            if(viewModel.selectedItem == nil) {
                Text("An error occured")
            } else {
                ImageDetailsPopover(selectedItem: viewModel.selectedItem,geometry: geometry)
            }
        }
    }
}

struct SpiritBody_Previews: PreviewProvider {
    static var previews: some View {
        SpiritView()
    }
}
