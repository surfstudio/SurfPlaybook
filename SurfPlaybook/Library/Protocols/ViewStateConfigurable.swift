//
//  ViewStateConfigurable.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 28.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

protocol ViewStateConfigurable {
    func setup(state: ViewState)
}

enum ViewState {
    case normal
    case empty(text: String)
}
