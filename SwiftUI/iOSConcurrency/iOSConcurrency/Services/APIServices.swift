//
//  APIServices.swift
//  iOSConcurrency
//
//  Created by Truong Tommy on 7/11/22.
//

import Foundation

struct APIServices {
    let urlString : String
    
    func getJSON<T: Decodable>(dateDecodingStrategy : JSONDecoder.DateDecodingStrategy = .deferredToDate,
                               keyDecodingStrategy : JSONDecoder.KeyDecodingStrategy = .useDefaultKeys) async throws -> T {
        guard let url = URL(string: urlString) else {
            throw APIError.invalidURL
        }
        do {
            let (data,response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse,
            httpResponse.statusCode == 200 else {
                throw APIError.invalidateResponseStatus
            }
            // do catch block 2
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = dateDecodingStrategy
            decoder.keyDecodingStrategy = keyDecodingStrategy
            do {
                let decodedData = try decoder.decode(T.self, from: data)
                print("Got the result")

                return decodedData
            }catch{
                throw APIError.decodingError(error.localizedDescription)
            }
        } catch  {
            throw APIError.dataTaskError(error.localizedDescription)
        }
    }
    
    func getJSON<T: Decodable>(dateDecodingStrategy : JSONDecoder.DateDecodingStrategy = .deferredToDate,
                                keyDecodingStrategy : JSONDecoder.KeyDecodingStrategy = .useDefaultKeys,
                                completion : @escaping (Result<T,APIError>) -> Void){
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidURL))
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse,
            httpResponse.statusCode == 200 else {
                completion(.failure(.invalidateResponseStatus))
                return
            }
            guard error == nil else {
                completion(.failure(.dataTaskError(error!.localizedDescription)))
                return
            }
            guard let data = data else {
                completion(.failure(.corruptData))
                return
            }
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = dateDecodingStrategy
            decoder.keyDecodingStrategy = keyDecodingStrategy
            do {
                let decodedData = try decoder.decode(T.self, from: data)
                completion(.success(decodedData))
                print("Got the result")
            }catch{
                completion(.failure(.decodingError(error.localizedDescription)))
            }
        }
        .resume()
    }
}

enum APIError :Error, LocalizedError {
    case invalidURL
    case invalidateResponseStatus
    case dataTaskError(String)
    case corruptData
    case decodingError(String)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return NSLocalizedString("The endpoint URL is invalid", comment: "")
        case .invalidateResponseStatus:
            return NSLocalizedString("The APIO failed to issue a valid response", comment: "")
        case .dataTaskError(let string):
            return string
        case .corruptData:
            return NSLocalizedString("Corrupted data", comment: "")
        case .decodingError(let string):
            return string
        }
    }
}
