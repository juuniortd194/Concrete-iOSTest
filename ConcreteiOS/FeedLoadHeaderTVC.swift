//
//  FeedLoadHeaderTVC.swift
//  ConcreteiOS
//
//  Created by Francisco Júnior on 18/06/17.
//  Copyright © 2017 Concrete. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class FeedLoadHeaderTVC: UITableViewCell {

  @IBOutlet weak var loaderView: NVActivityIndicatorView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    loaderView.startAnimating()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
  func changeStateLoader() {
    if (loaderView.isAnimating){
      loaderView.stopAnimating()
    } else{
      loaderView.startAnimating()
    }
  }
  

}
