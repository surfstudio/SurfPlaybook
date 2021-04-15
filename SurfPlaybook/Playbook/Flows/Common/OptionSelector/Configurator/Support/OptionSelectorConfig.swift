//
//  CommonButton.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

struct OptionSelectorConfig {

    // MARK: - Properties

    let title: String
    let values: [OptionSelectorModel]
    let selectedValue: OptionSelectorModel?

    // MARK: - Initialization

    init(title: String,
         values: [OptionSelectorModel],
         selectedValue: OptionSelectorModel?) {
        self.title = title
        self.values = values
        self.selectedValue = selectedValue
    }

}
