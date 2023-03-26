//
//  OnboardingView.swift
//  Onboarding-ViewController-Demo
//
//  Created by Seb Vidal on 26/03/2023.
//

import UIKit

class OnboardingView: UIView {
    // MARK: - Private Properties
    private var parentViewController: UIViewController
    private var containerView: UIView!
    private var deviceView: UIView!
    private var demoView: UIView!
    private var overlayView: UIView!
    
    // MARK: - init(parentViewController:)
    init(parentViewController: UIViewController) {
        self.parentViewController = parentViewController
        super.init(frame: .zero)
        setupView()
        setupContainerView()
        setupDeviceView()
        setupDemoView()
        setupOverlayView()
    }
    
    // MARK: - init?(coder:)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    private func setupView() {
        clipsToBounds = true
        backgroundColor = .systemFill
    }
    
    private func setupContainerView() {
        containerView = UIView()
        
        addSubview(containerView)
    }
    
    private func setupDeviceView() {
        deviceView = UIView()
        deviceView.clipsToBounds = true
        deviceView.layer.cornerCurve = .continuous
        deviceView.layer.cornerRadius = UIScreen.main.bounds.width * 0.08
        deviceView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        deviceView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(deviceView)
        
        NSLayoutConstraint.activate([
            deviceView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            deviceView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            deviceView.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.6672619048),
            deviceView.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.7823892316)
        ])
    }
    
    private func setupDemoView() {
        let rootViewController = UIViewController()
        rootViewController.navigationItem.title = "Settings"
        
        let settingsViewController = TableViewController()
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.pushViewController(settingsViewController, animated: false)
        navigationController.additionalSafeAreaInsets.top = UIScreen.main.bounds.width * 0.1
        
        demoView = navigationController.view
        demoView.layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        parentViewController.addChild(navigationController)
        deviceView.addSubview(demoView)
        navigationController.didMove(toParent: parentViewController)
    }
    
    // Used to prevent all touches in the child view controller.
    private func setupOverlayView() {
        overlayView = UIView()
        overlayView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(overlayView)
        
        NSLayoutConstraint.activate([
            overlayView.topAnchor.constraint(equalTo: deviceView.topAnchor),
            overlayView.leadingAnchor.constraint(equalTo: deviceView.leadingAnchor),
            overlayView.trailingAnchor.constraint(equalTo: deviceView.trailingAnchor),
            overlayView.bottomAnchor.constraint(equalTo: deviceView.bottomAnchor)
        ])
    }
    
    // MARK: - layoutSubviews()
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutContainerView()
        layoutDemoView()
    }
    
    private func layoutContainerView() {
        let width = UIScreen.main.bounds.width
        let height = width / 0.9422321929
        let y = (frame.height / 2) - (height / 2)
        containerView.frame = CGRect(x: 0, y: y, width: width, height: height)
    }
    
    private func layoutDemoView() {
        let width = deviceView.frame.width
        let height = deviceView.frame.height
        demoView.frame = CGRect(x: 0, y: 0, width: width, height: height)
        
        let scale: CGFloat = 0.6672619048
        demoView.transform = CGAffineTransform(scaleX: scale, y: scale)
    }
}
