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
        key.frame = CGRect(x: 20, y: 50, width: 380, height: 80)
        key.backgroundColor = .blue
        key.setTitle("C", for: .normal)
        key.setTitle("C", for: .highlighted)
        view.addSubview(key)
        key.addTarget(self, action: #selector(keyPlay(_:)), for: .touchDown)
        
        key = UIButton(type: .custom)
        key.frame = CGRect(x: 20, y: 140, width: 340, height: 80)
        key.backgroundColor = .green
        key.setTitle("D", for: .normal)
        key.setTitle("D", for: .highlighted)
        view.addSubview(key)
        key.addTarget(self, action: #selector(keyPlay(_:)), for: .touchDown)
        
        key = UIButton(type: .custom)
        key.frame = CGRect(x: 20, y: 230, width: 300, height: 80)
        key.backgroundColor = .yellow
        key.setTitle("E", for: .normal)
        key.setTitle("E", for: .highlighted)
        view.addSubview(key)
        key.addTarget(self, action: #selector(keyPlay(_:)), for: .touchDown)
        
        key = UIButton(type: .custom)
        key.frame = CGRect(x: 20, y: 320, width: 260, height: 80)
        key.backgroundColor = .red
        key.setTitle("F", for: .normal)
        key.setTitle("F", for: .highlighted)
        view.addSubview(key)
        key.addTarget(self, action: #selector(keyPlay(_:)), for: .touchDown)
        
        key = UIButton(type: .custom)
        key.frame = CGRect(x: 20, y: 410, width: 220, height: 80)
        key.backgroundColor = .purple
        key.setTitle("G", for: .normal)
        key.setTitle("G", for: .highlighted)
        view.addSubview(key)
        key.addTarget(self, action: #selector(keyPlay(_:)), for: .touchDown)
        
        key = UIButton(type: .custom)
        key.frame = CGRect(x: 20, y: 500, width: 180, height: 80)
        key.backgroundColor = .magenta
        key.setTitle("A", for: .normal)
        key.setTitle("A", for: .highlighted)
        view.addSubview(key)
        key.addTarget(self, action: #selector(keyPlay(_:)), for: .touchDown)
        
        key = UIButton(type: .custom)
        key.frame = CGRect(x: 20, y: 590, width: 140, height: 80)
        key.backgroundColor = .cyan
        key.setTitle("B", for: .normal)
        key.setTitle("B", for: .highlighted)
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

