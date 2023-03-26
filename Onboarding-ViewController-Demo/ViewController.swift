//
//  ViewController.swift
//  Onboarding-ViewController-Demo
//
//  Created by Seb Vidal on 26/03/2023.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Private Properties
    private var onboardingView: OnboardingView!
    
    // MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        setupOnboardingView()
    }
    
    // MARK: - Setup
    private func setupViewController() {
        view.backgroundColor = .systemBackground
    }
    
    private func setupOnboardingView() {
        onboardingView = OnboardingView(parentViewController: self)
        onboardingView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(onboardingView)
        
        NSLayoutConstraint.activate([
            onboardingView.topAnchor.constraint(equalTo: view.topAnchor),
            onboardingView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            onboardingView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            onboardingView.heightAnchor.constraint(equalTo: onboardingView.widthAnchor, multiplier: 0.9422321929)
        ])
    }
}
