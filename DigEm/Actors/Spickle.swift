//
//  Spickle.swift
//  DigEm
//
//  Created by Zach on 6/18/14.
//  Copyright (c) 2014 Zach. All rights reserved.
//

import SpriteKit

class Spickle : SKNode {
    
    let sprite: SKSpriteNode
    let movementSpeed: CGFloat = 500
    
    init() {
        let atlas = SKTextureAtlas(named: "spickle")
        let animation = SKAction.animateWithTextures(atlas.getTextureArray(), timePerFrame: 1)
        
        sprite = SKSpriteNode(texture: atlas.textureNamed("spickle0000"))
        sprite.runAction(SKAction.repeatActionForever(animation))
        
        super.init()
        
        self.physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: 48, height: 48))
        self.physicsBody.collisionBitMask = 1
        self.physicsBody.contactTestBitMask = 1
        self.physicsBody.allowsRotation = false
        self.physicsBody.restitution = 0
        self.addChild(sprite)
    }
    
    func moveTo(point: CGPoint) {
        let duration = self.distanceTo(point) / self.movementSpeed
        let action = SKAction.moveBy(point - self.position, duration: NSTimeInterval(duration))
        self.removeActionForKey("Moving")
        self.runAction(action, withKey: "Moving")
    }
    
}
