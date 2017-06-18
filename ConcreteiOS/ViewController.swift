//
//  ViewController.swift
//  ConcreteiOS
//
//  Created by IFCE on 16/06/17.
//  Copyright © 2017 Concrete. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
  @IBOutlet weak var mainTableView: UITableView!
  var dataFeed = [Repo]()
  var isLoadingFeed = false
  var page = 1
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Config TableView
    mainTableView.delegate = self
    mainTableView.dataSource = self
    mainTableView.tableFooterView = UIView()
    mainTableView.rowHeight = UITableViewAutomaticDimension
    mainTableView.estimatedRowHeight = 150.0
    
    
    // Making FeedRequestByPage
    RepoDAO.getFeedByPagination(page: page) { (repoModels) in
      if let repoModels = repoModels{
        self.dataFeed = repoModels
        self.mainTableView.reloadData()
      }
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  // MARK: - TableViewDataSource
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "feed_cell", for: indexPath) as! FeedRepoTVCell
    
    cell.mountCellForData(repo: dataFeed[indexPath.row])
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dataFeed.count
  }
  
  func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    return UIView()
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    if (dataFeed.count > 0) {
      return nil
    }
    let header = tableView.dequeueReusableCell(withIdentifier: "feed_loadHeader") as! FeedLoadHeaderTVC
    return header
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    if (dataFeed.count > 0) {
      return 0.0
    }
    return 80.0
  }
  
  // MARK: - TableViewDelegate
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    performSegue(withIdentifier: "sg_showRepoInfo", sender: dataFeed[indexPath.row])
  }
  
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    
    if (indexPath.row > dataFeed.count-10 && !isLoadingFeed) {
      mainTableView.tableFooterView = tableView.dequeueReusableCell(withIdentifier: "feed_loadHeader")
      isLoadingFeed = true
      page += 1
      
      // getting more Repos to append on FeedList
      RepoDAO.getFeedByPagination(page: page, completionHandler: { (repoList) in
        if let repoList = repoList {
          
          self.dataFeed.append(contentsOf: repoList)
          
          self.mainTableView.tableFooterView = UIView()
          self.mainTableView.reloadData()
          self.isLoadingFeed = false
        }
        
      })
    }
    
  }
  
  // MARK: - Navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "sg_showRepoInfo" {
      let repo = sender as! Repo
      let destinationVC = segue.destination as! DetailRepoVC
      destinationVC.repo = repo
    }
  }
  
  
}

