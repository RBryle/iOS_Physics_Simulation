//
//  GameScene.swift
//  PhysicsTests
//
//  Created by Ryan Bryle on 10/6/17.
//  Copyright © 2017 Ryan Bryle. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
	
	let square_obj = SKSpriteNode(imageNamed: "square")
	let circle_obj = SKSpriteNode(imageNamed: "circle")
	let triangle_ojb = SKSpriteNode(imageNamed: "triangle")
  let l_ojb = SKSpriteNode(imageNamed: "L")
	
	var timer_helper = 0
	
	override func didMove(to view: SKView) {
    
		let myTimer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true, block: { (timer) in
			let current_timer = timer
			self.timer_helper += 1
			
			if self.timer_helper == 2 {
				print("timer triggered")
				self.change_gravity()
        
				current_timer.invalidate()
        
        let make_sand_action = SKAction.run {
          self.spawnSand()
        }
        
        let sand_seq = SKAction.sequence(
          [make_sand_action,
           SKAction.wait(forDuration: 0.1)])
        
        let sand_repeater = SKAction.repeat(
          sand_seq, count: 100)
        
        let action_shake = SKAction.run {
          self.shake()
        }
        
        let final_seq = SKAction.sequence(
          [sand_repeater, SKAction.wait(forDuration: 10),
           action_shake
           ])
        
        self.run(final_seq)
			}
		})
    
		myTimer.fire()
		
		self.physicsBody = SKPhysicsBody(
			edgeLoopFrom: self.frame)
		
		self.physicsWorld.gravity = CGVector(
			dx: 0, dy: 0)
		
		square_obj.position = CGPoint(
			x: self.size.width * 0.25,
			y: self.size.height * 0.50)
		
		square_obj.name = "shape"
		square_obj.physicsBody = SKPhysicsBody(
			rectangleOf: square_obj.size)
		addChild(square_obj)
		
		circle_obj.position = CGPoint(
			x: self.size.width * 0.50,
			y: self.size.height * 0.50)
		circle_obj.name = "shape"
		circle_obj.physicsBody = SKPhysicsBody(
			circleOfRadius: circle_obj.size.width/2)
		addChild(circle_obj)
		
		triangle_ojb.position = CGPoint(
			x: self.size.width * 0.75,
			y: self.size.height * 0.50)
		triangle_ojb.name = "shape"
		addChild(triangle_ojb)
    
    l_ojb.name = "shape"
    l_ojb.position = CGPoint(
      x: self.size.width * 0.5,
      y: self.size.height * 0.75)
    l_ojb.physicsBody = SKPhysicsBody(
      texture: l_ojb.texture!,
      size: l_ojb.size)
    addChild(l_ojb)
		
		let trianglePath = CGMutablePath()
		trianglePath.move(
			to: CGPoint(
				x: -triangle_ojb.size.width/2,
				y: -triangle_ojb.size.height/2))
		
		// to right corner
		trianglePath.addLine(
			to: CGPoint(
				x: triangle_ojb.size.width/2,
				y: -triangle_ojb.size.height/2))
		
		// to top corner
		trianglePath.addLine(
			to: CGPoint(
				x: 0,
				y: triangle_ojb.size.height/2))
		
		// to left corner
		trianglePath.addLine(
			to: CGPoint(
				x: -triangle_ojb.size.width/2,
				y: -triangle_ojb.size.height/2))
		
		triangle_ojb.physicsBody = SKPhysicsBody(polygonFrom: trianglePath)
	}
	
	func change_gravity() {
		self.physicsWorld.gravity = CGVector(dx: 0, dy: -0.98)
	}
	
	override func update(_ currentTime: TimeInterval) {
		
	}
  
  func spawnSand() {
    print("Adding Sand")
    let sand_obj = SKSpriteNode(imageNamed: "sand")
    sand_obj.position = CGPoint(
      x: random(min: 0.0, max: self.size.width),
      y: self.size.height - sand_obj.size.height)
    
    sand_obj.physicsBody = SKPhysicsBody(
      circleOfRadius: sand_obj.size.width/2)
    sand_obj.name = "sand"
    sand_obj.physicsBody!.restitution = 1.0
    sand_obj.physicsBody!.density = 20.0
    self.addChild(sand_obj)
  }
  
  func shake() {
    print("- SHAKING PHYSICAL ENV. -")
    self.enumerateChildNodes(withName: "sand", using: { (node, _) in
      let sand_of_shake = node as! SKSpriteNode
      sand_of_shake.physicsBody?.applyForce(
        CGVector(
          dx: 0,
          dy: 2000))
    })
  }
	
}
