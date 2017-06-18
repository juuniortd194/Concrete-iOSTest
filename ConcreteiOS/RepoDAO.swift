//
//  RepoDAO.swift
//  ConcreteiOS
//
//  Created by Francisco Júnior on 16/06/17.
//  Copyright © 2017 Concrete. All rights reserved.
//

import Foundation
import Alamofire

class RepoDAO {
  
  static let apiUrl = "https://api.github.com/search/repositories?q=language:Java&sort=stars&page="
  
  
  static func getFeedByPagination(page: Int, completionHandler: @escaping (_ repo: [Repo]?)->() ) {
    let urlWithPage = apiUrl.appending("\(page)")
    Alamofire.request(urlWithPage).responseJSON { (response) in
      var repo = [Repo]()
      if let json = response.result.value as? [String:Any]{
        if let items = json["items"] as? [[String:Any]]{
          for item in items{
            repo.append(Repo(JSON: item)!)
          }
          completionHandler(repo)
        }
      }
      completionHandler(nil)
    }
  }
  
}
