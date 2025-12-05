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
    
    private lazy var backImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "素食拼盘"))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var dishView: DishContentView = {
        let view = DishContentView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 30
        return view
    }()
    
    // MARK: - 公有方法
    override func viewDidLoad() {
        super.viewDidLoad()
//        addButton()
    }
    
    public func updateUI(with data: Dish,types: Species){
        dishView.updateUI(with: data)
        self.data = data
        self.foodType = types
        self.backImageView.image = UIImage(named: data.image)
    }
    
    // MARK: - 私有方法
    
    private func configNavbar() {
        self.navigation.bar.isShadowHidden = true
        self.navigation.bar.alpha = 0
        self.navigation.bar.backBarButtonItem = nil
        
        // 顶部导航栏
        self.navigation.item.titleView = titleView
        // 状态栏白色
        self.navigation.bar.statusBarStyle = .lightContent
    }
    
    private func configUI() {
        self.view.backgroundColor = .white
        self.view.addSubview(scrollView)
        scrollView.addSubview(backImageView)
        scrollView.addSubview(dishView)
        
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        backImageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(-90)
            make.left.equalToSuperview()
            make.width.equalTo(CFWidth)
            make.height.equalTo(200)
        }
        
        dishView.snp.makeConstraints { (make) in
            make.top.equalTo(backImageView.snp.bottom).offset(-15)
            make.left.equalToSuperview()
            make.width.equalTo(CFWidth)
            make.height.equalTo(CFHeight - 100)
        }
    }
    
    func addButton() {
        dishView.buttonBlock = {
            let message = [self.foodType: self.data.image]
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "addFood"), object: message)
        }
    }
    
    @objc func clickLeftBackButton(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func clickRightShareButton(){
        let vc = viewcon()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension DishDetailViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let maxOffset: CGFloat = 250
        //print(scrollView.contentOffset.y)
        if !viewScroll {
            scrollView.contentOffset.y = maxOffset
        } else {
            if scrollView.contentOffset.y >= maxOffset {
                scrollView.contentOffset.y = maxOffset
                viewScroll = false
                dishView.tableScroll = true
            }
        }
        //当table不够长时保证能够向上滑回
        if !viewScroll && dishView.tableScroll && dishView.ingredientsTableView.contentOffset.y == 0{
            viewScroll = true
        }
    }
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
