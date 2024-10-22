//
//  MyViewController.swift
//  TeamProject
//
//  Created by mun on 10/22/24.
//

import UIKit
import SafariServices

class MyViewController: UIViewController {
    
    @IBOutlet weak var munImage: UIImageView!
    @IBOutlet weak var munName: UILabel!
    @IBOutlet weak var munDescription: UILabel!
    @IBOutlet weak var munPhotoCollectionView: UICollectionView!
        
    let munInfo: MunInfo = MunInfo(name:"서문가은",
                                   description: "가치있는 앱을 만드는 개발자가 되겠습니다!",
                                   mbti: "ESFP",
                                   strengths:["a"],
                                   style:["a"],
                                   cooperation:["a"],
                                   blogURL: "https://name-mun.tistory.com",
                                   profileImage: "profileImage",
                                   photo: ["collectionPhoto1.jpg", "collectionPhoto2.jpg","collectionPhoto3.jpg","collectionPhoto4.jpg"])
    
    let layout = UICollectionViewFlowLayout()
    let itemWidth: CGFloat = UIScreen.main.bounds.width/3.0

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        munPhotoCollectionView.delegate = self
        munPhotoCollectionView.dataSource = self
        
        munImage.image = UIImage(named: munInfo.profileImage)
        munImage.layer.cornerRadius = munImage.frame.height/2
        munName.text = munInfo.name
        munDescription.text = munInfo.description
        
        layout.itemSize = CGSize(width: itemWidth-2, height: itemWidth-2)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 1, bottom: 0, right: 1)
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 2
        munPhotoCollectionView.collectionViewLayout = layout
        
    }
    
    @IBAction func clickBlogButton(_ sender: Any) {
        let blogURL = NSURL(string:"https://name-mun.tistory.com")
        let blogSafariView: SFSafariViewController = SFSafariViewController(url: blogURL as! URL)
        self.present(blogSafariView, animated: true, completion: nil)
    }
    
}


extension MyViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let number = munInfo.photo.count
        return number
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = munPhotoCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        let photo = munInfo.photo[indexPath.row]
        cell.collectionImageView.image = UIImage(named: photo)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let photo = munInfo.photo[indexPath.row]
        let vc = DetailViewController()
        vc.munDetailInfo.detailImage = photo
        //self.navigationController?.pushViewController(vc, animated: true)
        print(photo)
    }
    
    
    
    
    
    //override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     //   if segue.identifier == "goDetail" {
      //      let goDetailVC = segue.destination as! DetailViewController
       //     let cell = sender as! UICollectionViewCell
       //    // let indexPath = self.munPhotoCollectionView!.indexPathForCell(cell)
        //}
    //}
    
    
}
