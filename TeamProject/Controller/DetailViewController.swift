//
//  DetailViewController.swift
//  TeamProject
//
//  Created by mun on 10/22/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var munImage: UIImageView!
    @IBOutlet weak var munName: UILabel!
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var smallName: UILabel!
    @IBOutlet weak var imageContent: UILabel!
    @IBOutlet weak var uploadTime: UILabel!
    @IBOutlet weak var dotImage: UIImageView!
    @IBOutlet weak var heartImage: UIImageView!
    @IBOutlet weak var commentImage: UIImageView!
    @IBOutlet weak var archiveImage: UIImageView!
    
    var iconInfo: IconInfo = IconInfo(dotImage: "dot", heartImage: "heart",commentImage: "comment", archiveImage: "archive")

    // collectionView에서 넘어온 값
    var prepareDetailImage: String!
    var prepareMunImage: String!
    var prepareName: String!
    var prepareContent: String!
    var prepareTime: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        munName.text = prepareName
        smallName.text = prepareName
        munImage.image = UIImage(named: prepareMunImage)
        munImage.layer.cornerRadius = munImage.frame.height / 2
        detailImage.image = UIImage(named: prepareDetailImage)
        imageContent.text = prepareContent
        uploadTime.text = prepareTime
        
        dotImage.image = UIImage(named: iconInfo.dotImage)
        heartImage.image = UIImage(named: iconInfo.heartImage)
        commentImage.image = UIImage(named: iconInfo.commentImage)
        archiveImage.image = UIImage(named: iconInfo.archiveImage)
        
        setupGestureRecognizerHeart()
        setupGestureRecognizerArchive()
        

    }

}

// 좋아요, 저장 토글 구현
extension DetailViewController {
    
    // 좋아요 이미지 클릭 제스처 인식
    private func setupGestureRecognizerHeart() {
        let tapGestureRecognizerHeart = UITapGestureRecognizer(target: self, action: #selector(handleTapGestureHeart))
        heartImage.addGestureRecognizer(tapGestureRecognizerHeart)
        heartImage.isUserInteractionEnabled = true
    }
    
    // 저장 이미지 클릭 제스처 인식
    private func setupGestureRecognizerArchive() {
        let tapGestureRecognizerArchive = UITapGestureRecognizer(target: self, action: #selector(handleTapGestureArchive))
        archiveImage.addGestureRecognizer(tapGestureRecognizerArchive)
        archiveImage.isUserInteractionEnabled = true
    }
    
    // 좋아요 이미지 클릭시 작동
    @objc func handleTapGestureHeart(_ tapGestureRecognizerHeart: UITapGestureRecognizer) {
        if iconInfo.heartImage == "heart" {
            heartImage.image = UIImage(named: "heartFill")
            iconInfo.heartImage = "heartFill"
        } else {
            heartImage.image = UIImage(named: "heart")
            iconInfo.heartImage = "heart"
        }
    }
    
    //저장 이미지 클릭시 작동
    @objc func handleTapGestureArchive(_ tapGestureRecognizerSend: UITapGestureRecognizer) {
        if iconInfo.archiveImage == "archive" {
            archiveImage.image = UIImage(named: "archiveFill")
            iconInfo.archiveImage = "archiveFill"
        } else {
            archiveImage.image = UIImage(named: "archive")
            iconInfo.archiveImage = "archive"

        }
    }
}
