//
//  ConcreteKIFTest.swift
//  ConcreteiOS
//
//  Created by Francisco Júnior on 18/06/17.
//  Copyright © 2017 Concrete. All rights reserved.
//

import XCTest
@testable import ConcreteiOS

import KIF

class ConcreteKIFTest: KIFTestCase {
  
  override func setUp() {
    super.setUp()
    
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testExample() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
  }
  
  func testPerformanceExample() {
    // This is an example of a performance test case.
    self.measure {
      // Put the code you want to measure the time of here.
    }
  }
  
  func testClickFeedCell_ShowPullSelectDetail() {
    tester().tapView(withAccessibilityLabel: "feed_cell")
    tester().waitForView(withAccessibilityLabel: "pullDetail_cell")
  }
  
  func testInfinityScrollFeedScreen(){
    let storyboard = UIStoryboard(name: "Main",
                                  bundle: Bundle.main)
    let navigationC = storyboard.instantiateInitialViewController() as! UINavigationController
    let initialVC   = navigationC.viewControllers[0] as! ViewController
    
    let _ = navigationC.view
    let _ = initialVC.view
    let mainTableView = initialVC.mainTableView
    
    tester().waitForCell(at: IndexPath(row: 1, section: 0), inTableViewWithAccessibilityIdentifier: "mainTableView")
    
    tester().run { (error) -> KIFTestStepResult in
      mainTableView?.contentOffset.y -= 100.0
      
      if ((mainTableView?.contentOffset.y)! > CGFloat(8000.0)){
        return KIFTestStepResult.success
      }
      return KIFTestStepResult.wait
    }
    
    
  }
  
  
  
}
