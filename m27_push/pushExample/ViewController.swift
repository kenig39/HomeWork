
import UIKit
import UserNotifications

final class ViewController: UIViewController {
    
    
    let pushButton = UIButton()
    let clearButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
    
        checkToPush()
        buttonPush()
        settingUI()
      
    }
    
    func buttonPush() {
        
        pushButton.setTitle("Reminder", for: .normal)
        pushButton.setTitleColor(.green, for: .normal)
        pushButton.backgroundColor = UIColor.red
        pushButton.layer.cornerRadius = 6
       

        clearButton.setTitle("Clear", for: .normal)
        clearButton.setTitleColor(.green, for: .normal)
        clearButton.backgroundColor = UIColor.gray
        clearButton.layer.cornerRadius = 6
        
        [clearButton, pushButton].forEach { views in
            views.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(views)
        }
        
        pushButton.addTarget(self, action: #selector(checkToPush), for: .touchUpInside)
        clearButton.addTarget(self, action: #selector(clearReminder), for: .touchUpInside)
        
        
    }
    
    
    @objc func checkToPush() {
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.getNotificationSettings { settings in
            switch settings.authorizationStatus {
            case.authorized:
                self.diaspatchNatification()
            case.denied:
                return
            case.notDetermined:
                notificationCenter.requestAuthorization(options: [.alert, .sound, .badge]) { didAllow, error in
                    if didAllow{
                        self.diaspatchNatification()
                    }
                }
            default:
                return
            }
            
        }
        
    }
    
    @objc func clearReminder() {
        
        let notification = UNUserNotificationCenter.current()
        notification.removeAllPendingNotificationRequests()
        
        
    }
    
    
    func diaspatchNatification() {
        let identifire = "my-notifcation"
        let title = "Cкоро спать ложиться"
        let body = "Долго не сиди"
        let second = 10
        let isDaily = true
        
        let notificationCenter = UNUserNotificationCenter.current()
        
        let content  = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = .defaultRingtone
        
        let calendar = Calendar.current
        var dateComponent = DateComponents(calendar: calendar, timeZone: TimeZone.current)
        dateComponent.second = second
    
        let triger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: isDaily)
        let request = UNNotificationRequest(identifier: identifire, content: content, trigger: triger)
        notificationCenter.removePendingNotificationRequests(withIdentifiers: [identifire])
        notificationCenter.add(request)
    }
    
    func settingUI() {
        pushButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200).isActive = true
        pushButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pushButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        pushButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        clearButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        clearButton.topAnchor.constraint(equalTo: pushButton.bottomAnchor, constant: 10).isActive = true
        clearButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        clearButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
}

