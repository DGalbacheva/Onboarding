//
//  OnboardingViewController.swift
//  Onboarding
//
//  Created by Doroteya Galbacheva on 18.11.2024.
//

import Foundation
import UIKit

final class OnboardingViewController: UIPageViewController {
    lazy var pages: [UIViewController] = {
        let red = UIViewController()
        red.view.backgroundColor = .red
        
        let green = UIViewController()
        green.view.backgroundColor = .green
        
        let blue = UIViewController()
        blue.view.backgroundColor = .blue
        
        return [red, green, blue]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let first = pages.first {
            setViewControllers([first], direction: .forward, animated: true, completion: nil)
        }
    }
}
