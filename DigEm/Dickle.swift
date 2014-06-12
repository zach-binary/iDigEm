//
//  Dickle.swift
//  DigEm
//
//  Created by Zach on 6/10/14.
//  Copyright (c) 2014 Zach. All rights reserved.
//

import SpriteKit

class Dickle : SKNode {
    let sprite: SKSpriteNode
    let movementSpeed: CGFloat = 500
    
    init() {
        let atlas = SKTextureAtlas(named: "dickle")
        let animation = SKAction.animateWithTextures(atlas.getTextureArray(), timePerFrame: 1)
        
        sprite = SKSpriteNode(texture: atlas.textureNamed("dickle0000"))
        sprite.runAction(SKAction.repeatActionForever(animation))
        
        super.init()
        
        self.physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: 56, height: 56))
        self.addChild(sprite)
    }
    
    func moveTo(point: CGPoint) {
        let duration = self.distanceTo(point) / self.movementSpeed
        let action = SKAction.moveTo(point, duration: NSTimeInterval(duration))
        self.removeActionForKey("Moving")
        self.runAction(action, withKey: "Moving")
    }
}
