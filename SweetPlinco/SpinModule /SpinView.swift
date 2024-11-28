import SwiftUI
import SpriteKit


class SpinSpriteKit: SKScene, SKPhysicsContactDelegate {
    var fortune: SKSpriteNode!
    var spinLabel: SKLabelNode!
    var game: GameData?
    var count = 0
    func setupView() {
        let background = SKSpriteNode(imageNamed: ImageName.shopBack.rawValue)
        background.size = CGSize(width: self.size.width, height: self.size.height)
        background.position = (CGPoint(x: size.width / 2, y: size.height / 2))
        addChild(background)
        
        let pauseBack = SKSpriteNode(imageNamed: ImageName.darkBalls.rawValue)
        pauseBack.size = CGSize(width: size.width / 1.4, height: size.height / 6)
        pauseBack.position = (CGPoint(x: size.width / 2, y: size.height / 1.18))
        addChild(pauseBack)
        
        let label = SKLabelNode(fontNamed: "Kavoon-Regular")
        label.text = "TRY YOUR"
        label.fontSize = 55
        label.position = (CGPoint(x: size.width / 2, y: size.height / 1.17))
        label.fontColor = .purple
        addChild(label)
        
        let label2 = SKLabelNode(fontNamed: "Kavoon-Regular")
        label2.text = "LUCK"
        label2.fontSize = 55
        label2.position = (CGPoint(x: size.width / 2, y: size.height / 1.26))
        label2.fontColor = .purple
        addChild(label2)
        
        let labelBack = SKSpriteNode(imageNamed: ImageName.labelRectangle.rawValue)
        labelBack.size = CGSize(width: size.width / 2.5, height: size.height / 18)
        labelBack.position = (CGPoint(x: size.width / 2, y: size.height / 1.38))
        addChild(labelBack)
        
        let moneyCount = SKLabelNode(fontNamed: "Kavoon-Regular")
        moneyCount.text = "+150"
        moneyCount.fontSize = 30
        moneyCount.position = (CGPoint(x: size.width / 2.2, y: size.height / 1.4))
        moneyCount.fontColor = .white
        addChild(moneyCount)
        
        let coin = SKSpriteNode(imageNamed: ImageName.coin.rawValue)
        coin.size = CGSize(width: 25, height: 25)
        coin.position = (CGPoint(x: size.width / 1.72, y: size.height / 1.38))
        addChild(coin)
        
        
        let backFortune = SKSpriteNode(imageNamed: ImageName.circleForFortune.rawValue)
        backFortune.size = CGSize(width: size.width / 1.1, height: size.width / 1.1)
        backFortune.position = (CGPoint(x: size.width / 2, y: size.height / 2.3))
        addChild(backFortune)
        
        fortune = SKSpriteNode(imageNamed: ImageName.fortune.rawValue)
        fortune.size = CGSize(width: size.width / 0.9, height: size.width / 0.8)
        fortune.position = CGPoint(x: 0, y: 0)
        
        let cropNode = SKCropNode()
        cropNode.position = CGPoint(x: size.width / 2.01, y: size.height / 2.3)
        let maskNode = SKShapeNode(circleOfRadius: 170)
        maskNode.fillColor = .white
        maskNode.strokeColor = .clear
        cropNode.maskNode = maskNode
        cropNode.addChild(fortune)
        addChild(cropNode)
        
        let picker = SKSpriteNode(imageNamed: ImageName.pickBonus.rawValue)
        picker.size = CGSize(width: size.width / 7, height: size.height / 14)
        picker.position = (CGPoint(x: size.width / 2, y: size.height / 4.53))
        addChild(picker)
        
        let spinButton = SKSpriteNode(imageNamed: ImageName.rectangleButton.rawValue)
        spinButton.size = CGSize(width: size.width / 1.3, height: size.height / 8)
        spinButton.name = "spinButton"
        spinButton.position = (CGPoint(x: size.width / 2, y: size.height / 10))
        addChild(spinButton)
        
        spinLabel = SKLabelNode(fontNamed: "Kavoon-Regular")
        spinLabel.text = "SPIN!"
        spinLabel.name = "spinLabel"
        spinLabel.fontSize = 60
        spinLabel.position = (CGPoint(x: size.width / 2, y: size.height / 13))
        spinLabel.fontColor = .white
        addChild(spinLabel)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let touchLocation = touch.location(in: self)
            if let tappedNode = self.atPoint(touchLocation) as? SKSpriteNode, tappedNode.name == "spinLabel" || tappedNode.name == "spinButton" {
                startSpinning()
            }
        }
    }
    
    func startSpinning() {
        if count != 1 {
            count += 1
            let spinAction = SKAction.rotate(byAngle: CGFloat.pi * 2, duration: 1)
            let repeatSpinAction = SKAction.repeatForever(spinAction)
            fortune.run(repeatSpinAction)
            let doubleArray = [3.6, 2.0, 3.8, 1.2, 3.4]
            let random = doubleArray.randomElement()
            let stopAction = SKAction.sequence([
                SKAction.wait(forDuration: random ?? 0.0),
                SKAction.run { [weak self] in
                    self?.stopSpinning()
                }
            ])
            self.run(stopAction)
            spinLabel.text = "TAKE!"
        } else {
            game?.isTakeTapped = true
            UserDefaultsManager().completeLevel()
        }
    }
    
    func stopSpinning() {
        fortune.removeAllActions()
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        
    }
    
    func didEnd(_ contact: SKPhysicsContact) {
        
    }
    
    override func didMove(to view: SKView) {
        scene?.size = UIScreen.main.bounds.size
        physicsWorld.contactDelegate = self
        setupView()
        
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
}

struct SpinView: View {
    @StateObject var spinModel =  SpinViewModel()
    @StateObject private var gameData = GameData()
    
    var body: some View {
        SpriteView(scene: spinModel.createGameScene(gameData: gameData))
            .ignoresSafeArea()
            .navigationBarBackButtonHidden(true)
            .navigationDestination(isPresented: $gameData.isTakeTapped) {
                LevelView()
            }
    }
}

#Preview {
    SpinView()
}

