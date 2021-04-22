//
//  CommonButton.swift
//  SurfPlaybookExample
//
//  Created by Александр Чаусов on 22.04.2021.
//  Copyright © 2021 Surf. All rights reserved.
//

import UIKit

final class CommonButton: UIButton {

    // MARK: - Properties

    var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }

    var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }

    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }

    /// Increase touch area
    var addedTouchArea: CGFloat = 0.0

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - UIButton

    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let newBound = CGRect(
            x: bounds.origin.x - addedTouchArea,
            y: bounds.origin.y - addedTouchArea,
            width: bounds.width + 2 * addedTouchArea,
            height: bounds.height + 2 * addedTouchArea
        )
        return newBound.contains(point)
    }

    // MARK: - Methods

    /// Method will set background color for control state
    func set(backgroundColor: UIColor, for state: UIControl.State) {
        setBackgroundImage(UIImage(color: backgroundColor), for: state)
    }

}
