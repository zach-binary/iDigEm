//
//  SKTextureAtlasExtensions.swift
//  DigEm
//
//  Created by Zach on 6/11/14.
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