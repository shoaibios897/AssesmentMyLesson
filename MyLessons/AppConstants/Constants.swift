//
//  Constants.swift
//  MyLessons
//
//  Created by Apple on 28/09/2021.
//

import Foundation
class Constants {
    
    
    /* MARK:- End Points */
    struct endPoints {
        static let HorizontalList  = "/promoted"
        static let LiveLessons     = "/lessons"
        static let MyLessons       = "/lessons/me"
    }
    
    
    /* MARK:- Table View Cell Reusable Identifiers */
    struct tableViewIdentifiers {
        static let FilterCell      = "FilterSubjectCell"
        static let LessonCell      = "lessonsCell"
    }
    
    
    /* MARK:- Collection View Cell Reusable Identifiers */
    struct CollectionViewIdentifiers {
        static let HorizontalLessonCell = "HorizontalLessonCell"
    }
    
    /* MARK:- View Controller Identifiers */
    struct VcIdentifiers {
        static let MyLessonsVc   = "MyLessonVC"
    }
    
    /* MARK:- Status  */
    struct Status {
        static let Live          = "live"
        static let Upcoming      = "upcoming"
        static let Replay        = "replay"
    }
    
    /* MARK:- Subjects  */
    struct Subject {
        static let Math          = "Mathematics"
        static let Biology       = "Biology"
        static let Chemistry     = "Chemistry"
        static let Physics       = "Physics"
        static let English       = "English"
        static let All_Subject   = "All subjects"
    }
    
    static let SubjectArry = ["ALL SUBJECTS","MATHEMATICS","ENGLISH","CHEMISTRY","BIOLOGY","PHYSICS"]
    
    
}
