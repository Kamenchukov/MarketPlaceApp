//
//  NetworkManager.swift
//  MarketApp
//
//  Created by Константин Каменчуков on 20.03.2023.
//

import Foundation

class NetworkManager : ObservableObject {
    static let shared = NetworkManager()
    
    func getLatestData(url: String, completion: @escaping(LatestModel) -> ()) {
        let session = URLSession(configuration: .default)
        session.dataTask(with: URL(string: url)!) { data, _, err in
            if err != nil { print(err!.localizedDescription)
               return
            }
            // decoding JSON
            do {
                let latestData = try JSONDecoder().decode(LatestModel.self, from: data!)
                // returning latestData
                completion(latestData)
            } catch {
                print(error)
            }
        }
        .resume()
    }
    
    func getFlashSaleData(url: String, completion: @escaping(FlashSaleModel) -> ()) {
        let session = URLSession(configuration: .default)
        session.dataTask(with: URL(string: url)!) { data, _, err in
            if err != nil { print(err!.localizedDescription)
               return
            }
            // decoding JSON
            do {
                let flashSaleData = try JSONDecoder().decode(FlashSaleModel.self, from: data!)
                // returning flashSaleData
                completion(flashSaleData)
            } catch {
                print(error)
            }
        }
        .resume()
    }
}
