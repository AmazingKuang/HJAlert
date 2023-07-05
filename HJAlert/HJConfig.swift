//
//  LNNConfig.swift
//  LINNERHA
//
//  Created by khj on 2023/6/10.
//

import Foundation
import UIKit

public enum HJMaskType {
    case color
    case effect
}

public enum HJToastOffset {
    case top
    case center
    case bottom
}

public enum HJImageLayoutType {
    ///按钮图片居左 文案居右
    case left
    ///按钮图片居上 文案居下
    case top
}

public class HJShowAlertConfig {
    ///执行动画时间
    public var animateDuration = 0.5
    ///背景蒙版 毛玻璃
    public var effectStyle = UIBlurEffect.Style.light

    ///alert宽度
    public var width : Float = 280
    ///alert最大高度
    public var maxHeight : Float = 500
    ///alert按钮高度
    public var buttonHeight : Float = 50
    ///alert圆角
    public var cornerRadius : CGFloat = 12
    ///alert图文间距
    public var space : Float = 5
    
    ///alert主体颜色 默认
    public var tintColor : UIColor = .whiteBGColor
    ///alert背景颜色
    public var bgColor : UIColor = UIColor.black.withAlphaComponent(0.5)
    ///alert分割线颜色
    public var lineColor : UIColor = .lightGray
    ///默认蒙版类型
    public var maskType : HJMaskType = .color
    ///阴影
    public var shadowColor : CGColor = UIColor.clear.cgColor
    public var shadowOpacity : Float = 0.5
    public var shadowRadius : CGFloat = 5
    
    ///alert标题字体
    public var titleFont : UIFont = UIFont.systemFont(ofSize: 21)
    /// alert标题字体颜色
    public var titleColor : UIColor = .textColor
    ///alert信息字体
    public var textFont : UIFont = UIFont.systemFont(ofSize: 14)
    /// alert信息字体颜色
    public var textColor : UIColor = .textColor
    ///alert left按钮字体
    public var buttonLeftFont : UIFont = UIFont.systemFont(ofSize: 15)
    ///alert right按钮字体
    public var buttonRightFont : UIFont = UIFont.systemFont(ofSize: 15)
    /// alert按钮字体颜色
    public var leftColor : UIColor = .textColor
    public var rightColor : UIColor = .textColor
    /// 按钮背景颜色
    public var leftBgColor : UIColor = .kBgColor
    public var rightBgColor : UIColor = .kBgColor
    ///alert背景与内容之间的上下边距 默认10
    public var verticalPadding : Float = 10
    ///alert背景与内容之间的左右边距 默认10
    public var horizontalPadding : Float = 10
    /// 一个按钮间距
    public var rightButtonPadding : Float = 0
}

extension UIColor {
    
    @available(iOS 13.0, *)
    static let blackChangeColor = UIColor { (trainCollection) -> UIColor in
        if trainCollection.userInterfaceStyle == .dark {
            return UIColor(red: 0.110, green: 0.110, blue: 0.110, alpha: 1.0)
        } else {
            return UIColor.black
        }
    }

    @available(iOS 13.0, *)
    static let whiteChangeColor = UIColor { (trainCollection) -> UIColor in
        if trainCollection.userInterfaceStyle == .dark {
            return UIColor(red: 0.110, green: 0.110, blue: 0.110, alpha: 1.0)
        } else {
            return UIColor.white
        }
    }

    @available(iOS 13.0, *)
    static let textChangeColor = UIColor { (trainCollection) -> UIColor in
        if trainCollection.userInterfaceStyle == .dark {
            return UIColor.white
        } else {
            return UIColor.black
        }
    }
    
    static var blackBGColor: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor.blackChangeColor
        }else{
            return UIColor.black
        }
    }
    
    static var whiteBGColor: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor.whiteChangeColor
        }else{
            return UIColor.white
        }
    }
    
    static var textColor: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor.textChangeColor
        }else{
            return UIColor.black
        }
    }
    static var kBgColor: UIColor {
        
        return UIColor.clear
        
    }
}
