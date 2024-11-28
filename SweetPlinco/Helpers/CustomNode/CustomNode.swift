import SwiftUI
import SpriteKit

struct CBitMask {
    static let pinkBall: UInt32 = 1
    static let brightPinkBall: UInt32 = 9
    static let orangeBall: UInt32 = 3
    static let yellowBall: UInt32 = 11
    static let greenkBall: UInt32 = 5
    static let brightBlueBall: UInt32 = 13
    static let blueBall: UInt32 = 7
    static let purpleBall: UInt32 = 15
    static let none: UInt32 = 17
}

class BallNode: SKSpriteNode {
    init(texture: SKTexture,
         position: CGPoint,
         categoryBitMask: UInt32,
         contactTestBitMask: UInt32) {
        let texture = texture
        super.init(texture: texture, color: .clear, size: texture.size())
        self.position = position
        self.size = CGSize(width: 50, height: 50)
        self.physicsBody = SKPhysicsBody(circleOfRadius: 25)
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.isDynamic = true
        self.physicsBody?.categoryBitMask = categoryBitMask
        self.physicsBody?.contactTestBitMask = contactTestBitMask
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
