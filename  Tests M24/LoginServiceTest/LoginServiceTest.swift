
import XCTest
@testable import SkillboxTesting

final class LoginServiceTest: XCTestCase {

    var loginsevice: LoginService!
    
    override func setUp() {
        loginsevice = LoginService()
    }

    override func tearDown() {
        loginsevice = nil
    }
    
    func test_login_is_ok() {
        //given
        let login = "login@mail.ru"
        let password = "Qwerty1"
        let password2 = "Qwerty1"
        
        //when
        
        let  serviceTest = loginsevice.checkCredentials(login: login, password: password, password2: password2)
        
        // then
        XCTAssertEqual(serviceTest, .correct)
        
    }
    
    func test_login_invalidLogin() {
        //given
        let login = "mailru"
        let password = "Qwerty1"
        let password2 = "Qwerty1"
        
        //when
        
        let  serviceTest = loginsevice.checkCredentials(login: login, password: password, password2: password2)
        
        // then
        XCTAssertEqual(serviceTest, .invalidLogin)
        
    }
    
    func test_shortpassword() {
        let login = "login@mail.ru"
        let password = "Qwer"
        let password2 = "Qwer"
        
        //when
        
        let  serviceTest = loginsevice.checkCredentials(login: login, password: password, password2: password2)
        
        // then
        XCTAssertEqual(serviceTest, .shortPassword)
        
    }
    
    func test_passwordNotUppercased() {
        let login = "login@mail.ru"
        let password = "qwerty1"
        let password2 = "qwerty1"
        
        //when
        
        let  serviceTest = loginsevice.checkCredentials(login: login, password: password, password2: password2)
        
        // then
        XCTAssertEqual(serviceTest, .passwordNotUppercased)
        
    }
    
    func test_passwordNotLowercased() {
        //given
        let login = "login@mail.ru"
        let password = "QWERTY1"
        let password2 = "QWERTY1"
        
        //when
        
        let  serviceTest = loginsevice.checkCredentials(login: login, password: password, password2: password2)
        
        // then
        XCTAssertEqual(serviceTest, .passwordNotLowercased)
    }
    
    func test_passworNotHaveDigits() {
        //given
        let login = "login@mail.ru"
        let password = "Qwerty"
        let password2 = "Qwerty"
        
        //when
        
        let  serviceTest = loginsevice.checkCredentials(login: login, password: password, password2: password2)
        
        // then
        XCTAssertEqual(serviceTest, .passworNotHaveDigits)
    }
    
    func test_passwordMissmach() {
        //given
        let login = "login@mail.ru"
        let password = "Qwerty"
        let password2 = "Qwerta"
        
        //when
        
        let  serviceTest = loginsevice.checkCredentials(login: login, password: password, password2: password2)
        
        // then
        XCTAssertEqual(serviceTest, .passworNotHaveDigits)
    }
    
    func test_invalidatePassword() {
        //given
        let login = "login@mail.ru"
        let password = "1Password\u{FFFF}"
        let password2 = "1Password\u{FFFF}"
       
        //when
        let  serviceTest = loginsevice.checkCredentials(login: login, password: password, password2: password2)
        
        // then
        XCTAssertEqual(serviceTest, .passwordHasIllegalCharacters)
    }
    
    
}
