// Playground - noun: a place where people can play

import SpriteKit
import XCPlayground

let path = "/Users/Zach/Playground/dig-em"

@infix func - (left: CGPoint, right: CGPoint) -> CGVector {
    return CGVector(dx: left.x - right.x, dy: left.y - right.y)
}

class GameScene: SKScene {
    
    let spriteNode: SKSpriteNode
    var clickPoint = CGPoint(x: 100, y: 100)
    
    init(size: CGSize){
        
        let textures: SKTexture[] = [
            SKTexture(imageNamed: path + "/dickle.atlas/dickle0000.png")
            ,SKTexture(imageNamed: path + "/dickle.atlas/dickle0001.png")
            ,SKTexture(imageNamed: path + "/dickle.atlas/dickle0002.png")
        ]
        
        var animation = SKAction.repeatActionForever(SKAction.animateWithTextures(textures, timePerFrame: 1))
        
        spriteNode = SKSpriteNode(texture: textures[0])
        spriteNode.anchorPoint = CGPoint(x: 0, y: 0)
        spriteNode.position = CGPoint (x: 0, y: 0)
        spriteNode.runAction(animation)
        
        var body = SKPhysicsBody(rectangleOfSize: CGSize(width: 56, height: 56))
        spriteNode.physicsBody = body
        
        super.init(size: size)
        
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 1)
    }
    
    override func didMoveToView(view: SKView) {
        self.addChild(spriteNode)
    }
    
    override func update(currentTime: CFTimeInterval) {
        if (clickPoint != nil) {
            moveToClickPoint()
        }
    }
    
    func moveToClickPoint() {
        spriteNode.physicsBody.velocity = (clickPoint - spriteNode.position)
    }
}

let scene = GameScene(size: CGSize(width: 400, height: 400))
let view = SKView(frame: NSRect(x: 0, y: 0, width: 400, height: 400))

view.presentScene(scene)

XCPShowView("result", view)
