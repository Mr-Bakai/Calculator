//
//  BaseController.swift
//  kompanion
//
//  Created by Bakai Ismaiilov on 05.09.2022.
//

import Foundation
import UIKit

class BaseController<PresenterDelegate>: UIViewController {
    
    var presenter: PresenterDelegate?
    
    override func viewDidLoad() {
        setupObserver()
        setupSubViews()
        setupUI()
        setupKeyBoardEvents()
        setupClickKeyBoardEvent()
    }
    
    private func setupClickKeyBoardEvent() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    private func setupKeyBoardEvents() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification , object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification , object: nil)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    func hideKeyboard() {
        view.endEditing(true)
    }
    
    @objc func keyboardWillShow(_ notification: NSNotification) {
        let keyboardSize = (notification.userInfo![UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue.size

        keyboardShow(size: keyboardSize)
    }

    @objc func keyboardWillHide(_ notification: NSNotification) {
        keyboardHide()
    }
    
    func showErrorAlert(_ message: String) {
        let dialogMessage = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        
        dialogMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            dialogMessage.dismiss(animated: true)
        }))
        
        self.present(dialogMessage, animated: true, completion: nil)
    }
    
    func setupObserver() {}
    
    func keyboardShow(size: CGSize) {}
    
    func keyboardHide() {}
    
    func setupSubViews() {}
    
    func setupUI() {}
}
