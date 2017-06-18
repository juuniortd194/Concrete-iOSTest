//
//  Extensions.swift
//  ConcreteiOS
//
//  Created by Francisco Júnior on 17/06/17.
//  Copyright © 2017 Concrete. All rights reserved.
//

import Foundation

// MARK: - INT Extensions

extension Int {
  func toString() -> String {
    return String(self)
  }
}


// MARK: - STRING Extensions

extension String{
  func fullNameToText() -> String {
    let arrStr = self.components(separatedBy: "/")
    return "\(arrStr[0]) \(arrStr[1])"
  }
  
  func strDatePt() -> String? {
    let dtFormatter = DateFormatter()
    let locale = dtFormatter.locale
    dtFormatter.locale = Locale(identifier: "en_US_POSIX")
    dtFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    
    if let date = dtFormatter.date(from: self){
      dtFormatter.dateFormat = "dd/MM/yyyy HH:mm"
      dtFormatter.locale = locale
      return dtFormatter.string(from: date)
    }
    
    return nil
  }
  
}
