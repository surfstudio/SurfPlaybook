//
//  SearchTextField.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 20.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

final class SearchTextField: UITextField {

    // MARK: - Properties

    var onStartEditing: EmptyClosure?
    var onEndEditing: EmptyClosure?
    var onShouldReturn: EmptyClosure?

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        delegate = self
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        delegate = self
    }

}

// MARK: - UITextFieldDelegate

extension SearchTextField: UITextFieldDelegate {

    func textFieldDidBeginEditing(_ textField: UITextField) {
        onStartEditing?()
    }

    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        onEndEditing?()
    }

    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        onShouldReturn?()
        return true
    }

}
