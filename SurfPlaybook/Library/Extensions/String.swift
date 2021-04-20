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

    /// Возвращает `true`, если в строке содержится переданная подстрока
    /// При этом не учитывается регистр букв
    func containsCaseInsensitive(string: String) -> Bool {
        let searchRange = self.startIndex..<self.endIndex
        let range = self.range(of: string, options: .caseInsensitive, range: searchRange)
        return range != nil
    }

}
