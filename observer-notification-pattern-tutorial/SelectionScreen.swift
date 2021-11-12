//
//  SelectionScreen.swift
//  delegate-pattern-tutorial
//
//  Created by Arman Abkar on 11/11/21.
//

import UIKit

class SelectionScreen: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func ultraviolenceTapped(_ sender: Any) {
        let name = Notification.Name(rawValue: ultraviolenceNotificationKey)
        NotificationCenter.default.post(name: name, object: nil)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func bornToDieTapped(_ sender: Any) {
        let name = Notification.Name(rawValue: bornToDieNotificationKey)
        NotificationCenter.default.post(name: name, object: nil)
        dismiss(animated: true, completion: nil)
    }

}
