//
//  Validation.swift
//  EdvoraLogin
//
//  Created by SINDHYA ANOOP on 12/22/21.
//

import Foundation

class UserNameValidationObject: ObservableObject{
    
    @ Published var userName = ""{
        didSet {
            if self.userName.isEmpty{
                self.error =  "Empty"
            } else if !self.userName.isValidUsername() {
                self.error = "Invalid UserName"}
            else{
                self.error = ""
            }
        }
    }
    @ Published var error = ""
}

class PasswordValidationObject: ObservableObject{
    @ Published var password = ""{
        didSet {
            if self.password.isEmpty{
                self.error =  "Empty"
            } else if !self.password.isValidPassword() {
                self.error = "8 characters,1 number,1 uppercase,1 lowercase "}
            else{
                self.error = ""
            }
        }
    }
    @ Published var error = ""
}


class EmailValidationObject: ObservableObject{
    @ Published var email = ""{
        didSet {
            if self.email.isEmpty{
                self.error =  "Empty"
            } else if !self.email.isValidEmail() {
                self.error = "Invalid Email"}
            else{
                self.error = ""
            }
        }
    }
    @ Published var error = ""
}


extension String {
    
    func isValidUsername() -> Bool {
        let userNameRegEx = "[a-z0-9!@#$%^&*()._-]{5,16}"
        
        let userNameValidation = NSPredicate(format:"SELF MATCHES[c] %@", userNameRegEx)
        return userNameValidation.evaluate(with: self)
    }
    
    
    
    func isValidPassword() -> Bool {
        let passwordRegEx =  #"(?=.{8,})"#
            + #"(?=.*[A-Z])"#
            + #"(?=.*[a-z])"#
            + #".*[0-9]+.*"#
        
        let PasswordValidation = NSPredicate(format:"SELF MATCHES[c] %@", passwordRegEx)
        return PasswordValidation.evaluate(with: self)
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "(?:[a-zA-Z0-9!#$%\\&‘*+/=?\\^_`{|}~-]+(?:\\.[a-zA-Z0-9!#$%\\&'*+/=?\\^_`{|}"
            + "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"
            + "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"
            + "z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"
            + "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"
            + "9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"
            + "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        
        let emailValidation = NSPredicate(format:"SELF MATCHES[c] %@", emailRegEx)
        return emailValidation.evaluate(with: self)
    }
}
