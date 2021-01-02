//
//  Fetcher.swift
//  iOSWeatherApp
//
//  Created by Artur Ryzhikh on 24.12.2020.
//

import Foundation

final class WeatherService: APIService {
    
    var apiKey: String
    
    private init(apiKey: String = API.apiKey) {
        self.apiKey = apiKey
    }
    //Shared Session
    let session = URLSession.shared
    
    static let shared =  WeatherService(apiKey: API.apiKey)
    
    func request<T: APIRequest>(_ request: T, completion: @escaping ResultClosure<T.Response>)  {
        
        guard let url = makeURL(endPoint: request.endPoint, queries: request.queries)
        
        else {
            completion(Result.failure(.encoding))
            return
        }
        print(url)
        
        let urlRequest = URLRequest(url: url)
        session.dataTask(with: urlRequest , completionHandler: { data, response, error in
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusOK , let data = data
            
            else {
                completion(Result.failure(ResponseError.network))
                
                return
            }
           guard let decoded = self.decode(data: data, into: T.Response.self) else {
                completion(Result.failure(ResponseError.decoding))
                return
            }
            
            completion(Result.success(decoded))
        
            
        }).resume()
    }
    
    func makeURL(endPoint: String, queries: [String : String]) -> URL? {
        var urlComponents = URLComponents(string: endPoint)
        urlComponents?.queryItems = queries.map {//map parameters into query items
            URLQueryItem(name: $0.key, value: $0.value)
        }
        urlComponents?.queryItems?.append(URLQueryItem(name: "appid", value: apiKey))
        return urlComponents?.url
    }
    //Decoding JSON
    func decode<T: Decodable>(data: Data, into model: T.Type) -> T?  {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try? decoder.decode(model.self, from: data)
    }
    
}
