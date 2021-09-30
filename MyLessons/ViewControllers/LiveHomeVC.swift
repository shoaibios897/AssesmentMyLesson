//
//  LiveHomeVC.swift
//  MyLessons
//
//  Created by Apple on 28/09/2021.
//

import UIKit
import SwiftyJSON
import SnackBar_swift

class LiveHomeVC: UIViewController {
    
    //UILable Outlets
    @IBOutlet weak var lblSubject: UILabel!
    
    //UIView Outlets
    @IBOutlet weak var ViewTryAgain: UIView!
    @IBOutlet weak var viewFilterSubjects: RoundCornerView!
    
    //UICollectionView Outlets
    @IBOutlet weak var CollectionViewHorzontal: UICollectionView!
    
    //UITableView Outlets
    @IBOutlet weak var tableViewFilters: UITableView!
    @IBOutlet weak var tableViewLessons: UITableView!
    
    //UIPageControl Outlets
    @IBOutlet weak var PageCotroller: UIPageControl!
    
    //UIImageView
    @IBOutlet weak var imgDropdown: UIImageView!
    
    
    ///VARIABLES
    var HorizotalListArrsy = [LessonModel]()
    var LiveLessonsArray   = [LessonModel]()
    var LiveLessonsFilterArray   = [LessonModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getHorizontalList()
        getLiveLessons()
        
    }
    
    
    /* MARK:- Buttons Action   */
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func showfSubjectilters(_ sender: Any) {
        if viewFilterSubjects.alpha == 0 {
            viewFilterSubjects.alpha = 1
            imgDropdown.image = ARROW_LEFT_IMAGE
        }else{
            imgDropdown.image = ARROW_DOWN_IMAGE
            viewFilterSubjects.alpha = 0}
    }
    
    @IBAction func floatingBtnAction(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: Constants.VcIdentifiers.MyLessonsVc) as! MyLessonVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}



/* MARK:- Collection View   */
extension LiveHomeVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return HorizotalListArrsy.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CollectionViewIdentifiers.HorizontalLessonCell, for: indexPath) as! HorizontalListCell
        cell.cellConfigrueData(lesson: HorizotalListArrsy[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let lesson = HorizotalListArrsy[indexPath.row]
        if lesson.status == Constants.Status.Live{
            SnackBar.make(in: self.view, message: lesson.topic, duration: .lengthLong).show()}
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        print(indexPath.row)
        PageCotroller.currentPage = indexPath.item
        PageCotroller.numberOfPages = HorizotalListArrsy.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CollectionViewHorzontal.frame.width  / 1,
                      height: CollectionViewHorzontal.frame.height / 1 )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        
        return UIEdgeInsets(top: 0,left: 0,bottom: 0,right: 0)
    }
    
}


/* MARK:- Table View   */
extension LiveHomeVC:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tableViewLessons {
            let count = LiveLessonsFilterArray.count
            if count == 0{
                ViewTryAgain.alpha = 1
            }else{
                ViewTryAgain.alpha = 0
            }
            return count
        }else{
            return Constants.SubjectArry.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == tableViewLessons {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.tableViewIdentifiers.LessonCell) as! LessonTableCell
            cell.LiveLessonCellConfigure(lesson: LiveLessonsFilterArray[indexPath.row])
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.tableViewIdentifiers.FilterCell) as! FilterTableCell
            cell.lblSubjectName.text = Constants.SubjectArry[indexPath.row]
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == tableViewFilters {
            imgDropdown.image = ARROW_DOWN_IMAGE
            lblSubject.text = Constants.SubjectArry[indexPath.row]
            viewFilterSubjects.alpha = 0
            let sub = lblSubject.text?.firstCharacterUpperCase()
            if sub == Constants.Subject.All_Subject{
                LiveLessonsFilterArray = LiveLessonsArray}else{
                    LiveLessonsFilterArray = LiveLessonsArray.filter { $0.subjectName.contains(sub!) }}
            self.tableViewLessons.reloadData()
            
        }else{
            let lesson = LiveLessonsFilterArray[indexPath.row]
            if lesson.status == Constants.Status.Live{
                SnackBar.make(in: self.view, message: lesson.topic, duration: .lengthLong).show()}
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == tableViewLessons {
            return 136
        }else{
            return 30
        }
    }
}


extension LiveHomeVC{
    // MARK:- HELPING METHODS
    func getHorizontalList(){
        NetworkManagerHelper.sharedInstance.GetHorizontalListApi{ (completed, data) in
            if completed {
                self.HorizotalListArrsy.removeAll()
                self.HorizotalListArrsy = data?.map({LessonModel(json: $0)}) ?? []
                self.CollectionViewHorzontal.reloadData()
            }
            else {
                self.showAlert(message: "Could't find Lessons")
            }
        }
    }
    
    func getLiveLessons(){
        self.showSpinner(onView: view)
        NetworkManagerHelper.sharedInstance.GetHorizontalListApi{ (completed, data) in
            if completed {
                self.removeSpinner()
                self.LiveLessonsArray.removeAll()
                self.LiveLessonsArray = data?.map({LessonModel(json: $0)}) ?? []
                self.LiveLessonsFilterArray  = data?.map({LessonModel(json: $0)}) ?? []
                self.tableViewLessons.reloadData()
            }
            else {
                self.showAlert(message: "Could't find Lessons")
            }
        }
    }
    
    
}
