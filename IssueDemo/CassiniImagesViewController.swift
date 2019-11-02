//
//  ViewController.swift
//  IssueDemo
//
//  Created by Александр Рузманов on 02.11.2019.
//  Copyright © 2019 Александр Рузманов. All rights reserved.
//

import UIKit

class CassiniImagesViewController: UIViewController {
    
    // MARK:- Cassini image

    private var cassiniImage: UIImage? {
        guard let imageURL = Bundle.main.url(forResource: "Cassini",
                                             withExtension: imageTypeSwitch.isOn ? "jp2" : "jpg"),
            let imageData = try? Data(contentsOf: imageURL) else {return nil}
        return UIImage(data: imageData)
    }
    
    // MARK:- Outlets
    
    @IBAction private func toggleImageType(_ sender: UISwitch) {
        imageTypeLabel.text = imageTypeSwitch.isOn ? "JPEG 2000" : "JPEG"
        tableView.reloadData()
    }
    
    @IBOutlet private weak var imageTypeSwitch: UISwitch!
    
    @IBOutlet private weak var imageTypeLabel: UILabel!
    
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
        }
    }
}

// MARK:- Table view data source

extension CassiniImagesViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath)
        (cell as? ImageTableViewCell)?.embeddedImageView.image = cassiniImage
        return cell
    }
}

