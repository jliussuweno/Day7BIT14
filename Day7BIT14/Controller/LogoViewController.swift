//
//  LogoViewController.swift
//  Day7BIT14
//
//  Created by Jlius Suweno on 07/10/20.
//

import UIKit

class LogoViewController: UIViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    var logoName = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(notificationReceived(_:)), name: NotificationTopic.notificationBroadcast, object: nil)
        logoImageView.image = UIImage(named: logoName)
    }
    
    @objc func notificationReceived(_ notification: Notification){
        
        if let userInfoPayLoad = notification.userInfo {
            logoImageView.image = UIImage(named: (userInfoPayLoad["logoName"] as! String))
        }
    }


}
