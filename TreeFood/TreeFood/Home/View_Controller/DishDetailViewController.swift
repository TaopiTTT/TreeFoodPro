//
//  DishDetailViewController.swift
//  TreeFood
//
//  Created by Tao on 2025/11/23.
//

import UIKit
import SnapKit

class DishDetailViewController: UIViewController {
    
    // MARK: - 公有属性
    
    // MARK: - 私有属性
    
    private var data = Dish()
    private var viewScroll = true
    private var foodType = Species.Breakfast
    
    private lazy var scrollView: bottomScrollView = {
        let view = bottomScrollView()
        view.showsVerticalScrollIndicator = false
        view.backgroundColor = .clear
        view.delegate = self
        return view
    }()
    
    private lazy var titleView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: CFWidth, height: kNavBarHeight))
        view.addSubview(self.leftBackImageView)
        view.addSubview(self.leftButton)
        view.addSubview(self.rightShareImageView)
        view.addSubview(self.rightButton)
        return view
    }()
    
    private lazy var leftBackImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "back"))
        imageView.frame = CGRect(x: 10.fit, y: 7.fit, width: 30.fit, height: 30.fit)
        return imageView
    }()
    
    private lazy var leftButton: UIButton = {
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 10.fit, y: 7.fit, width: 30.fit, height: 30.fit)
        button.addTarget(self, action: #selector(clickLeftBackButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var rightButton: UIButton = {
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: CFWidth - 55.fit, y: 7.fit, width: 30.fit, height: 30.fit)
        button.addTarget(self, action: #selector(clickRightShareButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var rightShareImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "share"))
        imageView.frame = CGRect(x: CFWidth - 55.fit, y: 7.fit, width: 30.fit, height: 30.fit)
        return imageView
    }()
    
    
    // MARK: - 私有方法
    
    @objc func clickLeftBackButton(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func clickRightShareButton(){
        let vc = viewcon()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension DishDetailViewController: UIScrollViewDelegate {
    
}

// TODO: 完善分享功能

class viewcon: UIViewController{
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "该功能还未设计"
        label.textAlignment = .center
        label.font = UIFont(name: "Arial", size: 24)
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(label)
        configui()
    }
    func configui(){
        label.snp.makeConstraints { make in
       
            make.left.right.top.bottom.equalToSuperview()
        }
    }
}
