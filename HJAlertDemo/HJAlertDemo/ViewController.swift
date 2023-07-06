//
//  ViewController.swift
//  HJAlertDemo
//
//  Created by khj on 2023/7/6.
//
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        let btn = UIButton()
        btn.titleLabel?.font = .systemFont(ofSize: 21, weight: .regular)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.setTitle("点击按钮", for: .normal)
        btn.addTarget(self, action: #selector(didClickedConfirmButton), for: UIControl.Event.touchUpInside)
        view.addSubview(btn)
        btn.frame = CGRect(x: 100, y: 200, width: 100, height: 100)
        btn.backgroundColor = .red
    }
    @objc func didClickedConfirmButton() {
//        HJAlert.alert(title: "温馨提示",message: "没有内存了",rightBtnTitle: "确定")

    }


}

