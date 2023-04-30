//
//  ImagesListCell.swift
//  ImageFeed
//
//  Created by Илья Чемоданов on 30.04.2023.
//

import UIKit

final class ImagesListCell: UITableViewCell {
    
    @IBOutlet weak var cellImage: UIImageView!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    static let reuseIdentifier = "ImagesListCell"
    
}
