//
//  String.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

extension String {

    /// Возвращает строку, либо nil, если она пуста
    func normalized() -> String? {
        return self.isEmpty ? nil : self
    }

}
