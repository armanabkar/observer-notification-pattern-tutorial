//
//  ViewController.swift
//  delegate-pattern-tutorial
//
//  Created by Arman Abkar on 11/11/21.
//

import UIKit

// Global should be avoided
let bornToDieNotificationKey = "co.armanabkar.borntodie"
let ultraviolenceNotificationKey = "co.armanabkar.ultraviolence"

class BaseScreen: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var chooseButton: UIButton!
    
    let bornToDie = Notification.Name(rawValue: bornToDieNotificationKey)
    let ultraviolence = Notification.Name(rawValue: ultraviolenceNotificationKey)
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createObservers()
    }
    
    func createObservers() {
        // bornToDie
        NotificationCenter.default.addObserver(self, selector: #selector(BaseScreen.updateImage(notification:)), name: bornToDie, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(BaseScreen.updateLabel(notification:)), name: bornToDie, object: nil)
        
        // ultraviolence
        NotificationCenter.default.addObserver(self, selector: #selector(BaseScreen.updateImage(notification:)), name: ultraviolence, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(BaseScreen.updateLabel(notification:)), name: ultraviolence, object: nil)
    }
    
    @objc func updateImage(notification: NSNotification) {
        let isBornToDie = notification.name == bornToDie
        let image = isBornToDie ? UIImage(named: "borntodie")! : UIImage(named: "ultraviolence")!
        mainImageView.image = image
    }
    
    @objc func updateLabel(notification: NSNotification) {
        let isBornToDie = notification.name == bornToDie
        let name = isBornToDie ? "Born To Die" : "Ultraviolence"
        nameLabel.text = name
    }

    @IBAction func chooseButtonTapped(_ sender: UIButton) {
        let selectionVC = storyboard?.instantiateViewController(withIdentifier: "SelectionScreen") as! SelectionScreen
        present(selectionVC, animated: true, completion: nil)
    }
    
}
