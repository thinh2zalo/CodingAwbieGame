//
//  Button.swift
//  CodingAwbieClone
//
//  Created by Huynh Lam Phu Si on 3/2/20.
//  Copyright © 2020 Huynh Lam Phu Si. All rights reserved.
//

import Foundation
import SpriteKit

class Button: SKNode {
    var width: CGFloat {
        return size.width
    }
    var size = CGSize.zero
    var label: SKLabelNode?
    var background: SKSpriteNode?
    private(set) var actionClicked: Selector?
    private(set) var targetClicked: Any?
    
    func setText(_ text: String) {
        label?.text = text
    }
    
    func setBackgroundColor(_ color: SKColor) {
        guard let background = background else { return }
        background.color = color
    }
    
    func setClickTarget(_ target: Any, action: Selector) {
        targetClicked = target
        actionClicked = action
    }
    
    init(text txt: String) {
        super.init()
        let fontName: String = "Optima-ExtraBlack"
        label = SKLabelNode(fontNamed: fontName)
        label?.text = txt
        label?.fontSize = 18
        label?.fontColor = SKColor.white
        label?.position = CGPoint(x: CGFloat.zero, y: CGFloat(-8.0))
        
        size = CGSize(width: CGFloat((label?.frame.size.width)! + 10), height: CGFloat(30.0))
        background = SKSpriteNode(color: SKColor(red: CGFloat(0), green: CGFloat(0), blue: CGFloat(0), alpha: CGFloat(0.75)), size: size)
        
        addChild(background!)
        addChild(label!)
        isUserInteractionEnabled = true
    }
    
    init(withNode node: SKNode) {
        super.init()
        isUserInteractionEnabled = true
        size = node.frame.size
        addChild(node)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        _ = (targetClicked! as AnyObject).perform(actionClicked, with: self)
    }
}
