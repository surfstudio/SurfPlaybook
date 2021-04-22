//
//  PageViewInput.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 22/04/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

protocol PageViewInput: class {
    func setupInitialState(with page: PlaybookPage)
    func showPreset(_ preset: OptionSelectorModel, for page: PlaybookPage)
    func updateBackgroundAppearance(isColored: Bool)
}
