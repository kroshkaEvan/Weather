//
//  API.swift
//  Weather
//
//  Created by Эван Крошкин on 13.03.22.
//

import Foundation

struct WeatherApi {
    static let key = "e286a159a583b9251688d27bebc25783"
}

extension WeatherApi {
    static let baseURL = "https://api.openweathermap.org/data/2.5"

    static func getCurrentWeatherURL(lat: Double, lon: Double) -> String {
        let excludeFields = "minutely"
        return "\(baseURL)/onecall?lat=\(lat)&lon=\(lon)&appid=\(key)&exclude=\(excludeFields)&units=metric"
    }
}

final class NetworkManager<T: Codable> {
    static func fetch(for url: URL, completion: @escaping (Result<T, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard error == nil else {
                print(String(describing: error))
                completion(.failure(.error(err: error!.localizedDescription)))
                return
            }
            
            do {
                let json = try JSONDecoder().decode(T.self, from: data)
                completion(.success(json))
            } catch let err {
                print(String(describing: err))
                completion(.failure(.decodingError(err: err.localizedDescription)))
            }
        }.resume()
    }
}

enum NetworkError: Error {
    case invalidResponse
    case invalidData
    case decodingError(err: String)
    case error(err: String)
}