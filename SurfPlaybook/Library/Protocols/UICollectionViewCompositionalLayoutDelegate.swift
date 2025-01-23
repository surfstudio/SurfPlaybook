//
//  UICollectionViewCompositionalLayoutDelegate.swift
//  SurfPlaybook
//
//  Created by korshunov on 20.01.2022.
//

import UIKit

@available(iOS 13.0, *  )
public protocol UICollectionViewCompositionalLayoutDelegate: AnyObject {

    func sectionProvider(for section: Int) -> NSCollectionLayoutSection?

}

@available(iOS 13.0, *  )
extension UICollectionViewCompositionalLayoutDelegate {

    public func makeCompositionalLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
            self?.sectionProvider(for: sectionIndex)
        }
    }

    public func setCompositionalLayout(for collectionView: UICollectionView) {
        let layout = makeCompositionalLayout()
        collectionView.setCollectionViewLayout(layout, animated: true)
    }

}
