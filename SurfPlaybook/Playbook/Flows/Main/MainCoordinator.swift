//
//  MainCoordinator.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15/04/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

final class MainCoordinator: BaseCoordinator, MainCoordinatorOutput {

    // MARK: - MainCoordinatorOutput

    // MARK: - Private Properties

    private let router: Router

    // MARK: - Initialization

    init(router: Router) {
        self.router = router
    }

    // MARK: - Coordinator

    override func start(with deepLinkOption: DeepLinkOption?) {
        showPlaybook()
    }

}

// MARK: - Private Methods

private extension MainCoordinator {

    func showPlaybook() {
        let (view, output) = MainModuleConfigurator().configure()
        output.onPageShow = { [weak self] page in
            self?.showPlaybookPage(page)
        }
        output.onChapterShow = { [weak self] chapter in
            self?.showPlaybookChapter(chapter)
        }
        router.setNavigationControllerRootModule(view, animated: false, hideBar: false)
    }

    func showPlaybookPage(_ page: PlaybookPage) {
        let (view, output, input) = PageModuleConfigurator().configure(with: page)
        output.onPresetsOpen = { [weak self, weak input] config in
            self?.showOptionSelector(config: config, handler: input)
        }
        router.push(view)
    }

    func showOptionSelector(config: OptionSelectorConfig, handler: OptionSelectorHandler?) {
        let (view, output) = OptionSelectorModuleConfigurator().configure(with: config, handler: handler)
        output.onClose = { [weak self] in
            self?.router.dismissModule()
        }
        router.present(view)
    }

    func showPlaybookChapter(_ model: ChapterModel) {
        let (view, _) = ChapterModuleConfigurator().configure()
        router.push(view)
    }

}
