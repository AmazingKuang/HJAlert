//
//  AlertShow.swift
//  LINNERHA
//
//  Created by khj on 2023/6/10.
//

import UIKit
extension HJAlert{
    ///适配器回调,用于给适配器参数赋值
    public typealias ConfigAlert = ((_ config : HJShowAlertConfig) -> Void)
    
    /// 默认样式Alert
    /// - Parameters:
    ///   - title: 标题
    ///   - message: 信息
    ///   - leftBtnTitle: 左侧按钮标题
    ///   - rightBtnTitle: 右侧按钮标题
    ///   - leftBlock: 左侧按钮回调
    ///   - rightBlock: 右侧按钮回调
    public class func alert(title: String? = nil,
                            message: String?  = nil,
                            leftBtnTitle: String? = nil,
                            rightBtnTitle: String? = nil,
                            leftBlock: LeftCallBack? = nil,
                            rightBlock: RightCallback? = nil) {
        hjCustomAlert(title: title,
                    message: message,
                    leftBtnTitle: leftBtnTitle,
                    rightBtnTitle: rightBtnTitle,
                    leftBlock: leftBlock,
                    rightBlock: rightBlock)
    }
    
    /// 富文本样式Alert
    /// - Parameters:
    ///   - attributedTitle: 富文本标题
    ///   - attributedMessage: 富文本信息
    ///   - leftBtnAttributedTitle: 富文本左侧按钮标题
    ///   - rightBtnAttributedTitle: 富文本右侧按钮标题
    ///   - leftBlock: 左侧按钮回调
    ///   - rightBlock: 右侧按钮回调
    public class func attributedAlert(attributedTitle : NSAttributedString? = nil,
                                      attributedMessage : NSAttributedString? = nil,
                                      leftBtnAttributedTitle: NSAttributedString? = nil,
                                      rightBtnAttributedTitle: NSAttributedString? = nil,
                                      leftBlock: LeftCallBack? = nil,
                                      rightBlock: RightCallback? = nil) {
        hjCustomAlert(attributedTitle: attributedTitle,
                    attributedMessage: attributedMessage,
                    leftBtnAttributedTitle: leftBtnAttributedTitle,
                    rightBtnAttributedTitle: rightBtnAttributedTitle,
                    leftBlock: leftBlock,
                    rightBlock: rightBlock)
    }
    
    /// 自定义Alert
    /// - Parameters:
    ///   - title: 标题
    ///   - attributedTitle: 富文本标题
    ///   - titleImage: 顶图
    ///   - message: 信息
    ///   - attributedMessage: 富文本信息
    ///   - leftBtnTitle: 左侧按钮标题
    ///   - leftBtnAttributedTitle: 富文本左侧按钮标题
    ///   - rightBtnTitle: 右侧按钮标题
    ///   - rightBtnAttributedTitle: 富文本右侧按钮标题
    ///   - leftBlock:  左侧按钮回调
    ///   - rightBlock: 右侧按钮回调
    ///   - config: Alert适配器，不传为默认样式
    private class func hjCustomAlert(title: String? = nil,
                                  attributedTitle : NSAttributedString? = nil,
                                  image: UIImage? = nil,
                                  message: String?  = nil,
                                  attributedMessage : NSAttributedString? = nil,
                                  leftBtnTitle: String? = nil,
                                  leftBtnAttributedTitle: NSAttributedString? = nil,
                                  rightBtnTitle: String? = nil,
                                  rightBtnAttributedTitle: NSAttributedString? = nil,
                                  leftBlock: LeftCallBack? = nil,
                                  rightBlock: RightCallback? = nil,
                                  config : ConfigAlert? = nil) {
        hideAlert()
        
        let model = HJShowAlertConfig()
        config?(model)
        
        let alertView = HJAlertShowView(title: title,
                                  attributedTitle: attributedTitle,
                                  image: image,
                                  message: message,
                                  attributedMessage: attributedMessage,
                                  leftBtnTitle: leftBtnTitle,
                                  leftBtnAttributedTitle: leftBtnAttributedTitle,
                                  rightBtnTitle: rightBtnTitle,
                                  rightBtnAttributedTitle: rightBtnAttributedTitle,
                                  config: model)
        alertView.leftBlock = leftBlock
        alertView.rightBlock = rightBlock
        alertView.dismissBlock = {
            hideAlert()
        }
        getWindow().addSubview(alertView)
        alertView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
    }
    
    /// 手动隐藏Alert
    public class func hideAlert() {
        getWindow().subviews.forEach { (view) in
            if view.isKind(of: HJAlertShowView.self){
                
                UIView.animate(withDuration: 0.3, animations: {
                    view.alpha = 0
                }) { (_) in
                    view.removeFromSuperview()
                }
            }
        }
    }
    
}
//MARK: -- 获取最上层视图

public class HJAlert {
    /// 通用回调
    public typealias CallBack = () -> Void
    
    private static var showCoverCallBack : CallBack?
    private static var hideCoverCallBack : CallBack?
    private static var willShowCoverCallBack : CallBack?
    private static var willHideCoverCallBack : CallBack?
    
    private static var showPopCallBack : CallBack?
    private static var hidePopCallBack : CallBack?
    
    private class func getWindow() -> UIWindow {
        var window = UIApplication.shared.keyWindow
        //是否为当前显示的window
        if window?.windowLevel != UIWindow.Level.normal{
            let windows = UIApplication.shared.windows
            for  windowTemp in windows{
                if windowTemp.windowLevel == UIWindow.Level.normal{
                    window = windowTemp
                    break
                }
            }
        }
        return window!
    }
    
    /// 获取顶层VC 根据window
    public class func currentViewController() -> UIViewController? {
        let vc = getWindow().rootViewController
        return getCurrentViewController(withCurrentVC: vc)
    }
    
    ///根据控制器获取 顶层控制器 递归
    private class func getCurrentViewController(withCurrentVC VC :UIViewController?) -> UIViewController? {
        if VC == nil {
            debugPrint("🍌： 找不到顶层控制器")
            return nil
        }
        if let presentVC = VC?.presentedViewController {
            //modal出来的 控制器
            return getCurrentViewController(withCurrentVC: presentVC)
        }
        else if let splitVC = VC as? UISplitViewController {
            // UISplitViewController 的跟控制器
            if splitVC.viewControllers.count > 0 {
                return getCurrentViewController(withCurrentVC: splitVC.viewControllers.last)
            }else{
                return VC
            }
        }
        else if let tabVC = VC as? UITabBarController {
            // tabBar 的跟控制器
            if tabVC.viewControllers != nil {
                return getCurrentViewController(withCurrentVC: tabVC.selectedViewController)
            }else{
                return VC
            }
        }
        else if let naiVC = VC as? UINavigationController {
            // 控制器是 nav
            if naiVC.viewControllers.count > 0 {
                //                return getCurrentViewController(withCurrentVC: naiVC.topViewController)
                return getCurrentViewController(withCurrentVC:naiVC.visibleViewController)
            }else{
                return VC
            }
        }
        else {
            // 返回顶控制器
            return VC
        }
    }
}
