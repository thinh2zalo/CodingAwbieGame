//
//  Awbie.swift
//  CodingAwbieClone
//
//  Created by Huynh Lam Phu Si on 3/2/20.
//  Copyright © 2020 Huynh Lam Phu Si. All rights reserved.
//

import Foundation
import SceneKit

public enum ActionState {
    case jump
    case walk
    case clap
    case cheer
    case indle
}

class GenericCharacter: SCNNode {
    var animations: [String: SCNAnimation] = [:]
    
    public init(withNode node: SCNNode) {
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadAnimation(_ name: String, andExtension extension: String) {
        
    }
}
