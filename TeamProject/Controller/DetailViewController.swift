//
//  DetailViewController.swift
//  TeamProject
//
//  Created by mun on 10/22/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var munName: UILabel!
    @IBOutlet weak var munImage: UIImageView!
    @IBOutlet weak var heartImage: UIImageView!
    @IBOutlet weak var commentImage: UIImageView!
    @IBOutlet weak var sendImage: UIImageView!
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var smallMunName: UILabel!
    
    var munDetailInfo: MunDeatilInfo = MunDeatilInfo(detailImage: "collectionPhoto1.jpg",heartImage: "heart",commentImage: "comment",sendImage: "archive",content: "직접 찍은 사진")

    var munData: MunInfo!
    var prepareImage: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //detailImage.image = UIImage(named: munDetailInfo.detailImage)

    }

}

struct MunDeatilInfo {
    var detailImage: String
    var heartImage: String
    var commentImage: String
    var sendImage: String
    var content: String
}
