//
//  LessonTableCell.swift
//  MyLessons
//
//  Created by Apple on 28/09/2021.
//

import UIKit
import Kingfisher

class LessonTableCell: UITableViewCell {
    
    //UIView Outlet
    @IBOutlet weak var viewMain: UIView!
    
    //UIImage Outlet
    @IBOutlet weak var imgLesson: UIImageView!
    @IBOutlet weak var imgStatus: UIImageView!
    
    //UILabel Outlet
    @IBOutlet weak var lblSubjectName: UILabel!
    @IBOutlet weak var lblTopic: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    /* MARK:- My Lessons Cell data  */
    func MyLessonCellConfigure(lesson:LessonModel){
        lblSubjectName.text = lesson.subjectName
        lblTopic.text       = lesson.topic
        SetStatus(subjectName: lesson.subjectName, status: lesson.status, date: lesson.startAt)
        
        if let url = URL(string: lesson.imgUrl) {
            imgLesson.kf.indicatorType = .activity
            imgLesson.kf.setImage(
                with        : url,
                placeholder : nil)
        }
    }
    
    
    
    /* MARK:- Live Lessons Cell data  */
    func LiveLessonCellConfigure(lesson:LessonModel){
        lblSubjectName.text = lesson.subjectName
        lblTopic.text       = lesson.topic
        lblName.text        = "\(lesson.tutorFirstName) \(lesson.tutorLastName)"
        SetStatus(subjectName: lesson.subjectName, status: lesson.status, date: lesson.startAt)
        
        if let url = URL(string: lesson.imgUrl) {
            imgLesson.kf.indicatorType = .activity
            imgLesson.kf.setImage(
                with        : url,
                placeholder : nil
            )
        }
    }
    
    
    
    func SetStatus(subjectName:String,status:String, date:String){
        
        /* MARK:- Set Status Img   */
        if status == Constants.Status.Live{
            imgStatus.image = LIVE_IMG
            lblTime.text  = "\("Started at ") \(Helper.ChangeDateFormat(strDate:date ))"
        }
        if status == Constants.Status.Upcoming{
            imgStatus.image = UPCOMING_IMG
            lblTime.text  = "\("Today") \(Helper.ChangeDateFormat(strDate:date ))"
        }
        if status == Constants.Status.Replay{
            imgStatus.image = REPLAY_IMG
            lblTime.text  = "\("Today") \(Helper.ChangeDateFormat(strDate:date ))"
        }
        
        /* MARK:- Set Subject Name Color   */
        let subject = subjectName
        
        switch subject {
        case Constants.Subject.Biology:
            lblSubjectName.textColor = BIO_COLOR
            break;
        case Constants.Subject.English:
            lblSubjectName.textColor = ENG_COLOR
            break;
        case Constants.Subject.Math:
            lblSubjectName.textColor = MATH_COLOR
            break;
        case Constants.Subject.Chemistry:
            lblSubjectName.textColor = CHEM_COLOR
            break;
        case Constants.Subject.Physics:
            lblSubjectName.textColor = PHY_COLOR
            break;
        default:
            lblSubjectName.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }
    }
}
