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
    
    var player: AVAudioPlayer!
    
    let keys = ["C", "D", "E", "F", "G", "A", "B"]
    
    static let screenWidth: CGFloat  = UIScreen.main.bounds.width
    static let screenHeight: CGFloat = UIScreen.main.bounds.height
    
    let horizontialCenter: CGFloat = screenWidth/2
    let verticalDistance: CGFloat  = screenHeight/8

    override func viewDidLoad() {
        super.viewDidLoad()
        makeKeys(7)
        
//        let key = UIButton(type: .custom)
//        key.frame = CGRect(x: 0, y: 0, width: 320, height: 80)
//        key.backgroundColor = .random
//        key.setTitle("C", for: .normal)
//        key.setTitle("C", for: .highlighted)
//        view.addSubview(key)
//        key.addTarget(self, action: #selector(keyPlay(_:)), for: .touchDown)
        
//        key = UIButton(type: .custom)
//        key.frame = CGRect(x: 20, y: 140, width: 360, height: 80)
//        key.backgroundColor = .random
//        key.setTitle("D", for: .normal)
//        key.setTitle("D", for: .highlighted)
//        view.addSubview(key)
//        key.addTarget(self, action: #selector(keyPlay(_:)), for: .touchDown)
//
//        key = UIButton(type: .custom)
//        key.frame = CGRect(x: 20, y: 230, width: 340, height: 80)
//        key.backgroundColor = .random
//        key.setTitle("E", for: .normal)
//        key.setTitle("E", for: .highlighted)
//        view.addSubview(key)
//        key.addTarget(self, action: #selector(keyPlay(_:)), for: .touchDown)
//
//        key = UIButton(type: .custom)
//        key.frame = CGRect(x: 20, y: 320, width: 320, height: 80)
//        key.backgroundColor = .random
//        key.setTitle("F", for: .normal)
//        key.setTitle("F", for: .highlighted)
//        view.addSubview(key)
//        key.addTarget(self, action: #selector(keyPlay(_:)), for: .touchDown)
//
//        key = UIButton(type: .custom)
//        key.frame = CGRect(x: 20, y: 410, width: 300, height: 80)
//        key.backgroundColor = .random
//        key.setTitle("G", for: .normal)
//        key.setTitle("G", for: .highlighted)
//        view.addSubview(key)
//        key.addTarget(self, action: #selector(keyPlay(_:)), for: .touchDown)
//
//        key = UIButton(type: .custom)
//        key.frame = CGRect(x: 20, y: 500, width: 280, height: 80)
//        key.backgroundColor = .random
//        key.setTitle("A", for: .normal)
//        key.setTitle("A", for: .highlighted)
//        view.addSubview(key)
//        key.addTarget(self, action: #selector(keyPlay(_:)), for: .touchDown)
//
//        key = UIButton(type: .custom)
//        key.frame = CGRect(x: 20, y: 590, width: 260, height: 80)
//        key.backgroundColor = .random
//        key.setTitle("B", for: .normal)
//        key.setTitle("B", for: .highlighted)
//        view.addSubview(key)
//        key.addTarget(self, action: #selector(keyPlay(_:)), for: .touchDown)
    }
    
    func makeKeys(_ number: Int) {
        
        for i in 1...number {
            
            var distance = 0
            distance += i
            
            var newWidth = 400
            newWidth -= 20
            
            let btnFrame: CGRect = CGRect(x: 10, y: 100, width: newWidth, height: 100)
            let btnCenter: CGPoint = CGPoint(x: horizontialCenter, y: CGFloat(distance)*verticalDistance)
            let btnBgColor: UIColor = UIColor.random
            let btnTitle: String = keys[i-1]
            let btnTitleColor: UIColor = UIColor.white
            let btnTitleFont: UIFont = UIFont.boldSystemFont(ofSize: 35)
            
            let customButton: UIButton = createButtonByType(btnType: UIButton.ButtonType.custom, btnFrame: btnFrame, btnCenter: btnCenter, bgColor: btnBgColor, title: btnTitle, titleColor: btnTitleColor, titleFont: btnTitleFont)
            
            self.view.addSubview(customButton)
            customButton.addTarget(self, action: #selector(keyPlay(_:)), for: .touchDown)
        }
}
    
    func createButtonByType(btnType:UIButton.ButtonType, btnFrame:CGRect, btnCenter: CGPoint, bgColor: UIColor, title: String, titleColor: UIColor, titleFont: UIFont) -> UIButton {
        
        // Create the button with the button type.
        let btn:UIButton = UIButton(type: btnType)
        
        // Set button frame.
        btn.frame = btnFrame
        
        // Set button center point location.
        btn.center = btnCenter
        
        // Set button background color.
        btn.backgroundColor = bgColor
        
        // Set button title.
        btn.setTitle(title, for: UIControl.State.normal)
        
        // Set button title color.
        btn.setTitleColor(titleColor, for: UIControl.State.normal)
        
        // Set button title font.
        btn.titleLabel?.font = titleFont
        
        // Return the created button object.
        return btn
        
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

extension UIColor {
    static var random: UIColor {
        return .init(hue: .random(in: 0...1), saturation: 1, brightness: 1, alpha: 1)
    }
}
