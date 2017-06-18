//
//  KIFSwift.swift
//  ConcreteiOS
//
//  Created by Francisco Júnior on 18/06/17.
//  Copyright © 2017 Concrete. All rights reserved.
//

import Foundation
import KIF

extension XCTestCase {
  func tester(file : String = #file, _ line : Int = #line) -> KIFUITestActor {
    return KIFUITestActor(inFile: file, atLine: line, delegate: self)
  }
}

extension KIFTestActor {
  func tester(file : String = #file, _ line : Int = #line) -> KIFUITestActor {
    return KIFUITestActor(inFile: file, atLine: line, delegate: self)
  }
}
