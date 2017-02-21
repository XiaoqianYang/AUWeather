//
//  MyStyle.swift
//  AUWeather
//
//  Created by Xiaoqian Yang on 21/2/17.
//  Copyright © 2017 XiaoqianYang. All rights reserved.
//
import GradientCircularProgress

public struct MyStyle: StyleProperty {
    // Progress Size
    public var progressSize: CGFloat = 150
    
    // Gradient Circular
    public var arcLineWidth: CGFloat = 8.0
    public var startArcColor: UIColor = ColorUtil.toUIColor(r: 235.0, g: 245.0, b: 255.0, a: 1.0)
    public var endArcColor: UIColor = ColorUtil.toUIColor(r: 0.0, g: 122.0, b: 255.0, a: 1.0)
    
    // Base Circular
    public var baseLineWidth: CGFloat? = 8.0
    public var baseArcColor: UIColor? = ColorUtil.toUIColor(r: 215.0, g: 215.0, b: 215.0, a: 0.4)
    
    // Ratio
    public var ratioLabelFont: UIFont? = nil
    public var ratioLabelFontColor: UIColor? = nil
    
    // Message
    public var messageLabelFont: UIFont? = UIFont.systemFont(ofSize: 15.0)
    public var messageLabelFontColor: UIColor? = UIColor.black
    
    // Background
    public var backgroundStyle: BackgroundStyles = .light
    
    // Dismiss
    public var dismissTimeInterval: Double? = nil // 'nil' for default setting.
    
    public init() {}
}
