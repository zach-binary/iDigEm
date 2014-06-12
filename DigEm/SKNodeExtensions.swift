//
//  SKNodeExtensions.swift
//  DigEm
//
//  Created by Zach on 6/11/14.
//  Copyright (c) 2014 Zach. All rights reserved.
//

import SpriteKit

extension SKNode {
    func distanceTo(point: CGPoint) -> CGFloat {
        return hypotf(point.x - self.position.x, point.y - self.position.y);
    }
}
