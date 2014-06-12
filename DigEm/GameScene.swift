//
//  GameScene.swift
//  DigEm
//
//  Created by Zach on 6/5/14.
//  Copyright (c) 2014 Zach. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    var dickle: Dickle
    
    init(size: CGSize) {
        dickle = Dickle()
        super.init(size: size)
    }
    
    init(coder aDecoder: NSCoder!) {
        dickle = Dickle()
        super.init(coder: aDecoder)
    }
    
    override func didMoveToView(view: SKView!) {
        self.physicsWorld.contactDelegate = self
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        
        spawnPlayer()
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)

            dickle.moveTo(location)
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        println("contact made")
    }
    
    func spawnPlayer() {
        dickle.position = CGPoint(x: 500, y: 200)
        dickle.setScale(2)
        
        self.addChild(dickle)
    }
}

