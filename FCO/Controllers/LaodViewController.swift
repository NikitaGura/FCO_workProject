//
//  LaodViewController.swift
//  FCO
//
//  Created by Nikita Gura on 12.01.2019.
//  Copyright © 2019 Nikita Gura. All rights reserved.
//

import UIKit
import Firebase

class LaodViewController: UIViewController {
    @IBOutlet fileprivate weak var Gif: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
 
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.Gif.loadGif(name: "giphy")
        Messaging.messaging().subscribe(toTopic: "fco") { error in
            print("Subscribed to fco topic")
        }
        UIView.animate(withDuration: 4.5, delay: 0, animations: {
            self.view.tintColor = .blue
        }){
            (success) in
            
                let sb = UIStoryboard(name: "Main" , bundle: nil)
                let vc = sb.instantiateInitialViewController()
                UIApplication.shared.keyWindow?.rootViewController = vc
        }
    }


}
