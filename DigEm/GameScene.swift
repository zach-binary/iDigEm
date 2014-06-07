//
//  GameScene.swift
//  DigEm
//
//  Created by Zach on 6/5/14.
//  Copyright (c) 2014 Zach. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            
            let atlas = SKTextureAtlas(named: "dickle")
            let sprite = SKSpriteNode(texture: atlas.textureNamed("dickle0000"))
            
            var textures: SKTexture[] = []
            
            for texname in atlas.textureNames as String[] {
                textures.append(atlas.textureNamed(texname))
            }
            
            let action = SKAction.repeatActionForever(SKAction.animateWithTextures(textures, timePerFrame: 1))
            
            sprite.position = location
            sprite.setScale(2)
            sprite.runAction(action)
            
            self.addChild(sprite)
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
