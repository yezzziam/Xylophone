//
//  ViewController.swift
//  Xylophone
//
//  Created by Yegor Zubarets on 1/31/20.
//  Copyright © 2020 Yegor Zubarets. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var key = UIButton()
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        key = UIButton(type: .custom)
        key.frame = CGRect(x: 100, y: 100, width: 200, height: 80)
        key.backgroundColor = .blue
        key.setTitle("C", for: .normal)
        key.setTitle("C", for: .highlighted)
        view.addSubview(key)
        key.addTarget(self, action: #selector(keyPlay(_:)), for: .touchDown)
        
    }
    
    @objc func keyPlay(_ sender: UIButton) {
        playSound(forKey: sender.currentTitle!)
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1.0
        }
    }
    
    func playSound(forKey soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
    }


}

