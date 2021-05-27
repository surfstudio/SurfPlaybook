//
//  UIKitViewInput.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15/04/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

protocol UIKitViewInput: AnyObject, ViewStateConfigurable {
    func setupInitialState(pages: [PlaybookUIKitPage])
}
