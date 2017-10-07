//
//  GameViewController.swift
//  PhysicsTests
//
//  Created by Ryan Bryle on 10/6/17.
//  Copyright © 2017 Ryan Bryle. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let sk_view = self.view as! SKView
		let scene = GameScene(
			size: CGSize(
				width: 1335,
				height: 750))
		
		sk_view.presentScene(scene)
		sk_view.showsPhysics = true
	}
	
	override var shouldAutorotate: Bool {
		return true
	}
	
	override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
		return .landscape
	}
	
	override var prefersStatusBarHidden: Bool {
		return true
	}
}
