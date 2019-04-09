//
//  InfoViewController.swift
//  FCO
//
//  Created by Nikita Gura on 12.01.2019.
//  Copyright © 2019 Nikita Gura. All rights reserved.
//

import UIKit

final class InfoViewController: UIViewController {
    //MARK: -outlets
    @IBOutlet fileprivate weak var leftImageBottom: UIImageView!
    @IBOutlet fileprivate weak var rightImageBottom: UIImageView!
    @IBOutlet fileprivate weak var wall: UIImageView!
    @IBOutlet fileprivate weak var logoBig: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reconizeImage(image: leftImageBottom, tapGestureRecognizer: UITapGestureRecognizer(target: self, action: #selector(imageTappedFCO(tapGestureRecognizer:))))
        reconizeImage(image: rightImageBottom, tapGestureRecognizer: UITapGestureRecognizer(target: self, action: #selector(imageTappedUKR(tapGestureRecognizer:))))
        reconizeImage(image: wall, tapGestureRecognizer: UITapGestureRecognizer(target: self, action: #selector(imageTappedFirm(tapGestureRecognizer:))))
        reconizeImage(image: logoBig, tapGestureRecognizer: UITapGestureRecognizer(target: self, action: #selector(imageTappedFirm(tapGestureRecognizer:))))
    }
    
    
    @objc func imageTappedFirm(tapGestureRecognizer: UITapGestureRecognizer)
    {
        followToLink(ling: "http://bridgging.org")
    }
    
    @objc func imageTappedFCO(tapGestureRecognizer: UITapGestureRecognizer)
    {
        followToLink(ling: "https://fco.com.ua")
    }
    
    @objc func imageTappedUKR(tapGestureRecognizer: UITapGestureRecognizer)
    {
        followToLink(ling: "http://ukragrocom.com")
    }
    
    //MARK: methods
    
    fileprivate func followToLink(ling: String){
        guard let url = URL(string: ling) else { return }
        UIApplication.shared.open(url)
    }
    
    fileprivate func reconizeImage(image: UIImageView, tapGestureRecognizer: UITapGestureRecognizer){
        image.isUserInteractionEnabled = true
        image.addGestureRecognizer(tapGestureRecognizer)
    }
    
    //MARK: actions
  
    
    @IBAction func followSiteDev(_ sender: Any) {
        followToLink(ling: "http://bridgging.org")
    }
    
    @IBAction func dissmis(_ sender: Any)
    {
        dismiss(animated: true)
    }
}
