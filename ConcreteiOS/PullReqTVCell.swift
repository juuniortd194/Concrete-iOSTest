//
//  PullReqTVCell.swift
//  ConcreteiOS
//
//  Created by Francisco Júnior on 17/06/17.
//  Copyright © 2017 Concrete. All rights reserved.
//

import UIKit
import SDWebImage

class PullReqTVCell: UITableViewCell {

  @IBOutlet weak var pullTitle: UILabel!
  @IBOutlet weak var pullBody: UILabel!
  
  @IBOutlet weak var authorPicture: UIImageView!
  @IBOutlet weak var authorUsername: UILabel!
  @IBOutlet weak var authorFullName: UILabel!
  
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
  func mountCellByData(pullObj: PullReq) {
    pullTitle.text = pullObj.title
    pullBody.text  = pullObj.body
    
    authorUsername.text = pullObj.user?.login
    authorFullName.text = pullObj.created_at?.strDatePt()
    
    authorPicture.sd_setHighlightedImage(with: URL(string: (pullObj.user?.avatar_url)!)!, options: SDWebImageOptions(rawValue: 0)) { (image, error, cacheType, url) in
      if ((image) != nil){
        self.authorPicture.image = image
      }
    }
    
  }
  
  
}
