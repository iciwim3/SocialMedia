//
//  ViewController.swift
//  Project1
//
//  Created by Sain-R Edwards on 6/9/18.
//  Copyright © 2018 Swift Koding 4 Everyone. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var pics = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        title = "Storm Viewer"
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                pics.append(item)
            }
        }
        print(pics)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pics.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = pics[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 1: try loading the "Detail" view controller and typecasting it to be DetailVC
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailVCViewController {
            
            // 2. Success! Set its selectedImage property
            vc.selectedImage = pics[indexPath.row]
            
            // 3. Now push it onto the navigation controller
            navigationController?.pushViewController(vc, animated: true)
        }
        
        
    }
}















