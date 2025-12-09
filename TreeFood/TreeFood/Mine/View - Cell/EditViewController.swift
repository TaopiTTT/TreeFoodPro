//
//  EditViewController.swift
//  TreeFood
//
//  Created by Tao on 2025/12/9.
//

import CoreMIDI
import UIKit

class EditViewController: UIViewController {
    // MARK: - 公有属性
    
    // 通过MineModel实时接收更新的内容
    var editCallBack: ((MineModel) -> Void)?
    
    // MARK: - 私有属性
    
    private var data = MineModel()
    private let editHeadCellID = "editHeadCell"
    private let editBodyCellID = "editBodyCell"
    private var UserImage: UIImage?
    
    private lazy var tableView: UITableView = {
        let tableview = UITableView()
        tableview.isScrollEnabled = false
        tableview.delegate = self
        tableview.dataSource = self
        tableview.separatorStyle = .none
        tableview.backgroundColor = UIColor(r: 247, g: 247, b: 247)
        tableview.register(EditBodyTableViewCell.classForCoder(), forCellReuseIdentifier: editBodyCellID)
        tableview.register(EditHeadTableViewCell.classForCoder(), forCellReuseIdentifier: editHeadCellID)
        return tableview
    }()
    
    private lazy var editLabel: UILabel = {
        let label = UILabel()
        label.text = "编辑资料"
        label.numberOfLines = 0.fit
        label.font = UIFont(name: "PingFang SC", size: 16.fit)
        label.textColor = UIColor(red: 0.57.fit, green: 0.54.fit, blue: 0.54.fit, alpha: 1.fit)
        label.alpha = 1.fit
        return label
    }()
}
