//
//  NetworkManagerHelper.swift
//  MyLessons
//
//  Created by Apple on 29/09/2021.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkManagerHelper{
    static let sharedInstance = NetworkManagerHelper()
    
    
    func GetHorizontalListApi(completed: @escaping (_ finished: Bool, _ servicesJson: [JSON]?) -> ()){
        NetworkManager.sharedInstance.GetHorizotalList( ){ (response) in
            
            switch response.result {
            case .success(_):
                do {
                    let data = try JSON(data: response.data!)
                    let isSuccess = data["success"].boolValue
                    if isSuccess == true {
                        let data = data["data"].arrayValue
                        completed(true, data)
                    } else {
                        completed(true, nil)
                    }
                } catch {
                    Helper.debugLogs(
                        any: error.localizedDescription,
                        and: "Caught Error"
                    )
                }
            case .failure(let error):
                Helper.debugLogs(any: error, and: "Error")
            }
        }
    }
    
    
    func GetLiveLessonsApi(completed: @escaping (_ finished: Bool, _ servicesJson: [JSON]?) -> ()){
        NetworkManager.sharedInstance.GetLiveLessons( ){ (response) in
            
            switch response.result {
            case .success(_):
                do {
                    let data = try JSON(data: response.data!)
                    let isSuccess = data["success"].boolValue
                    if isSuccess == true {
                        let data = data["data"].arrayValue
                        completed(true, data)
                    } else {
                        completed(true, nil)
                    }
                } catch {
                    Helper.debugLogs(
                        any: error.localizedDescription,
                        and: "Caught Error"
                    )
                }
            case .failure(let error):
                Helper.debugLogs(any: error, and: "Error")
            }
        }
    }
    
    
    
    func GetMyLessonsApi(completed: @escaping (_ finished: Bool, _ servicesJson: [JSON]?) -> ()){
        NetworkManager.sharedInstance.GetMyLessons( ){ (response) in
            
            switch response.result {
            case .success(_):
                do {
                    let data = try JSON(data: response.data!)
                    let isSuccess = data["success"].boolValue
                    
                    if isSuccess == true {
                        let data = data["data"].arrayValue
                        completed(true, data)
                    } else {
                        completed(true, nil)
                    }
                    
                } catch {
                    Helper.debugLogs(
                        any: error.localizedDescription,
                        and: "Caught Error"
                    )
                }
            case .failure(let error):
                Helper.debugLogs(any: error, and: "Error")
            }
        }
    }
}
