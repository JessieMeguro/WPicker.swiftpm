//
//  Game4View.swift
//  Catador
//
//  Created by Jessica Akemi Meguro on 22/04/22.
//

import SpriteKit
import SwiftUI

class DragAndDropScene: SKScene {
    private var closeBox = true
    private var currentNode: SKNode?
    private var jarra = SKSpriteNode(imageNamed: "jarraMetal")
    private var cano = SKSpriteNode(imageNamed: "cano")
    private var coca = SKSpriteNode(imageNamed: "coca")
    private var clipes = SKSpriteNode(imageNamed: "clipes")
    private var extintor = SKSpriteNode(imageNamed: "extintor")
    private var pilhas = SKSpriteNode(imageNamed: "pilha")
    private var garbage = SKSpriteNode(imageNamed: "lixo")
    private var background = SKSpriteNode(imageNamed: "fundoJogo4")
    
    
    override func didMove(to view: SKView) {
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        setup()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            
            let touchedNodes = self.nodes(at: location)
            for node in touchedNodes.reversed() {
                if jarra.contains(location) {
                    self.currentNode = node

                }
                if pilhas.contains(location) {
                    self.currentNode = node
                }
                if extintor.contains(location) {
                    self.currentNode = node
                }
                if coca.contains(location) {
                    self.currentNode = node
                }
                if clipes.contains(location) {
                    self.currentNode = node
                }
                if cano.contains(location) {
                    self.currentNode = node
                }
            }
        }
    }
        
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first, let _ = self.currentNode {
            let touchLocation = touch.location(in: self)
            jarra.position = touchLocation
        }
        
//        pilhas.position = touchLocation
//        cano.position = touchLocation
//        coca.position = touchLocation
//        clipes.position = touchLocation
//        extintor.position = touchLocation
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            if garbage.contains(location) {
                jarra.removeFromParent()
//                pilhas.removeFromParent()
//                cano.removeFromParent()
//                coca.removeFromParent()
//                extintor.removeFromParent()
//                clipes.removeFromParent()
                
//                makeBoxAnimation()
                self.currentNode = nil
            }
        }
    }
    
    func setup(){
        // ADICIONAR NOVOS OBJETOS AQUI
        
        // BACKGROUND
        background.zPosition = 0
        background.setScale(0.00075)
        background.position = CGPoint(x: frame.midX, y: frame.midY)
        self.addChild(background)
        
        //PILHAS
        pilhas.zPosition = 1
        pilhas.setScale(0.00025)
        pilhas.position = CGPoint(x: frame.midX - 0.25, y: frame.midY - 0.41)
        self.addChild(pilhas)
        
        extintor.zPosition = 1
        extintor.setScale(0.00015)
        extintor.position = CGPoint(x: frame.midX - 0.09, y: frame.midY - 0.2)
        self.addChild(extintor)
        
        coca.zPosition = 1
        coca.setScale(0.00015)
        coca.position = CGPoint(x: frame.midX - 0.08, y: frame.midY - 0.37)
        self.addChild(coca)
        
        cano.zPosition = 1
        cano.setScale(0.00025)
        cano.position = CGPoint(x: frame.midX - 0.009, y: frame.midY - 0.42)
        self.addChild(cano)
        
        clipes.zPosition = 1
        clipes.setScale(0.00025)
        clipes.position = CGPoint(x: frame.midX - 0.009, y: frame.midY - 0.35)
        self.addChild(clipes)
        
            
        // JARRA
        jarra.zPosition = 2
        jarra.setScale(0.0003)
        jarra.position = CGPoint(x: frame.midX - 0.2, y: frame.midY - 0.3)
        
        self.addChild(jarra)
        
        // LIXO
        garbage.setScale(0.0002)
        garbage.zPosition = 1
        garbage.position = CGPoint(x: frame.maxX - 0.25, y: frame.midY - 0.4)
        self.addChild(garbage)
    }
        
    func makeBoxAnimation(){
        let box1 = SKTexture(imageNamed: "box1")
        let box2 = SKTexture(imageNamed: "box2")
        let box3 = SKTexture(imageNamed: "box3")
        
        var frames: [SKTexture] = []
        frames.append(box1)
        frames.append(box2)
        frames.append(box3)
        
        if closeBox {
            garbage.run(SKAction.animate(with: frames, timePerFrame: 0.5, resize: true, restore: false))
        }
        closeBox = false
    }
}

struct Game4View: View {
    
    var scene: DragAndDropScene {
        let scene = DragAndDropScene()
        scene.scaleMode = .aspectFill
        return scene
    }
    
    var body: some View {
        ZStack {
            SpriteView(scene: scene)
        }
        .ignoresSafeArea()
    }
    
}

struct Game4View_Previews: PreviewProvider {
    static var previews: some View {
        Game4View()
    }
}
