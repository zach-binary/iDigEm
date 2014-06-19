//
//  SKNodeExtensions.swift
//  DigEm
//
//  Created by Zach on 6/11/14.
//  Copyright (c) 2014 Zach. All rights reserved.
//

import SpriteKit

@infix func - (left: CGPoint, right: CGPoint) -> CGVector {
    return CGVector(dx: left.x - right.x, dy: left.y - right.y)
}

@objc protocol Collidable {
    @optional func onContact(contact: SKPhysicsContact)
    @optional func onEndContact(contact: SKPhysicsContact)
}

extension SKNode : Collidable {
    func distanceTo(point: CGPoint) -> CGFloat {
        return hypotf(point.x - self.position.x, point.y - self.position.y);
    }
}

