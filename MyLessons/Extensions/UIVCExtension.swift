//
//  UIVCExtension.swift
//  MyLessons
//
//  Created by Apple on 29/09/2021.
//

import UIKit

extension UIViewController{
    
    func showAlert(title: String = "Alert", message: String) {
        
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let oKAction = UIAlertAction(
            title: "OK",
            style: .default,
            handler: nil
        )
        
        alertController.addAction(oKAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    func showSpinner(onView : UIView, title: String = "Loading...") {
        let spinnerView = UIView.init(
            frame: onView.bounds
        )
        spinnerView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        
        let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        
        activityIndicator.startAnimating()
        activityIndicator.center = spinnerView.center
        
        let lableY     = activityIndicator.frame.origin.y + activityIndicator.frame.size.height
        
        let lableWidth = spinnerView.frame.width
        
        let lable = UILabel(
            frame: CGRect(
                x       : 0.0       ,
                y      : lableY    ,
                width  : lableWidth,
                height : 40
            )
        )
        
        lable.textColor     = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        lable.text          = title
        lable.textAlignment = .center
        lable.font          = UIFont(name: "Mulish-Regular", size: 14.0)
        
        DispatchQueue.main.async {
            spinnerView.addSubview(lable)
            spinnerView.addSubview(activityIndicator)
            onView.addSubview(spinnerView)
        }
        
        SPINNER = spinnerView
    }
    
    func removeSpinner() {
        SPINNER?.removeFromSuperview()
        SPINNER = nil
    }
}


extension String {
    func firstCharacterUpperCase() -> String? {
        guard !isEmpty else { return nil }
        let lowerCasedString = self.lowercased()
        return lowerCasedString.replacingCharacters(in: lowerCasedString.startIndex...lowerCasedString.startIndex, with: String(lowerCasedString[lowerCasedString.startIndex]).uppercased())
    }
}

