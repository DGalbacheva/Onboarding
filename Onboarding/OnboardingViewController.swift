//
//  OnboardingViewController.swift
//  Onboarding
//
//  Created by Doroteya Galbacheva on 18.11.2024.
//

import Foundation
import UIKit

final class OnboardingViewController: UIPageViewController, UIPageViewControllerDataSource {
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
        
        // install OnboardingViewController with its own DataSource
        dataSource = self
        
        if let first = pages.first {
            setViewControllers([first], direction: .forward, animated: true, completion: nil)
        }
    }
    
    // MARK: - UIPageViewControllerDataSource
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        // return the previous (relative to the passed viewController) child controller
        guard let viewControllerIndex = pages.firstIndex(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        return pages[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        // return the next (relative to the passed viewController) child controller
        guard let viewControllerIndex = pages.firstIndex(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        
        guard nextIndex < pages.count else {
            return nil
        }
        
        return pages[nextIndex]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        pages.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        0
    }
}
