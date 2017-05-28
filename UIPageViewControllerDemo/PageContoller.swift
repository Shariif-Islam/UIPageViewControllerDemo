//
//  PageContoller.swift
//  UIPageViewControllerDemo
//
//  Created by AdBox on 5/28/17.
//  Copyright © 2017 myth. All rights reserved.
//

import UIKit

class PageContoller: UIPageViewController {
    
    
    lazy var viewContollers : [UIViewController] = {
    
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        let redVC = sb.instantiateViewController(withIdentifier: "RedVC")
        let greenVC = sb.instantiateViewController(withIdentifier: "GreenVC")
        let blueVC = sb.instantiateViewController(withIdentifier: "BlueVC")
        
        return [redVC,greenVC,blueVC]
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        
        if let firstVC = viewContollers.first {
        
            self.setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
    }

}

extension PageContoller : UIPageViewControllerDataSource {

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let currentViewIndex = viewContollers.index(of: viewController) else { return nil }
        let beforePage = currentViewIndex - 1
        
        guard beforePage >= 0 else {return nil}
        guard viewContollers.count > beforePage else {return nil}
        
        return viewContollers[beforePage]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let currentViewIndex = viewContollers.index(of: viewController) else { return nil }
        let nextPage = currentViewIndex + 1
        
        guard viewContollers.count != nextPage else {return nil}
        guard viewContollers.count > nextPage else {return nil}
        
        return viewContollers[nextPage]
    }
    
}
