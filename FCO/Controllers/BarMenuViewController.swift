//
//  BarMenuViewController.swift
//  FCO
//
//  Created by Nikita Gura on 13.01.2019.
//  Copyright © 2019 Nikita Gura. All rights reserved.
//

import UIKit
import ARKit
import SceneKit
import AVFoundation
import AVKit

final class BarMenuViewController: UIViewController, ARSCNViewDelegate {

    // MARK: outlets
    
    @IBOutlet fileprivate weak var cameraAr: ARSCNView!
    @IBOutlet fileprivate weak var whiteView: UIView!
    @IBOutlet fileprivate weak var cameraImage: UIImageView!
    @IBOutlet fileprivate weak var label: UILabel!
    
    // MARK: def
    
    fileprivate var flagCamera = false
    fileprivate let avPlayerViewController = AVPlayerViewController()
    fileprivate var avPlayer: AVPlayer?
    
    // MARK: link vidoes
    
    fileprivate let link: [String : String] = ["logoar":"http://bridgging.org/url",
                                               "first":"http://bridgging.org/url",
                                               "second":"http://bridgging.org/url",
                                               "third":"http://bridgging.org/url",
                                               "fourth":"http://bridgging.org/url",
                                               "fifth":"http://bridgging.org/url",
                                               "sixth":"http://bridgging.org/url",
                                               "seventh":"http://bridgging.org/url",
                                               "eighth":"http://bridgging.org/url",
                                               "ninth":"http://bridgging.org/url",
                                               "tenth":"http://bridgging.org/url"
                                               ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cameraAr.delegate = self
        cameraAr.autoenablesDefaultLighting = true
    
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        
        self.whiteView.addGestureRecognizer(tap)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hideCamera(isHidden: flagCamera)
        flagCamera = !flagCamera
        let configuration = ARImageTrackingConfiguration()
        
        if let imagesTracking = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: Bundle.main){
            configuration.trackingImages = imagesTracking
            configuration.maximumNumberOfTrackedImages = 1
        }
        
        cameraAr.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        cameraAr.session.pause()
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer? = nil) {
      hideCamera(isHidden: flagCamera)
      flagCamera = !flagCamera
        
    
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    @IBAction func followSite(_ sender: Any) {
        guard let url = URL(string: "https://fco.com.ua") else { return }
        UIApplication.shared.open(url)
    }
    
    @IBAction func helpCamera(_ sender: Any) {
        
          hideCamera(isHidden: flagCamera)
          flagCamera = !flagCamera
    }
    
    @IBAction func cleanCamera(_ sender: Any) {
        
        hideCamera(isHidden: true)
        flagCamera = false
    }
    
    fileprivate func hideCamera(isHidden: Bool){
        UIView.transition(with: view, duration: 0.5, options: .transitionCrossDissolve, animations: {
            self.whiteView.isHidden = isHidden
            self.cameraImage.isHidden = isHidden
            self.label.isHidden = isHidden
        })
    }
    
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        if let imageAnchor = anchor as? ARImageAnchor{
            if let imageName = imageAnchor.referenceImage.name {
                let movieUrl = URL(string: link[imageName]!);
                if let url = movieUrl {
                    self.avPlayer = AVPlayer(url: url)
                    self.avPlayerViewController.player = self.avPlayer
                    self.present(avPlayerViewController, animated: true, completion: {
                          self.avPlayerViewController.player?.pause()
                        self.avPlayerViewController.player?.play()
                        
                    } )
                }
            }
        }
        return nil
    }
    
}
