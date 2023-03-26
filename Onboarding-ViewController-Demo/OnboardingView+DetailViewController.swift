//
//  OnboardingView+DetailViewController.swift
//  Onboarding-ViewController-Demo
//
//  Created by Seb Vidal on 26/03/2023.
//

import UIKit

extension OnboardingView {
    class DetailViewController: UITableViewController {
        // MARK: - init()
        init() {
            super.init(style: .insetGrouped)
        }
        
        // MARK: = init?(coder:)
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        // MARK: - viewDidAppear(_:)
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.navigationController?.popViewController(animated: true)
            }
        }
        
        // MARK: - UITableViewDataSource
        override func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 5
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell()
        }
    }
}
