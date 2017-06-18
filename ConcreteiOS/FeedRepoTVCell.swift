//
//  FeedRepoTVCell.swift
//  ConcreteiOS
//
//  Created by Francisco Júnior on 17/06/17.
//  Copyright © 2017 Concrete. All rights reserved.
//

import UIKit
import SDWebImage

class FeedRepoTVCell: UITableViewCell {
  
  @IBOutlet weak var repoName: UILabel!
  @IBOutlet weak var repoDescription: UILabel!
  
  
  @IBOutlet weak var userPicture: UIImageView!
  @IBOutlet weak var userName: UILabel!
  @IBOutlet weak var userFullName: UILabel!
  @IBOutlet weak var numForks: UILabel!
  @IBOutlet weak var numStar: UILabel!
  
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
  func mountCellForData(repo: Repo) {
    repoName.text = repo.name
    userName.text = repo.owner?.login
    userFullName.text = repo.full_name?.fullNameToText()
    repoDescription.text = repo.description
    
    numStar.text = repo.stargazers_count?.toString()
    numForks.text = repo.forks_count?.toString()
    
    SDImageCache.shared().shouldCacheImagesInMemory = false
    userPicture.sd_setHighlightedImage(with: URL(string: (repo.owner?.avatar_url)!)!, options: SDWebImageOptions(rawValue: 0)) { (image, error, cacheType, url) in
      if ((image) != nil){
        self.userPicture.image = image
      }
    }
    
  }

}
