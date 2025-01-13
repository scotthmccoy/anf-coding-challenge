//
//  ANFExploreCardTableViewController.swift
//  ANF Code Test
//

import UIKit

class ANFExploreCardTableViewController: UITableViewController {

    let reuseIdentifier = "MyCustomCellID"
    
    private var exploreData: [[AnyHashable: Any]]? {
        if let filePath = Bundle.main.path(forResource: "exploreData", ofType: "json"),
         let fileContent = try? Data(contentsOf: URL(fileURLWithPath: filePath)),
         let jsonDictionary = try? JSONSerialization.jsonObject(with: fileContent, options: .mutableContainers) as? [[AnyHashable: Any]] {
            return jsonDictionary
        }
        return nil
    }
    
    override func viewDidLoad() {
        tableView.register(ExploreCardCell.self, forCellReuseIdentifier: reuseIdentifier)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        exploreData?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        AppLog()
        
        // Get Data or bail
        guard let data = exploreData?[indexPath.row] else {
            return UITableViewCell()
        }
         
        // Create/dequeue the cell
        let exploreCardCell = self.tableView.dequeueReusableCell(
            withIdentifier: reuseIdentifier,
            for: indexPath
        ) as? ExploreCardCell ?? ExploreCardCell()
        
        // Configure and return
        exploreCardCell.configure(data: data)
        return exploreCardCell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}
