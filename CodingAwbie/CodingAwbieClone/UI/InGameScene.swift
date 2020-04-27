//
//  InGameScene.swift
//  CodingAwbieClone
//
//  Created by Huynh Lam Phu Si on 3/2/20.
//  Copyright © 2020 Huynh Lam Phu Si. All rights reserved.
//

import Foundation
import SpriteKit

enum GameState: Int {
    case preGame = 0
    case inGame
    case paused
    case postGame
    static let Count = postGame.rawValue + 1
}

protocol GameUIState: NSObjectProtocol {
    var score: Int {get}
    var coinsCollected: Int {get}
    var bananasCollected: Int {get}
    var turnRemaining: Int {get}
    var scoreLabelLocation: CGPoint {get set}
}

class InGameScene: SKScene {
    var scoreLabelValue: SKLabelNode
    var scoreLabelValueShadow: SKLabelNode!
    
    private var gameState: GameState = .preGame
    
    var gameStateDelegate: GameUIState?
    
    private var turnLabelValue: SKLabelNode
    private var turnLavelValueShadow: SKLabelNode!
    private var scoreLabel: SKLabelNode
    private var scoreLabelShadow: SKLabelNode!
    private var turnLabel: SKLabelNode
    private var turnLabelShadow: SKLabelNode!
    
    private var menuNode: MainMenu?
    private var pauseNode: PauseMenu?
    
    //FIXME: Implement post node to use this class
    //private var postNode: PostMenu?
    
    override init(size: CGSize) {
        self.turnLabel = InGameScene.labelWithText("Turn remaing:", andSize: 24)
        turnLabelValue = InGameScene.labelWithText("14", andSize: 20)
        self.scoreLabel = InGameScene.labelWithText("Score", andSize: 24)
        scoreLabelValue = InGameScene.labelWithText("0", andSize: 24)
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //FIXME: Implement this function
    private func willSetGameState(_ newState: GameState) {
        
    }
    
    //FIXME: Implement this function
    private func hideGameUI(_ hide: Bool) {
        
    }
    
    //FIXME: Adjust font, font color, font size
    class func labelWithText(_ text: String, andSize textSize: CGFloat) -> SKLabelNode {
        let fontName = "Optima-ExtraBlack"
        let myLabel = SKLabelNode(fontNamed: fontName)
        myLabel.text = text
        myLabel.fontSize = textSize
        myLabel.fontColor = SKColor.yellow
        return myLabel
    }
    
    @discardableResult class func dropShadowOnLabel(_ frontLabel: SKLabelNode) -> SKLabelNode {
        let myLabelBackground = frontLabel.copy() as! SKLabelNode
        myLabelBackground.isUserInteractionEnabled = true
        myLabelBackground.fontColor = SKColor.black
        myLabelBackground.position = CGPoint(x: 2 + frontLabel.position.x, y: -2 + frontLabel.position.y)
        myLabelBackground.zPosition = frontLabel.zPosition - 1
        frontLabel.parent?.addChild(myLabelBackground)
        return myLabelBackground
    }
    
    override func update(_ currentTime: TimeInterval) {
        self.gameStateDelegate?.scoreLabelLocation = self.scoreLabelValue.position
    }
    
    //FIXME: Implement this function
    func touchUpAtPoint(_ location: CGPoint) {
        
    }
}
