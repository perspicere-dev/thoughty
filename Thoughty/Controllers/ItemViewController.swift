//
//  ItemViewController.swift
//  Thoughty
//
//  Created by Przemysław Wnęk on 24/05/2022.
//

import UIKit

protocol UserAddsNewItem {
    func didAddNewItem(title: String?, body: String?)
}

class ItemViewController: UIViewController {
    let itemTitle = UITextField(frame: CGRect(x: 50, y: 100, width: 300, height: 60))
    let itemBody = UITextField(frame: CGRect(x: 50, y: 200, width: 300, height: 60))
    
    var delegate: UserAddsNewItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray2
        configureTitleItemTextField()
        configureItemBodyTextField()
    }
    
    func configureTitleItemTextField() {
        itemTitle.placeholder = "title"
        itemTitle.borderStyle = .roundedRect
        itemTitle.backgroundColor = .systemGray5
        itemTitle.returnKeyType = .done
        itemTitle.delegate = self
        view.addSubview(itemTitle)
    }
    
    func configureItemBodyTextField() {
        itemBody.placeholder = "your thoughts "
        itemBody.borderStyle = .roundedRect
        itemBody.backgroundColor = .systemGray6
        itemBody.returnKeyType = .done
        itemBody.delegate = self
        view.addSubview(itemBody)
    }
}

extension ItemViewController: UITextFieldDelegate {
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "type something!"
            return false
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if itemBody.text != "" {
            if let title = itemTitle.text, let body = itemBody.text {
                delegate?.didAddNewItem(title: title, body: body)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                    self.dismiss(animated: true)
                }
                return true
            } else {
                return false
            }
        } else {
            textField.placeholder = "type something!"
            return false
        }
    }
    
}
