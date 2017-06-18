//
//  PullReqDAO.swift
//  ConcreteiOS
//
//  Created by Francisco Júnior on 17/06/17.
//  Copyright © 2017 Concrete. All rights reserved.
//

import Foundation
import Alamofire

class PullReqDAO {
  
  static let apiUrl = "https://api.github.com/repos" // <criador>/<repositório>/pulls
  
  static func getPullReqListByRepoName(repoName: String, ownerName: String, completionHandler: @escaping ((_ pullList: [PullReq]?, _ num_opened: Int, _ num_closed: Int)->())) {
    let urlWithOwner = "\(apiUrl)/\(ownerName)/\(repoName)/pulls"
    Alamofire.request(urlWithOwner).responseJSON { (response) in
      var pullList = [PullReq]()
      var num_opened = 0
      var num_closed = 0
      
      if let json = response.result.value{
        let items = json as! [[String:Any]]
        for item in items{
          let pullReq = PullReq(JSON: item)!
          
          if pullReq.state == "open"{
            num_opened += 1
          } else{
            num_closed += 1
          }
          
          pullList.append(pullReq)
        }
        completionHandler(pullList, num_opened, num_closed)
      }
      completionHandler(nil, 0, 0)
    }
  }
  
}
