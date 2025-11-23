//
//  HomeViewController.swift
//  TreeFood
//
//  Created by Tao on 2025/11/23.
//

import Foundation
import UIKit

class HomeViewController:UIViewController {
    
    var homeData = HomeData()
    
    // MARK: - 私有属性（复用id）
    fileprivate let SearchCellID = "SearchCollectionViewCell"
    fileprivate let RecommendCellID = "RecommendCollectionViewCell"
    fileprivate let SupplementCellID = "SupplementCollectionViewCell"
    fileprivate let SuggesttCellID = "SuggestCollectionViewCell"
    fileprivate let PreferenceCellID = "PreferenceCollectionViewCell"
    fileprivate let SectionHeadCellID = "SectionHeadCell"
    
    private var searchData = [Dish]()
    private var recommendData = [Dish]()
    private var supplements = [Supplement]()
    private var FoodType = [Species]()
    
    // MARK: - 界面初始化
    
    override func viewDidLoad() {
        super.viewDidLoad()
//      self.collectionView.automaticallyAdjustsScrollIndicatorInsets = false
        view.backgroundColor = .black
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    
    // MARK: - 控件设计
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewLayout()
        let collectionView = UICollectionView(frame: .zero,collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.showsVerticalScrollIndicator = false
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register()
        
        return collectionView
    }()
}

extension HomeViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCellID, for: indexPath)
        
        return cell
    }
    
    
    
    
}
