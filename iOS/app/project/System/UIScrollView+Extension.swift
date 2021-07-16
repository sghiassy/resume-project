//
//  UIScrollView+Extension.swift
//  project
//
//  Created by Shaheen Ghiassy on 7/15/21.
//

import UIKit

extension UIScrollView {

    func scrollTo(horizontalPage:Int? = 0, verticalPage:Int? = 0, animated: Bool? = true) {
        let offset:CGPoint = CGPoint(x: CGFloat(horizontalPage ?? 0) * frame.size.width,
                                     y: CGFloat(verticalPage ?? 0) * frame.size.height)
        self.setContentOffset(offset, animated: animated ?? true)
    }

}
