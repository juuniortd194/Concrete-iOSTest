//
//  OwnerDAO.swift
//  ConcreteiOS
//
//  Created by Francisco Júnior on 16/06/17.
//  Copyright © 2017 Concrete. All rights reserved.
//

import Foundation
import Alamofire

class OwnerDAO {
  
  static let apiURL = "https://api.github.com/search/repositories?q=language:Java&sort=stars&page=1"
  
  static func getOwnersByPage(page: Int, completionHadler: @escaping ((_ ownersList: [Owner]?)->())){
    Alamofire.request(apiURL).responseJSON { (response) in
    var owners = [Owner]()
      if let json = response.result.value as? [String:Any]{
        let items = json["items"] as! [[String:Any]]
        for item in items{
          if let newOwner = Owner(JSON: item){
            owners.append(newOwner)
          }
        }
        completionHadler(owners)
      }
    }
    
    completionHadler(nil)
  }
  
}

