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
    }
    // Creating UI w/ keys
    func makeKeys(_ key: Int) {
        
        for key in 1...key {
            // Counter for adding distnace between keys
            var distance = 0
            distance += key
            
            let btnFrame: CGRect = CGRect(x: 10, y: 100, width: 400, height: 100)
            let btnCenter: CGPoint = CGPoint(x: horizontialCenter, y: CGFloat(distance)*verticalDistance)
            let btnBgColor: UIColor = UIColor.random
            
            // Creating key title from a soundkeys array
            let btnTitle: String = keys[key-1]
            let btnTitleColor: UIColor = UIColor.white
            let btnTitleFont: UIFont = UIFont.boldSystemFont(ofSize: 35)
            
            let customButton: UIButton = createKey(btnType: UIButton.ButtonType.custom, btnFrame: btnFrame, btnCenter: btnCenter, bgColor: btnBgColor, title: btnTitle, titleColor: btnTitleColor, titleFont: btnTitleFont)
            
            self.view.addSubview(customButton)
            customButton.addTarget(self, action: #selector(keyPlay(_:)), for: .touchDown)
        }
}
    // Creating a key based on UIButton
    func createKey(btnType:UIButton.ButtonType, btnFrame:CGRect, btnCenter: CGPoint, bgColor: UIColor, title: String, titleColor: UIColor, titleFont: UIFont) -> UIButton {
        
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
    // Matching title with sound names and playing sounds.
    @objc func keyPlay(_ sender: UIButton) {
        playSound(forKey: sender.currentTitle!)
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1.0
        }
    }
    
    //Playing sounds
    func playSound(forKey soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
    }
}
// Extending UI color to generate random plain colors.
extension UIColor {
    static var random: UIColor {
        return .init(hue: .random(in: 0...1), saturation: 1, brightness: 1, alpha: 1)
    }
}
