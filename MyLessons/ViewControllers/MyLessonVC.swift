//
//  MyLessonVC.swift
//  MyLessons
//
//  Created by Apple on 28/09/2021.
//

import UIKit
import SwiftyJSON
import SnackBar_swift
class MyLessonVC: UIViewController {
    
    @IBOutlet weak var viewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var lblSubject: UILabel!
    
    @IBOutlet weak var tableViewFilter: UITableView!
    @IBOutlet weak var tableViewLessons: UITableView!
    
    @IBOutlet weak var imgDropdown: UIImageView!
    
    @IBOutlet weak var viewEmpty: RoundCornerView!
    @IBOutlet weak var viewFilterSubjects: RoundCornerView!
    //VARIABLES
    var MyLessonsArray = [LessonModel]()
    var MyLessonsFilterArray   = [LessonModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getMyLessons()
    }
    
    
    /* MARK:- Buttons Action   */
    
    @IBAction func bactBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func showSubjectFilters(_ sender: Any) {
        if viewFilterSubjects.alpha == 0 {
            viewFilterSubjects.alpha = 1
            imgDropdown.image = ARROW_LEFT_IMAGE
        }else{
            imgDropdown.image = ARROW_DOWN_IMAGE
            viewFilterSubjects.alpha = 0}
    }
    
    func updateViewConstraint() {
        if self.MyLessonsFilterArray.count == 0{
            self.viewHeight.constant = 372
        }else{
            self.viewHeight.constant = CGFloat(240 * self.MyLessonsFilterArray.count + 100)
        }
        
    }
}

/* MARK:- Table Views   */

extension MyLessonVC:UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tableViewLessons {
            let count = MyLessonsFilterArray.count
            if count == 0{
                viewEmpty.alpha = 1
            }else{
                viewEmpty.alpha = 0
            }
            return count
        }else{
            return Constants.SubjectArry.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == tableViewLessons {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.tableViewIdentifiers.LessonCell) as! LessonTableCell
            cell.MyLessonCellConfigure(lesson: MyLessonsFilterArray[indexPath.row])
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.tableViewIdentifiers.FilterCell) as! FilterTableCell
            cell.lblSubjectName.text = Constants.SubjectArry[indexPath.row]
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if  tableView == tableViewFilter {
            lblSubject.text = Constants.SubjectArry[indexPath.row]
            imgDropdown.image = ARROW_DOWN_IMAGE
            viewFilterSubjects.alpha = 0
            let sub = lblSubject.text?.firstCharacterUpperCase()
            if sub == Constants.Subject.All_Subject{
                MyLessonsFilterArray = MyLessonsArray}else{
                    MyLessonsFilterArray = MyLessonsArray.filter { $0.subjectName.contains(sub!) }}
            updateViewConstraint()
            tableViewLessons.reloadData()
            
        }else{
            let lesson = MyLessonsFilterArray[indexPath.row]
            if lesson.status == Constants.Status.Live{
                SnackBar.make(in: self.view, message: lesson.topic, duration: .lengthShort).show()}
            
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if tableView == tableViewLessons {
            return 240
        }else{
            return 30
            
        }
    }
}
/* MARK:- APIs   */

extension MyLessonVC{
    // MARK:- HELPING METHODS
    
    func getMyLessons(){
        self.showSpinner(onView: view)
        NetworkManagerHelper.sharedInstance.GetMyLessonsApi{ (completed, data) in
            self.removeSpinner()
            if completed {
                self.MyLessonsArray.removeAll()
                self.MyLessonsArray = data?.map({LessonModel(json: $0)}) ?? []
                self.MyLessonsFilterArray = data?.map({LessonModel(json: $0)}) ?? []
                self.updateViewConstraint()
                self.tableViewLessons.reloadData()
            }
            else {
                self.showAlert(message: "Could't find Lessons")
            }
        }
    }
    
    
}
