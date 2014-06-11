// Playground - noun: a place where people can play

import SpriteKit
import XCPlayground

let path = "/Users/Zach/Playground/dig-em"

let textures: SKTexture[] = [
    SKTexture(imageNamed: path + "/dickle.atlas/dickle0000.png")
    ,SKTexture(imageNamed: path + "/dickle.atlas/dickle0001.png")
    ,SKTexture(imageNamed: path + "/dickle.atlas/dickle0002.png")
]

let dickleCategory: UInt32 = 1
let clickCategory: UInt32 = 2

@infix func - (left: CGPoint, right: CGPoint) -> CGVector {
    return CGVector(dx: left.x - right.x, dy: left.y - right.y)
}

extension CGVector {
    func magnitude() -> CGFloat {
        return sqrt((dx * dx) + (dy * dy))
    }
}

class Dickle : SKNode {
 
    let sprite: SKSpriteNode
    
    init() {
        let animation = SKAction.repeatActionForever(SKAction.animateWithTextures(textures, timePerFrame: 1))
        
        sprite = SKSpriteNode(texture: textures[0])
        sprite.anchorPoint = CGPoint.zeroPoint
        sprite.runAction(animation)
        
        super.init()
        
        self.position = CGPoint.zeroPoint
        
        var body = SKPhysicsBody(rectangleOfSize: CGSize(width: 56, height: 56))
        self.physicsBody = body
//        self.physicsBody.categoryBitMask = dickleCategory
        self.physicsBody.contactTestBitMask = 1
        self.physicsBody.collisionBitMask = 0
        self.name = "Dickle"
        
        self.addChild(sprite)
    }
}

class GameScene: SKScene, SKPhysicsContactDelegate {
    let dickle: Dickle
    let spriteSpeed: CGFloat = 100
    let clickPoints = [CGPoint(x: 100, y:100), CGPoint(x: 150, y: 150), CGPoint(x: 270, y: 80)]
    var clickNode: SKNode
    
    init(size: CGSize) {
        clickNode = SKSpriteNode(color: SKColor.redColor(), size: CGSize(width: 6, height: 6))
        clickNode.physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: 6, height: 6))
        clickNode.physicsBody.dynamic = false
        clickNode.physicsBody.collisionBitMask = 0
        dickle = Dickle()
        
        super.init(size: size)
        
 
    }
    
    override func didMoveToView(view: SKView) {
        self.addChild(dickle)
        self.addChild(clickNode)
        
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        self.physicsWorld.contactDelegate = self
        
        moveToClickPoint()
    }
    
    override func update(currentTime: CFTimeInterval) {
        if(dickle.intersectsNode(clickNode)) {
//            moveToClickPoint()
        }
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        println(contact.bodyA)
        println(contact.bodyB)
//        if (contact.bodyA != self.dickle) {
//            return
//        }
        println("sup")
        moveToClickPoint()
    }
    
    func moveToClickPoint() {
        clickNode.position = clickPoints[random() % 3]
        var distance = (dickle.position - clickNode.position).magnitude()
        var followClick = SKAction.moveTo(clickNode.position, duration: distance / spriteSpeed)
        dickle.runAction(followClick)
    }
    
}

let scene = GameScene(size: CGSize(width: 400, height: 400))
let view = SKView(frame: NSRect(x: 0, y: 0, width: 400, height: 400))

view.presentScene(scene)

XCPShowView("result", view)

