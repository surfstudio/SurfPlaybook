//
//  UIKItPageCellModel.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 19.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

struct UIKitPageCellModel {
    let text: String
    let textColor: UIColor?
    let backgroundColor: UIColor?

    init(text: String,
         textColor: UIColor? = nil,
         backgroundColor: UIColor? = nil) {
        self.text = text
        self.textColor = textColor
        self.backgroundColor = backgroundColor
    }
}
