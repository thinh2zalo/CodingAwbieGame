//
//  MainMenu.swift
//  CodingAwbieClone
//
//  Created by Huynh Lam Phu Si on 3/9/20.
//  Copyright © 2020 Huynh Lam Phu Si. All rights reserved.
//

import Foundation
import SpriteKit

class MainMenu: SKNode {
    private var gameLogo: SKSpriteNode
    
    init(size frameSize: CGSize) {
        //TODO: Add Logo image for this
        self.gameLogo = SKSpriteNode(fileNamed: "GameLogo") ?? SKSpriteNode()
        super.init()
        self.position = CGPoint(x: frameSize.width / 2, y: frameSize.height * 0.15)
        self.isUserInteractionEnabled = true
        var size = self.gameLogo.size
        let factor = frameSize.width / size.width
        size.width = size.width * factor
        size.height = size.height * factor
        self.gameLogo.size = size
        
        self.gameLogo.anchorPoint = CGPoint(x: 1, y: 0)
        self.gameLogo.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        self.addChild(self.gameLogo)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func touchUpAtPoint(_ location: CGPoint) {
        self.isHidden = true
    }
}
