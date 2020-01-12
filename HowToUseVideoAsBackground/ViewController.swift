//
//  ViewController.swift
//  HowToUseVideoAsBackground
//
//  Created by Ramill Ibragimov on 12.01.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var videoLayer: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var signUp: UIButton!
    @IBOutlet weak var singIn: UIButton!
    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playVideo()
    }
    
    func playVideo() {
        guard let path = Bundle.main.path(forResource: "intro", ofType: "mp4") else { return }
        
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.bounds
        playerLayer.videoGravity = .resizeAspectFill
        self.videoLayer.layer.addSublayer(playerLayer)
        
        player.play()
        
        videoLayer.bringSubviewToFront(label)
        videoLayer.bringSubviewToFront(signUp)
        videoLayer.bringSubviewToFront(singIn)
        videoLayer.bringSubviewToFront(stackView)
    }

}

