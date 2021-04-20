//
//  UICollectionView.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 19.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

extension UICollectionView {

    func dequeueReusableCell<Cell: UICollectionViewCell>(_ type: Cell.Type = Cell.self,
                                                         indexPath: IndexPath) -> Cell? {
        return dequeueReusableCell(withReuseIdentifier: Cell.className,
                                   for: indexPath) as? Cell
    }

    func registerNib(_ cellType: UICollectionViewCell.Type) {
        self.register(UINib(nibName: cellType.className, bundle: Bundle(for: cellType.self)),
                      forCellWithReuseIdentifier: cellType.className)
    }

}
