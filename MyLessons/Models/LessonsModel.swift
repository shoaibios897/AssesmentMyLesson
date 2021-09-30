//
//  LessonsModel.swift
//  MyLessons
//
//  Created by Apple on 29/09/2021.
//

import Foundation
import SwiftyJSON

struct LessonModel {
    let id             : String
    let tutorFirstName : String
    let tutorLastName  : String
    let subjectName    : String
    let imgUrl         : String
    let status         : String
    let topic          : String
    let startAt        : String
    let expiresAt      : String
    
    init(json: JSON) {
        id             = json["id"].stringValue
        tutorFirstName = json["tutor"]["firstname"].stringValue
        tutorLastName  = json["tutor"]["lastname"].stringValue
        subjectName    = json["subject"]["name"].stringValue
        imgUrl         = json["image_url"].stringValue
        status         = json["status"].stringValue
        topic          = json["topic"].stringValue
        startAt        = json["start_at"].stringValue
        expiresAt      = json["expires_at"].stringValue
    }
}
