//
//  DetailRepoVC.swift
//  ConcreteiOS
//
//  Created by Francisco Júnior on 17/06/17.
//  Copyright © 2017 Concrete. All rights reserved.
//

import UIKit

class DetailRepoVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

  var repo : Repo?
  var dataPullList = [PullReq]()
  var num_openedPull = 0
  var num_closedPull = 0
  
  @IBOutlet weak var tableView: UITableView!
  
  
  override func viewWillAppear(_ animated: Bool) {
    
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Config NavigationView
    self.navigationItem.title = repo?.name
    self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    
    // Config TableView
    tableView.delegate   = self
    tableView.dataSource = self
    tableView.tableFooterView = UIView()
    tableView.rowHeight = UITableViewAutomaticDimension
    tableView.estimatedRowHeight = 150.0
    
    // Making Request to get the RepoReqList
    if let repo = repo{
      PullReqDAO.getPullReqListByRepoName(repoName: repo.name!, ownerName: (repo.owner?.login)!) { (pullList, num_opened, num_closed) in
        if let pullList = pullList {
          self.dataPullList = pullList
          self.num_openedPull = num_opened
          self.num_closedPull = num_closed
          self.tableView.reloadData()
        }
      }
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: - TableViewDataSource
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "pullDetail_cell", for: indexPath) as! PullReqTVCell
    
    cell.mountCellByData(pullObj: dataPullList[indexPath.row])
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dataPullList.count
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    if (dataPullList.count > 0) {
      let header = tableView.dequeueReusableCell(withIdentifier: "header_pullDetail") as! HeaderPullDetailTVC
      header.backgroundColor = UIColor.white
      header.num_opened.text = "\(num_openedPull.toString()) opened"
      header.num_closed.text = "/ \(num_closedPull.toString()) closed"
      return header
    }
    let header = tableView.dequeueReusableCell(withIdentifier: "detail_loadHeader") as! FeedLoadHeaderTVC
    return header
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    if (dataPullList.count > 0) {
      return 40.0
    }
    return 80.0
  }
  
  // MARK: - TableViewDelegate
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let pullSelected = dataPullList[indexPath.row]
    if let url = URL(string: pullSelected.html_url!) {
      UIApplication.shared.open(url, options: [:], completionHandler: { (success) in
        
      })
    }
  }

}
