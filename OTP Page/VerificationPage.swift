//
//  VerificationPage.swift
//  QiQ
//
//  Created by Karthick on 10/31/17.
//  Copyright © 2017 Karthick. All rights reserved.
//
let MAXLENGTH = 2
let USERNAMEMAXLENGTH = 18

//MARK:- Prameters
let otp = "otp"

import UIKit

class VerificationPage: UIViewController, UITextFieldDelegate {
  
  var mobileNo: String!
  var VerificationNo: String!
  
  @IBOutlet weak var backBtn: UIButton!
  @IBOutlet weak var scrollView: UIScrollView!
  @IBOutlet weak var titleLlb: UILabel!
  @IBOutlet weak var otpMessage: UILabel!
  @IBOutlet weak var firstText: SkyFloatingLabelTextField!
  @IBOutlet weak var secondText: SkyFloatingLabelTextField!
  @IBOutlet weak var thirdText: SkyFloatingLabelTextField!
  @IBOutlet weak var fourthText: SkyFloatingLabelTextField!
  
  @IBOutlet weak var continueBtn: UIButton!
  @IBOutlet weak var mobileNoLbl: UILabel!
  var keyboardActive = false
  @IBOutlet weak var resendBtn: UIButton!
  
  //MARK: - ViewDidLoad
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.navigationController?.isNavigationBarHidden = true
    self.navigationItem.hidesBackButton = true
    //title
    titleLlb.text = "Verification"
    titleLlb.textColor = UIColor.white
    titleLlb.textAlignment = .center
    
    //Message text
    otpMessage.text = "OTP"
    otpMessage.textColor = UIColor.gray
    otpMessage.textAlignment = .center
    otpMessage.backgroundColor = UIColor.clear
    
    //First TextField
    firstText.delegate = self as UITextFieldDelegate
    firstText.lineColor = .lightGray
    firstText.tag = 1
    firstText.textColor = UIColor.customBlackColor()
    firstText.font = UIFont.regularFont14()
    firstText.keyboardType = .numberPad
    firstText.backgroundColor = UIColor.clear
    firstText.textAlignment = .center
    
    //secondText
    secondText.delegate = self
    secondText.lineColor = .lightGray
    secondText.tag = 2
    secondText.textColor = UIColor.customBlackColor()
    secondText.font = UIFont.regularFont14()
    secondText.keyboardType = .numberPad
    secondText.backgroundColor = UIColor.clear
    secondText.textAlignment = .center
    
    //Third textfield
    thirdText.delegate = self
    thirdText.lineColor = .lightGray
    thirdText.tag = 3
    thirdText.textColor = UIColor.customBlackColor()
    thirdText.font = UIFont.regularFont14()
    thirdText.backgroundColor = UIColor.clear
    thirdText.keyboardType = .numberPad
    thirdText.textAlignment = .center
    
    //Fourth textfield
    fourthText.delegate = self
    fourthText.lineColor = .lightGray
    fourthText.tag = 4
    fourthText.textColor = UIColor.customBlackColor()
    fourthText.font = UIFont.regularFont14()
    fourthText.backgroundColor = UIColor.clear
    fourthText.textAlignment = .center
    fourthText.keyboardType = .numberPad
    fourthText.addDoneButtonOnKeyboard()
    
    //Texfield action for move to next textfield
    firstText.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
    secondText.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
    thirdText.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
    fourthText.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
    
    //Mobile No Label
    mobileNoLbl.text = "Mobile Number"
    mobileNoLbl.font = UIFont.regularFont18()
    mobileNoLbl.textAlignment = .center
    mobileNoLbl.textColor = UIColor.customGrayColor()
    mobileNoLbl.backgroundColor = UIColor.clear
    
