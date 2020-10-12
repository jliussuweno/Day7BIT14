//
//  ImageViewController.swift
//  Day7BIT14
//
//  Created by Jlius Suweno on 07/10/20.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var cityImageView: UIImageView!
    var nameImage = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(notificationReceived(_:)), name: NotificationTopic.notificationBroadcast, object: nil)
        cityImageView.image = UIImage(named: nameImage)
    }
    @objc func notificationReceived(_ notification: Notification){
        
        if let userInfoPayLoad = notification.userInfo {
            cityImageView.image = UIImage(named: (userInfoPayLoad["imageName"] as! String))
        }
    }
    
    
}
