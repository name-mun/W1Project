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
        
    let munInfo: MunInfo = MunInfo(name:"name.mun",
                                   description: "가치있는 앱을 만드는 개발자가 되겠습니다!",
                                   mbti: "ESFP",
                                   blogURL: "https://name-mun.tistory.com",
                                   githubURL: "https://github.com/name-mun",
                                   profileImage: "profileImage",
                                   photo: ["collectionPhoto1.jpg", "collectionPhoto2.jpg","collectionPhoto3.jpg","collectionPhoto4.jpg","collectionPhoto5.jpg","collectionPhoto6.jpg","collectionPhoto7.jpg","collectionPhoto8.jpg","collectionPhoto9.jpg","collectionPhoto10.jpg"],
                                   content: ["저는 창업 관련 대회 수상이 많습니다!", "저는 좋은 소통에 관심이 많아요", "도전하는 삶을 좋아합니다! 최근에는 산티아고 순례길을 완주했어요!", "저는 깔끔하고 정돈된 환경을 좋아하고 그렇게 만듭니다","깊은 관계를 선호합니다","대화를 잘 하기 위해 노력해요","저는 정한 규칙을 잘 따릅니다","맡은 일은 확실하게! 책임감을 가지고 프로젝트를 수행합니다","피드백을 주면 바로 적용합니다!","잘 부탁드립니다"],
                                   time: ["OCTOBER 23","OCTOBER 22","OCTOBER 21","OCTOBER 20","OCTOBER 20","OCTOBER 19","OCTOBER 18","OCTOBER 17","OCTOBER 17","OCTOBER 17"])
    
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
        
        // colelctionView 레이아웃 설정
        layout.itemSize = CGSize(width: itemWidth-2, height: itemWidth-2)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 1, bottom: 0, right: 1)
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 2
        munPhotoCollectionView.collectionViewLayout = layout
        
    }
    
    // 블로그 버튼 클릭시 링크 이동
    @IBAction func clickBlogButton(_ sender: Any) {
        let blogURL = NSURL(string:"https://name-mun.tistory.com")
        let blogSafariView: SFSafariViewController = SFSafariViewController(url: blogURL as! URL)
        self.present(blogSafariView, animated: true, completion: nil)
    }
    
    // 깃허브 버튼 클릭시 링크 이동
    @IBAction func clickGithubButton(_ sender: Any) {
        let githubURL = NSURL(string:"https://github.com/name-mun")
        let githubSafariView: SFSafariViewController = SFSafariViewController(url: githubURL as! URL)
        self.present(githubSafariView, animated: true, completion: nil)
    }
    
}

extension MyViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    // collectionView 아이템 갯수 설정
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        // photo 배열 길이로 설정
        return munInfo.photo.count
    }
    
    // collectionView cell 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = munPhotoCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        // 각 셀에 photo 배열의 요소를 하나씩 넣음
        cell.collectionImageView.image = UIImage(named: munInfo.photo[indexPath.row])
        return cell
    }
    
    // collectionView 클릭시 MunDetailViewController 화면으로 이동하는 함수
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // MunView 스토리보드에 있는 MunDetailViewController의 데이터를 가져와서 vc 생성
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        print("test")

        // MunDetailViewController에 전해줄 값 저장
        vc.prepareName = munInfo.name
        vc.prepareMunImage = munInfo.profileImage
        vc.prepareDetailImage = munInfo.photo[indexPath.row]
        vc.prepareContent = munInfo.content[indexPath.row]
        vc.prepareTime = munInfo.time[indexPath.row]
        
        //  vc로 네비게이션 이동
        self.navigationController?.pushViewController(vc, animated: true)

    }
}
