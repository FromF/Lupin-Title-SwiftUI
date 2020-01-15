//
//  LupinTitleViewModel.swift
//  Lupin-Title
//
//  Created by 藤治仁 on 2020/01/15.
//  Copyright © 2020 F-Works. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class LupinTitleViewModel: NSObject, ObservableObject {
    @Published var title:String?
    @Published var typeWrite:String = ""
    @Published var isTyping:Bool = false
    
    //音楽：魔王魂 - 銃03
    private let titleSound = try! AVAudioPlayer(data: NSDataAsset(name: "se_maoudamashii_battle_gun03")!.data)
    //音楽：魔王魂 - 点火04
    private let typewriter = try! AVAudioPlayer(data: NSDataAsset(name: "se_maoudamashii_se_ignition04")!.data)
    
    func startTitleCall() {
        guard let title = self.title else { return }
        
        titleSound.prepareToPlay()
        typewriter.prepareToPlay()
        
        DispatchQueue.global().async {
            DispatchQueue.main.sync {
                self.isTyping = true
            }
            
            for string in title {
                Thread.sleep(forTimeInterval: 0.15)
                self.titleSound.stop()
                self.titleSound.play()
                DispatchQueue.main.sync {
                    self.typeWrite = String(string)
                }
            }
            Thread.sleep(forTimeInterval: 0.15)
            self.titleSound.stop()
            self.typewriter.play()
            DispatchQueue.main.sync {
                self.typeWrite = title
            }
            Thread.sleep(forTimeInterval: 2)
            DispatchQueue.main.sync {
                self.isTyping = false
                self.typeWrite = ""
            }
        }
    }
    
}
