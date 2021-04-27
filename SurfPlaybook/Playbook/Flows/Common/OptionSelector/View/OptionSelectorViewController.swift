//
//  CommonButton.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

final class OptionSelectorViewController: UIViewController {

    // MARK: - Constants

    private enum Constants {
        static let rowHeight: CGFloat = 34
    }

    // MARK: - IBOutlets

    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var cancelButton: CommonButton!
    @IBOutlet private weak var doneButton: CommonButton!
    @IBOutlet private weak var separatorView: UIView!
    @IBOutlet private weak var pickerView: UIPickerView!
    @IBOutlet private weak var bottomView: UIView!

    // MARK: - Properties

    var output: OptionSelectorViewOutput?

    // MARK: - Private Properties

    private var values: [OptionSelectorModel] = []

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

}

// MARK: - OptionSelectorViewInput

extension OptionSelectorViewController: OptionSelectorViewInput {

    func setupInitialState(with config: OptionSelectorConfig) {
        configureAppearance(with: config.title)

        self.values = config.values
        pickerView.reloadAllComponents()
        tryToScroll(to: config.selectedValue)
    }

}

// MARK: - Appearance

private extension OptionSelectorViewController {

    func configureAppearance(with title: String) {
        view.backgroundColor = Colors.Main.translucent
        containerView.backgroundColor = Colors.Main.background
        bottomView.backgroundColor = Colors.Main.background

        configureFakeNavBar(with: title)
        configureButtons()
        configurePickerView()
        configureGestures()
    }

    func configureFakeNavBar(with title: String) {
        titleLabel.text = title
        titleLabel.apply(style: .textRegular17BlackCenter)
        separatorView.backgroundColor = Colors.Main.separator
    }

    func configureButtons() {
        cancelButton.setTitle(L10n.Common.Titles.cancel, for: .normal)
        cancelButton.apply(style: .textSecond)
        doneButton.setTitle(L10n.Common.Titles.done, for: .normal)
        doneButton.apply(style: .textActive)
    }

    func configurePickerView() {
        pickerView.delegate = self
        pickerView.dataSource = self
    }

    func configureGestures() {
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(tapOnBackground))
        tapGesture.delegate = self
        view.addGestureRecognizer(tapGesture)
    }

}

// MARK: - UIGestureRecognizerDelegate

extension OptionSelectorViewController: UIGestureRecognizerDelegate {

    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return !(touch.view?.isDescendant(of: containerView) ?? true)
    }

}

// MARK: - UIPickerViewDataSource

extension OptionSelectorViewController: UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return values.count
    }

}

// MARK: - UIPickerViewDelegate

extension OptionSelectorViewController: UIPickerViewDelegate {

    func pickerView(_ pickerView: UIPickerView,
                    rowHeightForComponent component: Int) -> CGFloat {
        return Constants.rowHeight
    }

    func pickerView(_ pickerView: UIPickerView,
                    viewForRow row: Int,
                    forComponent component: Int,
                    reusing view: UIView?) -> UIView {
        let label = (view as? UILabel) ?? UILabel()
        label.text = values[row].title
        label.apply(style: .displayRegular21BlackCenter)
        return label
    }

}

// MARK: - Actions

private extension OptionSelectorViewController {

    @IBAction func selectValue(_ sender: Any) {
        let index = pickerView.selectedRow(inComponent: 0)
        guard let value = values[safe: index] else {
            return
        }
        output?.selectValue(value)
    }

    @IBAction func closeView(_ sender: Any) {
        output?.closeModule()
    }

    @objc
    func tapOnBackground() {
        output?.closeModule()
    }

}

// MARK: - Private Methods

private extension OptionSelectorViewController {

    func tryToScroll(to value: OptionSelectorModel?) {
        guard
            let selected = value,
            let index = values.firstIndex(where: { $0.title == selected.title })
        else {
            return
        }
        pickerView.selectRow(index, inComponent: 0, animated: false)
    }

}
