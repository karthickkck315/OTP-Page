//  Copyright 2016-2017 Skyscanner Ltd
//
//  Licensed under the Apache License, Version 2.0 (the "License"); 
//  you may not use this file except in compliance with the License. You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software distributed under the License is 
//  distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and limitations under the License.

// MARK: - UITextField extension

import UIKit

extension UITextField {
    /// Moves the caret to the correct position by removing the trailing whitespace
    func fixCaretPosition() {
        // Moving the caret to the correct position by removing the trailing whitespace
        // http://stackoverflow.com/questions/14220187/uitextfield-has-trailing-whitespace-after-securetextentry-toggle

        let beginning = beginningOfDocument
        selectedTextRange = textRange(from: beginning, to: beginning)
        let end = endOfDocument
        selectedTextRange = textRange(from: end, to: end)
    }
    
    func addRightPadding(image:UIImage){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.size.height, height: self.frame.size.height))
        
        let btnImage = UIButton(frame: CGRect(x: 0, y: 0, width: paddingView.frame.size.width, height: paddingView.frame.size.height))
        btnImage.setImage(image, for: .normal)
        btnImage.contentMode = .scaleAspectFit
        btnImage.imageEdgeInsets = UIEdgeInsetsMake(2, 2, 2, 2)
        btnImage.addTarget(self, action: #selector(rightPaddingAction), for: .touchUpInside)
        paddingView.addSubview(btnImage)
        
//        if  GlobalClass.sharedInstance.getIsLtrDirection() {
            self.rightView = paddingView
            self.rightViewMode = .always
//        }else{
//            self.leftView = paddingView
//            self.leftViewMode = .always
//        }
    }
    @objc func rightPaddingAction(){
        self.becomeFirstResponder()
    }
    func addPadding()
    {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: self.frame.size.height))
        self.borderStyle = .none
//        if  GlobalClass.sharedInstance.getIsLtrDirection() {
            self.leftView = paddingView
            self.leftViewMode = .always
//        }else{
//            self.rightView = paddingView
//            self.rightViewMode = .always
//        }
    }
}

