//
//  HorizontalListCell.swift
//  MyLessons
//
//  Created by Apple on 28/09/2021.
//

import UIKit
import Kingfisher
class HorizontalListCell: UICollectionViewCell {
    
    //UIImage Outlet
    @IBOutlet weak var imgLesson: UIImageView!
    @IBOutlet weak var imgStatus: UIImageView!
    
    //UILabel Outlet
    @IBOutlet weak var lblTopic: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblName: UILabel!
    
    
    /* MARK:- Horizontal Cell data  */
    func cellConfigrueData(lesson:LessonModel){
        lblName.text  = "\(lesson.tutorFirstName) \(lesson.tutorLastName)"
        lblTopic.text = lesson.topic
        UpdateImgStatus(status: lesson.status, date: lesson.startAt)
        
        if let url = URL(string: lesson.imgUrl) {
            imgLesson.kf.indicatorType = .activity
            imgLesson.kf.setImage(
                with        : url,
                placeholder : nil)
        }
    }
    
    
    /* MARK:- Update Status img */
    func UpdateImgStatus(status:String, date:String){
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
    }
}
