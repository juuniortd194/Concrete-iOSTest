//
//  PullReq.swift
//  ConcreteiOS
//
//  Created by Francisco Júnior on 17/06/17.
//  Copyright © 2017 Concrete. All rights reserved.
//

import Foundation
import ObjectMapper


class PullReq: Mappable {
  
  var url: String?
  var id: Int?
  var state: String?
  var locked: Bool?
  var title: String?
  var user: Owner?
  var body: String?
  var created_at: String?
  var updated_at: String?
  var closed_at: String?
  var merged_at: String?
  var merge_commit_sha: String?
  var assignee: String?
  var assignees: [String:Any]?
  
  
  required init?(map: Map) {
    
  }
  
  func mapping(map: Map) {
    url              <- map["url"]
    id        		   <- map["id"]
    state        	   <- map["state"]
    locked        	 <- map["locked"]
    title        	   <- map["title"]
    user        	   <- map["user"]
    body        	   <- map["body"]
    created_at       <- map["created_at"]
    updated_at       <- map["updated_at"]
    closed_at        <- map["closed_at"]
    merged_at        <- map["merged_at"]
    merge_commit_sha <- map["merge_commit_sha"]
    assignee         <- map["assignee"]
    assignees        <- map["assignees"]
  }
  
}
