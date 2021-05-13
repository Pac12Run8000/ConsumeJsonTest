//
//  Alert.swift
//  ConsomeJsonTest
//
//  Created by Michelle Grover on 5/12/21.
//

import UIKit


struct Alert {
    
    static func presentGenericAlertWithConfirm(control:UIViewController, title:String, message:String) {
        var alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        var confirmButton = UIAlertAction(title: "Okay", style: .default) { (action) in
            
        }
        alert.addAction(confirmButton)
        control.present(alert, animated: true, completion: nil)
    }
}
