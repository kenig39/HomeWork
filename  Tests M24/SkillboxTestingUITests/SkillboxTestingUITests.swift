//
//  SkillboxTestingUITests.swift
//  SkillboxTestingUITests
//
//  Created by Alexander on 13.11.2023.
//

import XCTest

final class SkillboxTestingUITests: XCTestCase {
        
        var app: XCUIApplication!
        
        override func setUp(){
            continueAfterFailure = false
            app = XCUIApplication()
            app.launch()
        }
        
        override func tearDown() {
            app.terminate()
        }
        
        func test_succesfylyRegister() {
            //given
            let logintextField = app.textFields["loginTextField"]
            let passwordTextField = app.textFields["passwordTextField"]
            let repitTextFild = app.textFields["repitPasswordTextField"]
            let button = app.buttons["buttonRegister"]
            let lable = app.staticTexts["text"]
            
            //when
            logintextField.tap()
            logintextField.typeText("login@mail.ru")
            passwordTextField.tap()
            passwordTextField.typeText("Qwerty1")
            repitTextFild.tap()
            repitTextFild.typeText("Qwerty1")
            button.tap()
            
            //then
            XCTAssertEqual(lable.label, "You are successfully registered!")
            
        }
        
        func test_InvalidLogin() {
            //given
            let logintextField = app.textFields["loginTextField"]
            let passwordTextField = app.textFields["passwordTextField"]
            let repitTextFild = app.textFields["repitPasswordTextField"]
            let button = app.buttons["buttonRegister"]
            let lable = app.staticTexts["text"]
            
             //when
            logintextField.tap()
            logintextField.typeText("mail.ru")
            passwordTextField.tap()
            passwordTextField.typeText("Qwerty1")
            repitTextFild.tap()
            repitTextFild.typeText("Qwerty1")
            button.tap()
     
            //then
            XCTAssertEqual(lable.label, "Enter correct email")
        }
        
        func test_passwordNotUpperCase() {
            //given
            let logintextField = app.textFields["loginTextField"]
            let passwordTextField = app.textFields["passwordTextField"]
            let repitTextFild = app.textFields["repitPasswordTextField"]
            let button = app.buttons["buttonRegister"]
            let lable = app.staticTexts["text"]
            
             //when
            logintextField.tap()
            logintextField.typeText("login@mail.ru")
            passwordTextField.tap()
            passwordTextField.typeText("werty1")
            repitTextFild.tap()
            repitTextFild.typeText("werty1")
            button.tap()
   
            //then
            XCTAssertEqual(lable.label, "Password should have at least one upper letter")
        }
        
        func test_passwordHaventLowerLetter() {
            //given
            let logintextField = app.textFields["loginTextField"]
            let passwordTextField = app.textFields["passwordTextField"]
            let repitTextFild = app.textFields["repitPasswordTextField"]
            let button = app.buttons["buttonRegister"]
            let lable = app.staticTexts["text"]
            
             //when
            logintextField.tap()
            logintextField.typeText("login@mail.ru")
            passwordTextField.tap()
            passwordTextField.typeText("QWERTY1")
            repitTextFild.tap()
            repitTextFild.typeText("QWERTY1")
            button.tap()
   
            //then
            XCTAssertEqual(lable.label, "Password should have at least one lower letter")
        }
        
        
        func test_passwordHaventDigits() {
            //given
            let logintextField = app.textFields["loginTextField"]
            let passwordTextField = app.textFields["passwordTextField"]
            let repitTextFild = app.textFields["repitPasswordTextField"]
            let button = app.buttons["buttonRegister"]
            let lable = app.staticTexts["text"]
            
             //when
            logintextField.tap()
            logintextField.typeText("login@mail.ru")
            passwordTextField.tap()
            passwordTextField.typeText("Qwerty")
            repitTextFild.tap()
            repitTextFild.typeText("Qwerty")
            button.tap()
            
        
            //then
            XCTAssertEqual(lable.label, "Password should have at least one digit")
        }
        
        func test_passworNotEqual() {
            //given
            let logintextField = app.textFields["loginTextField"]
            let passwordTextField = app.textFields["passwordTextField"]
            let repitTextFild = app.textFields["repitPasswordTextField"]
            let button = app.buttons["buttonRegister"]
            let lable = app.staticTexts["text"]
            
             //when
            logintextField.tap()
            logintextField.typeText("login@mail.ru")
            passwordTextField.tap()
            passwordTextField.typeText("Qwerty1")
            repitTextFild.tap()
            repitTextFild.typeText("Qwerty")
            button.tap()
            
            //then
            XCTAssertEqual(lable.label, "Passwords are not identical")
        }
        
        func test_passwordHasIidenticalSymbols() {
            //given
            let logintextField = app.textFields["loginTextField"]
            let passwordTextField = app.textFields["passwordTextField"]
            let repitTextFild = app.textFields["repitPasswordTextField"]
            let button = app.buttons["buttonRegister"]
            let lable = app.staticTexts["text"]
            
             //when
            logintextField.tap()
            logintextField.typeText("login@mail.ru")
            passwordTextField.tap()
            passwordTextField.typeText("1Password\u{FFFF}")
            repitTextFild.tap()
            repitTextFild.typeText("1Password\u{FFFF}")
            button.tap()
            
            //then
            XCTAssertEqual(lable.label, "Password contains illegal characters")
                          
        }
      
    }

