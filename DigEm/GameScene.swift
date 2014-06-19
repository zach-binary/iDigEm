//
//  GameScene.swift
//  DigEm
//
//  Created by Zach on 6/5/14.
//  Copyright (c) 2014 Zach. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    var dickle: Dickle = Dickle()
    let wallTexture: SKTexture = SKTexture(imageNamed: "walls")
    
    override func didMoveToView(view: SKView!) {
        self.physicsWorld.contactDelegate = self
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        
        spawnPlayer()
        spawnSpickle(CGPointMake(600, 500))
        spawnWall(CGPoint(x: 510, y: 700), size: CGSize(width: 24 * 18, height: 24))
        spawnWall(CGPointMake(282, 400), size: CGSizeMake(24, 24 * 26))
        spawnWall(CGPoint(x: 510, y: 100), size: CGSize(width: 24 * 18, height: 24))
        spawnWall(CGPointMake(738, 400), size: CGSizeMake(24, 24 * 26))
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            dickle.moveTo(location)
        }
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        let bodyA = contact.bodyA.node as Collidable
        bodyA.onContact?(contact)
    }
    
    func didEndContact(contact: SKPhysicsContact) {
        let bodyA = contact.bodyA.node as Collidable
        bodyA.onEndContact?(contact)
    }
    
    func spawnPlayer() {
        dickle.position = CGPoint(x: 500, y: 200)
        self.addChild(dickle)
    }
    
    func spawnSpickle(point: CGPoint) {
        var spickle = Spickle()
        spickle.position = point
        self.addChild(spickle)
    }
}

