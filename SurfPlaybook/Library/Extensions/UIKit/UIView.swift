//
//  UIView.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

extension UIView {

    func snapshot() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, true, UIScreen.main.scale)
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        self.layer.render(in: context)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img
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


//        var bundle: Bundle
//        #if SWIFT_PACKAGE
//        if Bundle.module.path(forResource: self.className, ofType: "nib") != nil {
//            bundle = Bundle.module
//        } else {
//            bundle = Bundle(for: type(of: self))
//        }
//
//        // helper for TextFieldCatalog package use in different package with xibs
//        if bundle.path(forResource: self.className, ofType: "nib") == nil,
//           let resourceBundle = getResourcesBundle(for: bundle) {
//            bundle = resourceBundle
//        }
//        #else
//        bundle = Bundle(for: type(of: self))
//        #endif

        let nibName = String(describing: selfType)
        let nib = UINib(nibName: nibName, bundle: bundle)

        guard let view = nib.instantiate(withOwner: self, options: nil).first as? T else {
            return T()
        }

        return view
    }

//    static func loadFromNib<T: UIView>() -> T {
//        let bundle = Bundle.shared(for: self)
//        let nibName = String(describing: self)
//        let nib = UINib(nibName: nibName, bundle: bundle)
//
//        guard let view = nib.instantiate(withOwner: self, options: nil).first as? T else {
//            return T()
//        }
//
//        return view
//    }

    func stretch(view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: topAnchor),
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor),
            view.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    // MARK: - Private methods

    private func getResourcesBundle(for bundle: Bundle) -> Bundle? {
        let packageName = NSStringFromClass(type(of: self)).components(separatedBy: ".").first ?? ""
        let bundleName = packageName + "_" + packageName + ".bundle"
        let resource = bundle.resourcePath ?? ""
        return Bundle(path: resource + "/" + bundleName)
    }

}
