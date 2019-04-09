//
//  SocialNetViewController.swift
//  FCO
//
//  Created by Nikita Gura on 12.01.2019.
//  Copyright © 2019 Nikita Gura. All rights reserved.
//

import UIKit

final class SocialNetViewController: UIViewController,  UITableViewDelegate, UITableViewDataSource  {
   
    @IBOutlet fileprivate weak var tapView: UIView!
    
    //Mark: array's constants
    fileprivate let arrayImage = ["logo", "facebook", "youtube", "insta" ,"twitter"]
    fileprivate let stringArray = ["Магазин", "Facebook", "Youtube", "Instagram", "Twitter" ]
    fileprivate let arrLink = ["https://shop.fco.com.ua",
                               "https://m.facebook.com/fcolexandria",
                               "https://www.youtube.com/channel/UCHDzcbylV7d69hn1BTnJ_qA",
                               "https://www.instagram.com/fcolexandria/",
                               "https://twitter.com/fco1948"]
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return(stringArray.count)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellSocial", for: indexPath) as! SocialTableViewCell
        cell.imageLogo.text = stringArray[indexPath.row]
        cell.labelText.image = UIImage(named: arrayImage[indexPath.row])!
        return(cell)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        followToLink(ling: arrLink[indexPath.row])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        
        self.tapView.addGestureRecognizer(tap)
    }
    @objc func handleTap(sender: UITapGestureRecognizer? = nil) {
          dismiss(animated: true)
    }
    
    //MARK: methods
    
    fileprivate func followToLink(ling: String){
        guard let url = URL(string: ling) else { return }
        UIApplication.shared.open(url)
    }
    

}
