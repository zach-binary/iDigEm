//
//  Dickle.swift
//  DigEm
//
//  Created by Zach on 6/10/14.
//  Copyright (c) 2014 Zach. All rights reserved.
//

import SpriteKit

extension SKTextureAtlas{
    func getTextureArray() -> SKTexture[] {
        var textures: SKTexture[] = []
        
        for texName in self.textureNames as String[] {
            textures.append(self.textureNamed(texName))
        }
        
        return textures
    }
}

enum ActionKeys: String {
    case Moving = "Moving"
}

class Dickle : SKNode {
    let sprite: SKSpriteNode
    
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
        let action = SKAction.moveTo(point, duration: 1)
        self.removeActionForKey(ActionKeys.Moving.toRaw())
        self.runAction(action, withKey: ActionKeys.Moving.toRaw())
    }
}
