//
//  OtherMode.swift
//  UserDefaultLesson
//
//  Created by Alexander on 31.10.2022.
//

import Foundation
import UIKit

enum KeyData {
    static let studentData = "studentData"
}

struct UserData: Codable {
    var studentName: String?
    var studentAge: Int?
}
class ViewControllers: UIViewController {
    
    private var titilelable: UILabel = {
        let title = UILabel()
        title.font = UIFont(name: "Name is not set", size: 20)
        title.textColor = .black
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private var fieldTitle: UITextField = {
        let field = UITextField()
        field.placeholder = "Enter student name"
        field.textColor = .red
        field.clearButtonMode = .whileEditing
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private var agelable: UILabel = {
        let lable = UILabel()
        lable.font = UIFont(name: "Age is not set", size: 20)
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.textColor = .black
        
        return lable
    }()
    
    private var ageText: UITextField = {
        let text = UITextField()
        text.placeholder = "Enter student age"
        text.textColor = .red
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private var saveButton: UIButton = {
        let button = UIButton()
       // button.setImage(UIImage(systemName: "person.crop.circle.badge.plus"), for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 3
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Save Data", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var savedData: UserData = UserData()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ageText.delegate = self
        fieldTitle.delegate = self
        saveButton.addTarget(self, action: #selector(upDateSaveData), for: .touchUpInside)
        view.addSubview(saveButton)
       
         nsLoyoutConstraint()
        upDateSaveData()
        
        if let data = UserDefaults.standard.data(forKey: KeyData.studentData){
            savedData = (try? JSONDecoder().decode(UserData.self, from: data)) ?? UserData()
        }
        
    }

    @objc private func upDateSaveData() {
        if let savedName = savedData.studentName {
            titilelable.text = "Saved name: \(savedName)"
            
        } else {
            titilelable.text = "Name is not set"
        }
        
        if let savedAge = savedData.studentAge{
            agelable.text = "Saved age: \(savedAge)"
        } else {
            agelable.text = "Age is not set"
        }
    }
    
  
    
    func nsLoyoutConstraint(){
        view.addSubview(titilelable)
        view.addSubview(fieldTitle)
        view.addSubview(agelable)
        view.addSubview(ageText)
       
        NSLayoutConstraint.activate([
            titilelable.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            titilelable.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            fieldTitle.topAnchor.constraint(equalTo: titilelable.bottomAnchor, constant: 15),
            fieldTitle.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            agelable.topAnchor.constraint(equalTo: fieldTitle.bottomAnchor, constant: 30),
            agelable.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            ageText.topAnchor.constraint(equalTo: agelable.bottomAnchor, constant: 15),
            ageText.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            saveButton.heightAnchor.constraint(equalToConstant: 30),
            saveButton.widthAnchor.constraint(equalToConstant: 100),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            
        ])
    }
}
    

extension ViewControllers: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == fieldTitle {
            savedData.studentName = textField.text
        } else {
            savedData.studentAge = Int(textField.text ?? "")
        }
        if let data = try? JSONEncoder().encode(savedData) {
            UserDefaults.standard.set(data, forKey: KeyData.studentData)
        }
        
        textField.resignFirstResponder()
        textField.text = nil
        return true
    }
}
