//
//  Services.swift
//  MyLessons
//
//  Created by Apple on 29/09/2021.
//

import Foundation
import Alamofire

extension NetworkManager{
    
    func GetHorizotalList( completion: @escaping (DataResponse<String, AFError>) -> ()) {
        sendGetRequest(endPoint: Constants.endPoints.HorizontalList, completion: completion)
    }
    
    func GetLiveLessons( completion: @escaping (DataResponse<String, AFError>) -> ()) {
        sendGetRequest(endPoint: Constants.endPoints.LiveLessons, completion: completion)
    }
    
    func GetMyLessons( completion: @escaping (DataResponse<String, AFError>) -> ()) {
        sendGetRequest(endPoint: Constants.endPoints.MyLessons, completion: completion)
    }
    
}
