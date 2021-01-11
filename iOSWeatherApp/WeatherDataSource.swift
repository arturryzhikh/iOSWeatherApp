//
//  ViewModel.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 30.11.2020.
//


import Foundation

enum Section: Int, CaseIterable {
    
    case currentHourly = 0
    
    case daily
    
    case today
    
    case detail
    
    case link
    
}


final class WeatherDataSource: NSObject, ApiConnectable {
    
   //MARK: Other Properties
    var sections: Set<Section> = [.currentHourly,.daily,.today,.detail,.link]
    
    var reloadClosure: (()->Void)?
    
    var apiService: APIService!
    
    var isFetching: Bool = false
    
    //MARK: View Models
    var currentHourlySectionVM: CurrentHourlySectionVM? {
        
        didSet {
            reloadClosure?()
        }
        
    }
    var dailySectionVM: DailySectionVM? {
        
        didSet {
            reloadClosure?()
        }
    }
    var todaySectionVM: TodaySectionVM? {
        didSet {
            reloadClosure?()
        }
    }
    var detailSectionVM: DetailSectionVM? {
        didSet {
            reloadClosure?()
        }
    }
    //MARK: Life Cycle
    init(apiService: APIService = WeatherService.shared) {
        self.apiService = apiService
        
    }
    
    
    var numberOfSections: Int {
        return sections.count
    }
    func numberOfItemsIn(_ section: Int) -> Int {
        
        let section = Section(rawValue: section)
        switch section {
        
        case .currentHourly:
            return currentHourlySectionVM?.numberOfItems ?? 0
            
        case .daily:
            return dailySectionVM?.numberOfItems ?? 0
        
        case .today:
            return todaySectionVM?.numberOfItems ?? 0
            
        case .detail:
            return detailSectionVM?.numberOfItems ?? 0
        case .link:
            return 1
            
        default:
            return 0
        }
    }
   
}



extension WeatherDataSource {
    
    func getWeatherWith(_ request: WeatherRequest) {
        
        isFetching = true
        
        apiService.request(request) { (result) in
            
            switch result {
            case .failure(let error):
                print(error)
            case .success(let weather):
                
                self.currentHourlySectionVM = CurrentHourlySectionVM(model: weather)
                self.dailySectionVM = DailySectionVM(model: weather)
                self.todaySectionVM = TodaySectionVM(model: weather)
                self.detailSectionVM = DetailSectionVM(model: weather)
                
            }
        }
    }
    
}

