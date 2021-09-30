//
//  Helper.swift
//  MyLessons
//
//  Created by Apple on 28/09/2021.
//

import Foundation
import UIKit

class Helper {
    static func debugLogs(any data: Any, and title: String = "Log") {
        print("============= DEBUG LOGS START =================")
        print("\(title): \(data)")
        print("=============  DEBUG LOGS END  =================")
        print("\n \n")
    }
    
    static func ChangeDateFormat(strDate: String) -> String {
        var returnDate = ""
        let formatter        = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        if let date = formatter.date(from: strDate) {
            formatter.dateFormat = "h:mm a"
            let newDate          = formatter.string(from: date)
            returnDate           = newDate
        }
        return returnDate
    }
}
