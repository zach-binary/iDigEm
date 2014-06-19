// Playground - noun: a place where people can play

import SpriteKit
import XCPlayground

let wallTexture: SKTexture = SKTexture(imageNamed: "walls.png")
let size = CGSize(width: 96, height: 72)
let point = CGPoint(x: 100, y: 100)

var wall: SKNode = SKNode()
var tile: SKSpriteNode
let tileSize = wallTexture.size()

for var i: CGFloat = 0; i < size.width; i += tileSize.width {
    for var j: CGFloat = 0; j < size.height; j += tileSize.height {
        tile = SKSpriteNode(texture: wallTexture)
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


let hitBox = SKSpriteNode(color: SKColor.redColor(), size: size)
hitBox.position = point

let scene = SKScene(size: CGSize(width: 400, height: 400))
scene.addChild(hitBox)
scene.addChild(wall)

let view = SKView(frame: NSRect(x: 0, y: 0, width: 400, height: 400))

view.presentScene(scene)

XCPShowView("result", view)

