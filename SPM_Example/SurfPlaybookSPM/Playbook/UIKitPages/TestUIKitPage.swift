//
//  TestUIKitChapter.swift
//  SurfPlaybookSPM
//
//  Created by Александр Чаусов on 04.05.2021.
//

import UIKit
import SurfPlaybook

final class TestUIKitPage: PlaybookUIKitPage {

    var id: String {
        return "TestUIKitPage"
    }

    var name: String {
        return "Test page"
    }

    var viewModel: UIKitPageViewModel {
        return TestUIKitPageViewModel()
    }

}

final class TestUIKitPageViewModel: NSObject, UIKitPageViewModel {

    func setup(with tableView: UITableView) {
    }

}
