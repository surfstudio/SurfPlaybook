//
//  CommonButton.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

protocol OptionSelectorViewOutput {
    func viewLoaded()
    func selectValue(_ value: StringRepresentable)
    func closeModule()
}
