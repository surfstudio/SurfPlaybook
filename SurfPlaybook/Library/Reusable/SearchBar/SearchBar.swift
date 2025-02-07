//
//  SearchBar.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 20.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

/// Кастомная view для отображения search-bar'а
final class SearchBar: UIView {

    // MARK: - Constants

    private enum Constants {
        static let font = UIFont.systemFont(ofSize: 17, weight: .regular)
        static let containerCornerRadius: CGFloat = 18
        static let containerRightDefaultOffset: CGFloat = 4
        static let containerRightBigOffset: CGFloat = 96
    }

    // MARK: - IBOutlets

    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var searchIconImageView: UIImageView!
    @IBOutlet private weak var textField: SearchTextField!
    @IBOutlet private weak var clearButton: CommonButton!
    @IBOutlet private weak var cancelButton: CommonButton!

    // MARK: - NSLayoutConstraints

    @IBOutlet private weak var containerRightConstraint: NSLayoutConstraint!
    @IBOutlet private weak var clearButtonWidthConstraint: NSLayoutConstraint!

    // MARK: - Private Properties

    private var isVisibleCancelButton = false

    // MARK: - Properties

    var onStartEditing: EmptyClosure?
    var onEndEditing: EmptyClosure?
    var onShouldReturn: EmptyClosure?
    var onTextChanged: EmptyClosure?
    var onCancel: EmptyClosure?

    var text: String? {
        get {
            return textField.text
        }
        set {
            textField.text = newValue
            textFieldEditingChanged(textField)
        }
    }
    var placeholder: String? {
        didSet {
            let color = Colors.SearchBar.placeholder
            textField.attributedPlaceholder = placeholder?.with(attributes: [.font(Constants.font),
                                                                             .foregroundColor(color)])
        }
    }
    var returnKeyType: UIReturnKeyType = .search {
        didSet {
            textField.returnKeyType = returnKeyType
        }
    }
    var containerBackgroundColor: UIColor = Colors.SearchBar.container {
        didSet {
            containerView.backgroundColor = containerBackgroundColor
        }
    }

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
        configureAppearance()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
        configureAppearance()
    }

    // MARK: - UIView

    override var intrinsicContentSize: CGSize {
      return UIView.layoutFittingExpandedSize
    }

    // MARK: - Methods

    func makeFirstResponder() {
        textField.becomeFirstResponder()
    }

    func changeCancelButonVisibility(isVisible: Bool, completionBlock: EmptyClosure? = nil) {
        guard isVisibleCancelButton != isVisible else {
            return
        }
        isVisibleCancelButton = isVisible
        animateCancelButonVisibility(isVisible: isVisibleCancelButton,
                                     completionBlock: completionBlock)
    }

    /// Скрывает  кнопку очистки поля ввода, обратно показать кнопку нельзя
    func hideClearButton() {
        clearButton.isHidden = true
        clearButtonWidthConstraint.constant = 16
    }

}

// MARK: - Appearance

private extension SearchBar {

    func configureAppearance() {
        containerView.superview?.backgroundColor = Colors.Main.background
        configureContainerView()
        configureSearchIcon()
        configureTextField()
        configureButtons()
        configureTapGesture()
    }

    func configureContainerView() {
        containerView.backgroundColor = containerBackgroundColor
        containerView.layer.cornerRadius = Constants.containerCornerRadius
        containerView.clipsToBounds = true
    }

    func configureSearchIcon() {
        searchIconImageView.contentMode = .scaleAspectFit
        let image = Resources.Assets.Icons.search.image.mask(with: Colors.Main.active)
        searchIconImageView.image = image
    }

    func configureTextField() {
        textField.borderStyle = .none
        textField.font = Constants.font
        textField.textColor = Colors.SearchBar.text
        textField.tintColor = Colors.SearchBar.tint
        textField.autocorrectionType = .no
        textField.returnKeyType = returnKeyType
        textField.addTarget(self,
                            action: #selector(textFieldEditingChanged(_:)),
                            for: .editingChanged)

        textField.onStartEditing = { [weak self] in
            self?.onStartEditing?()
        }
        textField.onEndEditing = { [weak self] in
            self?.onEndEditing?()
        }
        textField.onShouldReturn = { [weak self] in
            self?.onShouldReturn?()
        }
    }

    func configureButtons() {
        clearButton.apply(style: .clear)
        clearButton.alpha = 0

        cancelButton.apply(style: .textActive)
        cancelButton.setTitle(StringsConfig.cancel, for: .normal)
        cancelButton.contentEdgeInsets = .zero
        cancelButton.alpha = 0
    }

    func configureTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapOnView))
        containerView.addGestureRecognizer(tapGesture)
    }

}

// MARK: - Actions

private extension SearchBar {

    @objc
    func textFieldEditingChanged(_ textField: UITextField) {
        let isEmptyText = textField.text?.isEmpty ?? true
        animateClearButtonVisibility(isVisible: !isEmptyText)
        onTextChanged?()
    }

    @IBAction func clear(_ sender: UIButton) {
        textField.text = ""
        animateClearButtonVisibility(isVisible: false)
        onTextChanged?()
    }

    @IBAction func cancel(_ sender: UIButton) {
        onCancel?()
    }

    @objc
    func tapOnView() {
        textField.becomeFirstResponder()
    }

}

// MARK: - Animations

private extension SearchBar {

    func animateCancelButonVisibility(isVisible: Bool, completionBlock: EmptyClosure?) {
        let containerOffset = isVisibleCancelButton
                                ? Constants.containerRightBigOffset
                                : Constants.containerRightDefaultOffset
        let buttonAlpha: CGFloat = isVisibleCancelButton ? 1 : 0
        containerRightConstraint.constant = containerOffset
        UIView.animate(withDuration: AnimationTime.small,
                       animations: { [weak self] in
            self?.layoutIfNeeded()
            self?.cancelButton.alpha = buttonAlpha
        }) { _ in
            completionBlock?()
        }
    }

    func animateClearButtonVisibility(isVisible: Bool) {
        UIView.animate(withDuration: AnimationTime.small) {
            self.clearButton.alpha = isVisible ? 1 : 0
        }
    }

}
