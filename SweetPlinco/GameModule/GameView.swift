import SwiftUI
import SpriteKit

class GameData: ObservableObject {
    @Published var isShopTapped = false
    @Published var isPauseTapped = false
    @Published var isLose = false
    @Published var isWin = false
    @Published var isTakeTapped = false
}

class GameSpriteKit: SKScene, SKPhysicsContactDelegate {
    var ball: BallNode!
    var imageOfBallOnWeapon: SKSpriteNode!
    var nodes = [SKSpriteNode]()
    var time: SKSpriteNode!
    var firstStar: SKSpriteNode!
    var secondStar: SKSpriteNode!
    var thirdStar: SKSpriteNode!
    var game: GameData?
    var timer: Timer?
    var randomBall: String!
    private var lastTapTime: TimeInterval = 0
    private let delay: TimeInterval = 1 // Задержка в 3 секунды
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateNodeSize), userInfo: nil, repeats: true)
    }
    
    func isSceneEmpty() -> [SKSpriteNode]{
        return self.children.compactMap { $0 as? BallNode }
    }
    
    func test() -> String {
        randomBall = getRandomBall().keys.randomElement() ?? ""
        imageOfBallOnWeapon = SKSpriteNode(imageNamed: randomBall)
        imageOfBallOnWeapon.texture = SKTexture(imageNamed: randomBall)
        imageOfBallOnWeapon.position = (CGPoint(x: size.width / 2, y: size.height / 5.1))
        imageOfBallOnWeapon.size = CGSize(width: 50, height: 50)
        addChild(imageOfBallOnWeapon)
        return randomBall
    }
    
    @objc func updateNodeSize() {
        let arryBall = isSceneEmpty()
        time.size.width -= 5
        time.position.x -= 2.3
        if time.size.width < 5 {
            timer?.invalidate()
            game?.isLose = true
        }
        
        if arryBall.isEmpty {
            game?.isWin = true
            timer?.invalidate()
            if time.size.width < 110 {
                UserDefaultsManager().saveStarImage(image: ImageName.star1.rawValue)
            } else if time.size.width < 180, time.size.width > 110 {
                UserDefaultsManager().saveStarImage(image: ImageName.star2.rawValue)
            } else if time.size.width > 180 {
                UserDefaultsManager().saveStarImage(image: ImageName.star3.rawValue)
            }
        }
        
        if time.size.width < 110 {
            secondStar.texture = SKTexture(imageNamed: ImageName.emptyStar.rawValue)
        } else if time.size.width < 180 {
            firstStar.texture = SKTexture(imageNamed: ImageName.emptyStar.rawValue)
        }
    }
    
    func flyBall(touchLocation: CGPoint) {
        if touchLocation.x > 25, touchLocation.x < 380, touchLocation.y < 670, touchLocation.y > 340 {
            let text = imageOfBallOnWeapon.texture?.description
            let startIndex = text!.index(text!.startIndex, offsetBy: 13)
            let endIndex = text!.index(startIndex, offsetBy: 5)
            let word = String(text![startIndex..<endIndex])
            let _ = test()
            
            ball = BallNode(texture: SKTexture(imageNamed: word),
                            position: (CGPoint(x: size.width / 2, y: size.height / 5.1)),
                            categoryBitMask: getRandomBall()[word] ?? 0,
                            contactTestBitMask: getRandomBall()[word] ?? 0)
            ball.physicsBody?.collisionBitMask =  1
            addChild(ball)
            
            let direction = CGVector(dx: touchLocation.x - ball.position.x,
                                     dy: touchLocation.y - ball.position.y)
            
            let forceMagnitude: CGFloat = 4000.0
            let normalizedDirection = direction.normalized()
            let force = CGVector(dx: normalizedDirection.dx * forceMagnitude,
                                 dy: normalizedDirection.dy * forceMagnitude)
            
            ball.physicsBody?.applyForce(force)
        }
    }
    
    func setupView() {
        let background = SKSpriteNode(imageNamed: ImageName.gameBack3.rawValue)
        background.size = CGSize(width: self.size.width, height: self.size.height)
        background.position = (CGPoint(x: size.width / 2, y: size.height / 2))
        addChild(background)
        
        let pauseBack = SKSpriteNode(imageNamed: ImageName.circleButton.rawValue)
        pauseBack.size = CGSize(width: 55, height: 55)
        pauseBack.position = (CGPoint(x: size.width / 8, y: size.height / 1.14))
        pauseBack.name = "pauseBack"
        addChild(pauseBack)
        
        let pause = SKSpriteNode(imageNamed: ImageName.pauseButton.rawValue)
        pause.size = CGSize(width: 20, height: 30)
        pause.position = (CGPoint(x: size.width / 8, y: size.height / 1.14))
        pause.name = "pause"
        addChild(pause)
        
        let shopBack = SKSpriteNode(imageNamed: ImageName.circleButton.rawValue)
        shopBack.size = CGSize(width: 55, height: 55)
        shopBack.position = (CGPoint(x: size.width / 1.15, y: size.height / 1.14))
        shopBack.name = "shopBack"
        addChild(shopBack)
        
        let shop = SKSpriteNode(imageNamed: ImageName.lockedImage.rawValue)
        shop.size = CGSize(width: 20, height: 30)
        shop.position = (CGPoint(x: size.width / 1.15, y: size.height / 1.14))
        shop.name = "shop"
        addChild(shop)
        
        let timeBack = SKSpriteNode(imageNamed: ImageName.scaleBG.rawValue)
        timeBack.size = CGSize(width: size.width / 1.7, height: size.height / 15)
        timeBack.position = (CGPoint(x: size.width / 2, y: size.height / 1.2))
        addChild(timeBack)
        
        time = SKSpriteNode(imageNamed: ImageName.time1.rawValue)
        time.size = CGSize(width: size.width / 1.75, height: size.height / 17)
        time.position = (CGPoint(x: size.width / 2, y: size.height / 1.199))
        addChild(time)
        
        let firstLine = SKSpriteNode(imageNamed: ImageName.lineVertical.rawValue)
        firstLine.size = CGSize(width: CGFloat(5), height: size.height / 17)
        firstLine.position = (CGPoint(x: size.width / 2, y: size.height / 1.199))
        addChild(firstLine)
        
        let secondLine = SKSpriteNode(imageNamed: ImageName.lineVertical.rawValue)
        secondLine.size = CGSize(width: CGFloat(5), height: size.height / 17)
        secondLine.position = (CGPoint(x: size.width / 1.5, y: size.height / 1.199))
        addChild(secondLine)
        
        let thirdLane = SKSpriteNode(imageNamed: ImageName.lineVertical.rawValue)
        thirdLane.size = CGSize(width: CGFloat(5), height: size.height / 17)
        thirdLane.position = (CGPoint(x: size.width / 3, y: size.height / 1.199))
        addChild(thirdLane)
        
        firstStar = SKSpriteNode(imageNamed: ImageName.star.rawValue)
        firstStar.size = CGSize(width: CGFloat(45), height: size.height / 20)
        firstStar.position = (CGPoint(x: size.width / 1.5, y: size.height / 1.11))
        addChild(firstStar)
        
        secondStar = SKSpriteNode(imageNamed: ImageName.star.rawValue)
        secondStar.size = CGSize(width: CGFloat(45), height: size.height / 20)
        secondStar.position = (CGPoint(x: size.width / 2, y: size.height / 1.11))
        addChild(secondStar)
        
        thirdStar = SKSpriteNode(imageNamed: ImageName.star.rawValue)
        thirdStar.size = CGSize(width: CGFloat(45), height: size.height / 20)
        thirdStar.position = (CGPoint(x: size.width / 3, y: size.height / 1.11))
        addChild(thirdStar)
        
        let gameBack = SKSpriteNode(imageNamed: ImageName.gameBackField.rawValue)
        gameBack.size = CGSize(width: size.width / 1.1, height: size.height / 1.6)
        gameBack.position = (CGPoint(x: size.width / 2, y: size.height / 2.1))
        addChild(gameBack)
        
        let border = SKPhysicsBody(edgeLoopFrom: gameBack.frame)
        self.physicsBody = border
        border.node?.physicsBody?.categoryBitMask = CBitMask.none
        border.node?.physicsBody?.collisionBitMask = CBitMask.none
        self.physicsBody?.friction = 1
        
        let weapon = SKSpriteNode(imageNamed: ImageName.weapon.rawValue)
        weapon.size = CGSize(width: size.width / 2.5, height: size.height / 4.5)
        weapon.position = (CGPoint(x: size.width / 2, y: size.height / 5.4))
        addChild(weapon)
        
        let line = SKSpriteNode(imageNamed: ImageName.line.rawValue)
        line.size = CGSize(width: size.width / 1.1, height: 5)
        line.position = (CGPoint(x: size.width / 2, y: size.height / 2.75))
        addChild(line)
        
        let ballsBottom = SKSpriteNode(imageNamed: ImageName.ballsBottom.rawValue)
        ballsBottom.size = CGSize(width: size.width / 1, height: size.height / 3)
        ballsBottom.position = (CGPoint(x: size.width / 2, y: size.height / 6))
        addChild(ballsBottom)
        
        for row in 0..<2 {
            for column in 0..<6 {
                let randomBall = getRandomBall().keys.randomElement() ?? ""
                let ball = BallNode(texture: SKTexture(imageNamed: randomBall),
                                    position: (CGPoint(x: size.width / 5.5 + CGFloat(column * 49),
                                                       y: size.height / 1.35 - CGFloat(row * 49))),
                                    categoryBitMask: getRandomBall()[randomBall] ?? 0,
                                    contactTestBitMask: getRandomBall()[randomBall] ?? 0)
                ball.physicsBody?.collisionBitMask = 0
                nodes.append(ball)
                self.addChild(ball)
            }
        }
    }
    
    func getRandomBall() -> [String: UInt32] {
        let allBalls: [String: UInt32] = [ImageName.ball1.rawValue : CBitMask.pinkBall,
                                                                                    ImageName.ball2.rawValue : CBitMask.brightPinkBall,
                                                                                    ImageName.ball3.rawValue : CBitMask.orangeBall,
                                                                                    ImageName.ball4.rawValue : CBitMask.yellowBall,
                                                                                    ImageName.ball6.rawValue : CBitMask.greenkBall,
                                                                                    ImageName.ball5.rawValue : CBitMask.brightBlueBall,
                                                                                    ImageName.ball7.rawValue : CBitMask.blueBall,
                                                                                    ImageName.ball8.rawValue : CBitMask.purpleBall
        ]
        return allBalls
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let touchLocation = touch.location(in: self)
            
            let currentTime = CACurrentMediaTime()
            
            // Проверяем, прошло ли достаточно времени с последнего нажатия
            if currentTime - lastTapTime >= delay {
                lastTapTime = currentTime
                flyBall(touchLocation: touchLocation)
            } else {
                print("Нажатие игнорируется. Подождите \(delay) секунд.")
            }
        
        
        
        
        if let tappedNode = self.atPoint(touchLocation) as? SKSpriteNode, tappedNode.name == "shopBack" || tappedNode.name == "shop" {
            game?.isShopTapped = true
        }
        
        if let tappedNode = self.atPoint(touchLocation) as? SKSpriteNode, tappedNode.name == "pauseBack" || tappedNode.name == "pause" {
            game?.isPauseTapped = true
        }
    }
}
    
    
    func checkNearbyNodes(node: SKNode, nodeB: SKNode) {
        let nearbyNodes = self.children.filter { $0 != node && $0.frame.intersects(node.frame) }
        for nearbyNode in nearbyNodes {
            if nearbyNode.physicsBody?.contactTestBitMask == node.physicsBody?.contactTestBitMask  {
                if nearbyNode != nodeB {
                    nearbyNode.removeFromParent()
                    node.removeFromParent()
                    nodeB.removeFromParent()
                }
            }
        }
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        guard ball != nil else { return }
        let bodyA = contact.bodyA
        let bodyB = contact.bodyB
        guard let nodeA = contact.bodyA.node else { return }
        guard let nodeB = contact.bodyB.node else { return }
        if ball.position.y > 170, ball.position.y < 320 {
            game?.isLose = true
        }

        if bodyA.node?.physicsBody?.contactTestBitMask == bodyB.node?.physicsBody?.contactTestBitMask {
            checkNearbyNodes(node: nodeA, nodeB: nodeB)
    }
      
//        if bodyA.categoryBitMask != CBitMask.none {
            ball.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
            ball.physicsBody?.collisionBitMask = 0
            ball.physicsBody?.angularVelocity = 0
//        }
    }
    
    override func didMove(to view: SKView) {
        scene?.size = UIScreen.main.bounds.size
        physicsWorld.contactDelegate = self
        setupView()
        startTimer()
        let _ = test()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
}

struct GameView: View {
    @StateObject var gameModel =  GameViewModel()
    @StateObject private var gameData = GameData()
    
    var body: some View {
        SpriteView(scene: gameModel.createGameScene(gameData: gameData))
                .ignoresSafeArea()
                .navigationDestination(isPresented: $gameData.isShopTapped) {
                    ShopView()
                }
        
                .navigationDestination(isPresented: $gameData.isPauseTapped) {
                    PauseView()
                }
        
                .navigationDestination(isPresented: $gameData.isLose) {
                    LoseView()
                }
        
                .navigationDestination(isPresented: $gameData.isWin) {
                    WinView()
                }
                .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    GameView()
}

