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
    
    // MARK: - 私有属性
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
        view.backgroundColor = .white
        setUpUI()
        setNaviBar()
        
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
        
        collectionView.register(SearchCollectionViewCell.self,forCellWithReuseIdentifier: SearchCellID)
//        collectionView.register(RecommendCollectionViewCell.self, forCellWithReuseIdentifier: RecommendCellID)
//        collectionView.register(SupplementCollectionViewCell.self, forCellWithReuseIdentifier: SupplementCellID)
//        collectionView.register(SuggestCollectionViewCell.self, forCellWithReuseIdentifier: SuggesttCellID)
//        collectionView.register(PreferenceCollectionViewCell.self, forCellWithReuseIdentifier: PreferenceCellID)
//        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeadCellID)
        return collectionView
    }()
    
    // TODO: 中间添加按钮功能入口
    
    
    // MARK: - 私有方法
    
    private func setUpUI() {
        view.backgroundColor = .white
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.left.equalTo(self.view.snp.left).offset(0)
            make.right.equalTo(self.view.snp.right).offset(0)
            make.bottom.equalToSuperview()
            make.top.equalTo(self.navigation.bar.snp.top).offset(0.fit)
        }
    }
    
    // TODO: 中间按钮方法实现
    
    
    private func setNaviBar() {
        navigation.bar.isHidden = true
        navigation.bar.isShadowHidden = true
        navigation.bar.alpha = 0
        navigation.bar.statusBarStyle = .darkContent
    }
    
    // TODO: 插入数据

}

// MARK: - 设置数据源与代理方法

extension HomeViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCellID, for: indexPath)
        
        return cell
    }
}

// MARK: - 设置布局

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            return CGSize(width: CFWidth, height: 175.fit)
        case 1:
            return CGSize(width: CFWidth, height: 300.fit)
        case 2:
            return CGSize(width: CFWidth, height: 310.fit)
        case 3:
            return CGSize(width: CFWidth, height: 275.fit)
        case 4:
            return CGSize(width: CFWidth, height: 230.fit)
        default:
            return CGSize(width: CFWidth, height: 0)
        }
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionHeadView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeadCellID, for: indexPath)
        sectionHeadView.backgroundColor = UIColor(red: 0.99, green: 0.98, blue: 0.98, alpha: 1)
        return sectionHeadView
    }

    // section头部高度
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize(width: CFWidth, height: 0)
        }
        return CGSize(width: CFWidth, height: 15.fit)
    }

    // section内边距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0.fit, left: 0, bottom: 15.fit, right: 0)
    }

    // section间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.fit
    }
}

// MARK: - 设置动画
extension HomeViewController {
    func cellAnimation(cell: UICollectionViewCell, interval: TimeInterval) {
        UIView.animate(withDuration: 0.0) {
            cell.transform = CGAffineTransform(translationX: CFWidth, y: 0.0)
        }
        delay(by: interval) {
            UIView.animate(withDuration: interval + 0.1) {
                cell.transform = CGAffineTransform.identity
            }
        }
    }

    func delay(by delay: TimeInterval, code block: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(delay * Double(NSEC_PER_SEC)) / Double(NSEC_PER_SEC),
            execute: block)
    }
}
