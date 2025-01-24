//
//  UIView.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit
import SwiftUI

extension UIView {

    func snapshot() -> UIImage {
        self.bounds = CGRect(origin: .zero, size: self.intrinsicContentSize)
        self.backgroundColor = .clear

        let renderer = UIGraphicsImageRenderer(size: self.intrinsicContentSize)

        return renderer.image { _ in
            self.drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        }
    }

}

extension UIView {

    func xibSetup() {
        let view = loadFromNib()
        addSubview(view)
        stretch(view: view)
    }

    func loadFromNib<T: UIView>() -> T {
        let selfType = type(of: self)
        let bundle = Bundle.shared(for: selfType)
        let nibName = String(describing: selfType)
        let nib = UINib(nibName: nibName, bundle: bundle)

        guard let view = nib.instantiate(withOwner: self, options: nil).first as? T else {
            return T()
        }

        return view
    }

    // MARK: - Private methods

    private func stretch(view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: topAnchor),
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor),
            view.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

}

@available(iOS 13.0, *)
extension View {

    func snapshot() -> UIImage {
        let controller = UIHostingController(rootView: self)
        return controller.view.snapshot()
    }

}
