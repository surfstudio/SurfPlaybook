//
//  MainViewOutput.swift
//  SurfPlaybook
//
//  Created by Александр Чаусов on 15/04/2021.
//  Copyright © 2021 Surf. All rights reserved.
//

protocol MainViewOutput {
    func viewLoaded()
    func showPage(_ model: PageModel)
    func filter(by text: String)
}
