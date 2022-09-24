//
//  ViewController.swift
//  MVVM + Clouser
//
//  Created by Виктор Басиев on 15.09.2022.
//

import UIKit

class MainViewController: UIViewController {

    private var viewModel: MainViewModelProtocol!
    private var testView: TestView!
    
    override func viewDidLoad() {
        viewModel = MainViewModel()
        super.viewDidLoad()
        view.backgroundColor = .white
        creatView()
        setupTargetButton()
        updateView()
    }
    
    private func creatView() {
        testView = TestView()
        testView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        testView.center = view.center
        view.addSubview(testView)
    }
    
    private func updateView() {
        viewModel.updateViewData = { [weak self] viewData in
            self?.testView.viewData = viewData
        }
    }
    
    private func setupTargetButton() {
        testView.startButton.addTarget(self, action: #selector(startAction), for: .touchUpInside)
    }
}

extension MainViewController {
    @objc func startAction() {
        viewModel.startFetch()
    }
}

