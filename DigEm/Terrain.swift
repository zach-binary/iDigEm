//
//  Terrain.swift
//  DigEm
//
//  Created by Zach on 6/18/14.
//  Copyright (c) 2014 Zach. All rights reserved.
//

import SpriteKit

extension GameScene {
    
    func spawnWall(point: CGPoint, size: CGSize) {
        var wall: SKNode = SKNode()
        var tile: SKSpriteNode
        let tileSize = wallTexture.size()
        
        for var i: Float = 0; i < size.width; i += tileSize.width {
            for var j: Float = 0; j < size.height; j += tileSize.height {
                tile = SKSpriteNode(texture: self.wallTexture)
                tile.position = CGPointMake(i - size.width / 2, j - size.height / 2)
                tile.anchorPoint = CGPointMake(0, 0)
                wall.addChild(tile)
            }
        }
        
        wall.position = point
        wall.name = "Wall"
        wall.physicsBody = SKPhysicsBody(rectangleOfSize: size)
        wall.physicsBody.dynamic = false
        wall.physicsBody.restitution = 0
        
        self.addChild(wall)
    }
    
}
