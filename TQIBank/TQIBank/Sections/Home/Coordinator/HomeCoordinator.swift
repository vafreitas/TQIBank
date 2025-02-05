//
//  HomeCoordinator.swift
//  TQIBank
//
//  Created by Roberth Diorges on 11/01/22.
//

import UIKit
import TQICoordinator
import TQIExtract

class HomeViewCoordinator: Coordinator {
    
    var delegate: CoordinatorDelegate?
    var childCoordinator: Coordinator?
    var viewController: UIViewController!
    var navigationController: UINavigationController?
    
    var viewModel: HomeViewModel?
    var view: HomeViewController?
    
    private var extractCoordinator: ExtractCoordinator?
    
    init() {
        viewModel = HomeViewModel()
        viewModel?.coordinatorDelegate = self
        view = HomeViewController(viewModel: viewModel!)
        viewController = view
        
        navigationController = UINavigationController(rootViewController: viewController)
    }
    
    func start() {
        
    }
}

extension HomeViewCoordinator: HomeViewModelCoordinatorDelegate {
    func homeViewModelGoToExtract(_ viewModel: HomeViewModel) {
        guard let navigation = navigationController else { return }
        extractCoordinator = ExtractCoordinator()
        extractCoordinator?.start(usingPresenter: .push(navigation), animated: true)
        extractCoordinator?.viewController.navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
