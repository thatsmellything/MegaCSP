//
//  DataViewController.swift
//  MegaCSP
//
//  Created by Judkins, Jensen on 1/11/19.
//  Copyright © 2019 Judkins, Jensen. All rights reserved.
//

import UIKit

class DataViewController: UITableViewController {
    
    lazy var bucketList : [BucketItem] =
        {
            return loadBucketListFromFile()
    }()
    
    private func loadBucketListFromFile() -> [BucketItem]
    {
        var items = [BucketItem]()
        do
        {
            if let filePath = Bundle.main.url(forResource: "bucket18", withExtension: "csv")
            {
                let input = try String(contentsOf: filePath)
                let bucketLines = input.components(separatedBy: "\n")
                for line in bucketLines
                {
                    let item = line.components(separatedBy: ",")
                    items.append(BucketItem(contents: item[0], author: item[1]))
                }
            }
        }
        catch
        {
            print("File load error")
        }
        return items
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int
    {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // #warning Incomplete implementation, return the number of rows
        return bucketList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! BucketItemCell
        cell.currentBucketItem = bucketList[indexPath.row]
        return cell
    }
    

    
    
    

}
