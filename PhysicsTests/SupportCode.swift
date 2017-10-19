//
//  SupportCode.swift
//  PhysicsTests
//
//  Created by Ryan Bryle on 10/6/17.
//  Copyright © 2017 Ryan Bryle. All rights reserved.
//

import Foundation
import UIKit

public func random(min: CGFloat, max: CGFloat) -> CGFloat {
  return CGFloat(Float(arc4random()) / Float(0xFFFFFFFF))
    * (max - min) + min
}

