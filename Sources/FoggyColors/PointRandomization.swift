//
//  PointRandomization.swift
//  FoggyColors
//
//  Created by Alex Dremov on 10.02.2022.
//

import Foundation

struct PointRandomization: Equatable, Hashable {
    public private(set) var width: CGFloat = 0
    public private(set) var height: CGFloat = 0
    public private(set) var offsetX: CGFloat = 0
    public private(set) var offsetY: CGFloat = 0
    private let moveChange = 0.3
    private let sizeChange = 0.5
    
    mutating func randomizeIn(size: CGSize) {
        let decision = (size.width + size.height) / 4
        width = CGFloat.random(in: (decision * 0.25) ... (decision * 0.75))
        height = CGFloat.random(in: (decision * 0.25) ... (decision * 0.75))
        offsetX = CGFloat.random(in: 0 ... +(size.width))
        offsetY = CGFloat.random(in: 0 ... +(size.height))
    }
    
    mutating func moveIn(size: CGSize) {
        width += CGFloat.random(in: (-width * (sizeChange))...(width * (sizeChange)))
        height += CGFloat.random(in: (-height * (sizeChange))...(height * (sizeChange)))
        offsetX += CGFloat.random(in: (-size.width * (moveChange))...(size.width * (moveChange)))
        offsetY += CGFloat.random(in: (-size.height * (moveChange))...(size.height * (moveChange)))
        if offsetY > size.height {
            offsetY = size.height
        }
        
        if offsetX > size.width {
            offsetX = size.width
        }
        
        if offsetX < 0 {
            offsetX = 0
        }
        
        if offsetY < 0 {
            offsetY = 0
        }
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(width)
        hasher.combine(height)
        hasher.combine(offsetX)
        hasher.combine(offsetY)
    }
    
    static func == (lhs: PointRandomization, rhs: PointRandomization) -> Bool {
        lhs.width == rhs.width &&
        lhs.height == rhs.height &&
        lhs.offsetX == rhs.offsetX &&
        lhs.offsetY == rhs.offsetY
    }
}
