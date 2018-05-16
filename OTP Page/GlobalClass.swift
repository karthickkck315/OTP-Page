//
//  GlobalClass.swift
//  Hoovene
//
//  Created by Karthick on 12/06/17.
//  Copyright © 2017 Technoduce. All rights reserved.
//

import UIKit
class GlobalClass: NSObject {
    
  
    static let sharedInstance: GlobalClass = GlobalClass()
    
    var activityBackgroundView : UIView!
    var myActivityIndicator:UIActivityIndicatorView!
    var connected: Bool!
    var strLabel = UILabel()
    var msgFrame = UIView()
  
  // MARK:- isEmpty
  func isEmpty(string: String? = String()) -> Bool {
    if string == nil || (string ?? "").isEmpty {
      return true
    }
    return false
  }
  
    // global alert view function
    // MARK: alertView
    func alertView(title: String, message: String, action: String, sender: UIViewController)
    {
        DispatchQueue.main.async(execute: {
            // set alertController for above ios 8 OS
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: action, style: UIAlertActionStyle.default, handler:nil))
            sender.present(alert, animated: true, completion: nil)
        })
    }
    func setUpTextField(textField: UITextField){
        textField.leftViewMode = .always
    }
}

extension UITapGestureRecognizer {
    
    func didTapAttributedTextInLabel(label: UILabel, inRange targetRange: NSRange) -> Bool {
        // Create instances of NSLayoutManager, NSTextContainer and NSTextStorage
        let layoutManager = NSLayoutManager()
        let textContainer = NSTextContainer(size: CGSize.zero)
        let textStorage = NSTextStorage(attributedString: label.attributedText!)
        
        // Configure layoutManager and textStorage
        layoutManager.addTextContainer(textContainer)
        textStorage.addLayoutManager(layoutManager)
        
        // Configure textContainer
        textContainer.lineFragmentPadding = 0.0
        textContainer.lineBreakMode = label.lineBreakMode
        textContainer.maximumNumberOfLines = label.numberOfLines
        let labelSize = label.bounds.size
        textContainer.size = labelSize
        
        // Find the tapped character location and compare it to the specified range
        let locationOfTouchInLabel = self.location(in: label)
        let textBoundingBox = layoutManager.usedRect(for: textContainer)
        
        let textContainerOffset = CGPoint(x:(labelSize.width - textBoundingBox.size.width) * 0.5 - textBoundingBox.origin.x, y:(labelSize.height - textBoundingBox.size.height) * 0.5 - textBoundingBox.origin.y)
        
        //let textContainerOffset = CGPointMake((labelSize.width - textBoundingBox.size.width) * 0.5 - textBoundingBox.origin.x, (labelSize.height - textBoundingBox.size.height) * 0.5 - textBoundingBox.origin.y);
        
        let locationOfTouchInTextContainer = CGPoint(x:locationOfTouchInLabel.x - textContainerOffset.x, y:locationOfTouchInLabel.y - textContainerOffset.y);
        
        let indexOfCharacter = layoutManager.characterIndex(for: locationOfTouchInTextContainer, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
        
        return NSLocationInRange(indexOfCharacter, targetRange)
    }
    
}
//MARK:- Tool bar
extension UITextField {
    
    func addDoneButtonOnKeyboard() {
        let doneToolbar: UIToolbar = UIToolbar()
        doneToolbar.barStyle = .blackTranslucent
        doneToolbar.barTintColor = UIColor.appThemeColor()

        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style:.done, target: self, action: #selector(UITextField.doneButtonAction))
        done.setTitleTextAttributes([NSAttributedStringKey.font:UIFont.regularFont14() , NSAttributedStringKey.foregroundColor : UIColor.white], for: .normal)
        let items = NSMutableArray()
        items.add(flexSpace)
        items.add(done)
        doneToolbar.items = items as? [UIBarButtonItem]
        doneToolbar.sizeToFit()
        self.inputAccessoryView = doneToolbar
        
    }
    func addDatePicker(formatter : String, maxDate : Date){
        let datePickerView  : UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = .date
        datePickerView.maximumDate = Date()
        datePickerView.locale = NSLocale(localeIdentifier: "en_GB") as Locale
        self.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(UITextField.handleDatePicker(sender:)), for: UIControlEvents.valueChanged)
        addDoneButtonOnKeyboard()
    }
    
    @objc func handleDatePicker(sender: UIDatePicker) {
        let Formatter = DateFormatter()
        Formatter.dateFormat = "dd-MM-yyyy"
        self.text = Formatter.string(from: sender.date)
    }
    @objc func doneButtonAction(){
        self.resignFirstResponder()
    }
}