    //NExt btn
    continueBtn.backgroundColor = UIColor.buttonBackGroundGrayColor()
    continueBtn.setTitle("Submit", for: .normal)
    continueBtn.layer.cornerRadius = 8.0
    continueBtn.clipsToBounds = true
    continueBtn.titleLabel?.font = UIFont.regularFont18()
    continueBtn.isUserInteractionEnabled = false
    continueBtn.setTitleColor(UIColor.customWhite(), for: .normal)
    
    //Resend btn
    resendBtn.backgroundColor = UIColor.appThemeColor()
    resendBtn.setTitle("Resend", for: .normal)
    resendBtn.layer.cornerRadius = 8.0
    resendBtn.clipsToBounds = true
    resendBtn.titleLabel?.font = UIFont.regularFont18()
    resendBtn.isUserInteractionEnabled = true
    resendBtn.setTitleColor(UIColor.customWhite(), for: .normal)
    
  }
  
  //MARK: - ViewWillAppear
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    //firstText.becomeFirstResponder()
  }
  //MARK:-TextfiledDidBeginEdit
  func textFieldDidBeginEditing(_ textField: UITextField) {
    if keyboardActive == false {
      UIView.animate(withDuration: 0.3, animations: {() -> Void in
        self.view.frame.origin.y -= 180
        self.keyboardActive = true
      })
    }
  }
  //MARK:-TextfiledDidEndEdit
  func textFieldDidEndEditing(_ textField: UITextField) {
    if keyboardActive == true {
      UIView.animate(withDuration: 0.3, animations: {() -> Void in
        self.view.frame.origin.y += 180
        self.keyboardActive = false
      })
    }
    if !GlobalClass.sharedInstance.isEmpty(string: firstText.text) && !GlobalClass.sharedInstance.isEmpty(string: secondText.text) && !GlobalClass.sharedInstance.isEmpty(string: thirdText.text) && !GlobalClass.sharedInstance.isEmpty(string: fourthText.text){
      continueBtn.isUserInteractionEnabled = true
      continueBtn.backgroundColor = UIColor.buttonBackGroundGreenColor()
    }else{
      continueBtn.isUserInteractionEnabled = false
    }
  }
  //MARK:-TextfiledReturn
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    self.view.endEditing(true)
    return false
  }
  //
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
     let currentString: NSString = textField.text! as NSString
     let newString: NSString =
       currentString.replacingCharacters(in: range, with: string) as NSString
    switch textField.tag {
    case 1:
      //secondText.becomeFirstResponder()
      return newString.length <= MAXLENGTH
    case 2:
      // thirdText.becomeFirstResponder()
      return newString.length <= MAXLENGTH
    case 3:
      // fourthText.becomeFirstResponder()
      return newString.length <= MAXLENGTH
    case 4:
      // textField.becomeFirstResponder()
      return newString.length <= MAXLENGTH
    default:
      break
    }
    return newString.length <= USERNAMEMAXLENGTH
  }
  
  //MARK: - TextField Add Target
  @objc func textFieldDidChange(textField: UITextField){
    
    let text = textField.text
    if textField.tag != 1 {
        if firstText.text?.count == 0 {
             return
        }
    }
    
    
    if text?.utf16.count==1{
      switch textField{
      case firstText:
        secondText.becomeFirstResponder()
      case secondText:
        thirdText.becomeFirstResponder()
      case thirdText:
        fourthText.becomeFirstResponder()
      case fourthText:
        fourthText.resignFirstResponder()
      default:
        break
      }
    }
    if  text?.count == 0 {
        switch textField{
        case firstText:
            firstText.becomeFirstResponder()
        case secondText:
            firstText.becomeFirstResponder()
        case thirdText:
            secondText.becomeFirstResponder()
        case fourthText:
            thirdText.becomeFirstResponder()
        default:
            break
        }
    }
    else{
      
    }
  }
  
  //MARK: - Move to Next page
  @IBAction func didTapContinueAction(_ sender: Any) {
    print("Continue")
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  //MARK:- Resend OTP
  @IBAction func didTapResendAction(_ sender: Any) {
    print("Resend")
  }
}
