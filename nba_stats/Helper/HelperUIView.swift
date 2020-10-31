//
//  HelperUIView.swift
//  nba_stats
//
//  Created by Angelo Di Gianfilippo on 22/10/2020.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        for v in views {
            addSubview(v)
        }
    }
}
