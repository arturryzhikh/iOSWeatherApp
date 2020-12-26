//
//  ViewModel.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 30.11.2020.
//


import Foundation

protocol DataSourceDelegate: class {
    
    func onFetchCompleted(with indexPathsToReload: [IndexPath]?)
    func onFetchFailed(with reason: String)
    func isFetching()
}
protocol LocationService {
    
}
protocol DataSource {
    
    associatedtype RequestType: APIRequest
    
    var locationService: LocationService? { get }
    
    var delegate: DataSourceDelegate? { get }
    
    var apiService: APIService { get }
    
    var cellViewModels: [Any] { get }
    
    var isFetching: Bool { get }
    
    var request : RequestType? { get }
    
    func itemViewModel(at IndexPath: IndexPath) -> Any
    
    func calculateIndexPathsToReload(from newCellViewModels: [Any],
                                     section: Int) -> [IndexPath]
    func fetch()
    
    init(apiService: APIService, request: RequestType?, delegate: DataSourceDelegate?, locationService: LocationService?)
}


final class WeatherDataSource: NSObject , DataSource {
    
    //MARK: Data source protocol
    
    typealias RequestType = WeatherRequest
    
    private var model: WeatherResponse?
    
    var cellViewModels: [Any] = []
    
    var apiService: APIService
    
    var locationService: LocationService?
    
    var delegate: DataSourceDelegate?
    
    var isFetching: Bool = false
    
    var request: WeatherRequest?
    //MARK: Life Cycle
    
    
    func itemViewModel(at IndexPath: IndexPath) -> Any {
        return self
    }
    
    func calculateIndexPathsToReload(from newCellViewModels: [Any], section: Int) -> [IndexPath] {
        return []
    }
    
    func fetch() {
        
    }
    
    init(apiService: APIService = WeatherService.shared,
         request: WeatherRequest?,
         delegate: DataSourceDelegate?,
         locationService: LocationService?)  {
        self.apiService = apiService
        
    }
    
  
    
    var numberOfSections: Int {
        return 5
    }
    func numberOfItemsIn(_ section: Int) -> Int {
        
        switch section {
        case 0:
            return 0
        case 1:
            return 9
        case 2:
            return 1
        case 3:
            return 10
        case 4:
            return 1
        default:
            assert(false)
            
        }
    }
    
}

//MARK: Networking

extension WeatherDataSource {
    
    private func fetch(latitude: Double, longitude: Double) {
        apiService.request(WeatherRequest(latitude: longitude, longitude: latitude)) { [weak self] (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let weather):
                self?.model = weather
            }
        }
    }
}

