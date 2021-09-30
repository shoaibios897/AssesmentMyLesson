//
//  NetworkManager.swift
//  MyLessons
//
//  Created by Apple on 29/09/2021.
//

import Foundation
import Alamofire


class NetworkManager {
    
    static let sharedInstance = NetworkManager()
    
    func sendGetRequest(
        endPoint: String,
        completion: @escaping (DataResponse<String, AFError>) -> Void
    ) -> Void {
        AF.request(
            BaseUrl + endPoint,
            method: .get
        ).responseString { response in
            
            completion(response)
        }
    }
}
