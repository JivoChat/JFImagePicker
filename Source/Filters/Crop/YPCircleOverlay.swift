//
//  YPCircleMask.swift
//  YPImagePicker
//
//  Created by Stan Potemkin on 06.03.2020.
//

import Foundation
import UIKit

final class YPCircleOverlay: UIView {
    private let maskLayer = CAShapeLayer()
    
    init() {
        super.init(frame: .zero)
        
        isUserInteractionEnabled = false
        
        maskLayer.fillRule = .evenOdd
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func install(onto anotherView: UIView) {
        frame = anotherView.bounds
        backgroundColor = UIColor.black.withAlphaComponent(0.7)
        autoresizingMask = [.flexibleWidth, .flexibleHeight]
        anotherView.addSubview(self)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let side = min(bounds.width, bounds.height)
        let leftX = (bounds.width - side) * 0.5
        let topY = (bounds.height - side) * 0.5
        let area = CGRect(x: leftX, y: topY, width: side, height: side)
        
        let rootPath = UIBezierPath(rect: area)
        rootPath.append(UIBezierPath(ovalIn: area))
        maskLayer.path = rootPath.cgPath
        layer.mask = maskLayer
    }
}
