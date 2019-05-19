//
//  TabBarController.swift
//  appWatchLocation
//
//  Created by Yauheni Yarotski on 5/3/19.
//  Copyright © 2019 Yauheni Yarotski. All rights reserved.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
  
  func setupTapBar() {
    
    let mainVc = MainViewController()
    let nav1 = UINavigationController(rootViewController: mainVc)
    let tab1 = UITabBarItem()
    tab1.title = NSLocalizedString("Главная", comment: "")
    
    tab1.image =  UIImage(named: "home")?.withRenderingMode(.alwaysTemplate)
    nav1.tabBarItem = tab1
    
    let vc2 = UIViewController()
    let nav2 = UINavigationController(rootViewController: vc2)
    let tab2 = UITabBarItem()
    tab2.title = NSLocalizedString("Мои заказы", comment: "")
    tab2.image =  UIImage(named: "history")?.withRenderingMode(.alwaysTemplate)
    nav2.tabBarItem = tab2
    
    let vc3 = UIViewController()
    let nav3 = UINavigationController(rootViewController: vc3)
    let tab3 = UITabBarItem()
    tab3.title = NSLocalizedString("Личный кабинет", comment: "")
    tab3.image =  UIImage(named: "profile")?.withRenderingMode(.alwaysTemplate)
    nav3.tabBarItem = tab3
    
    let vc4 = ServiceSelectionVC()
    vc4.navigationItem.title = "Выберите категорию"
    let nav4 = UINavigationController(rootViewController: vc4)
    let tab4 = UITabBarItem()
    tab4.title = NSLocalizedString("Новый заказ", comment: "")
    tab4.image =  UIImage(named: "add_new")?.withRenderingMode(.alwaysTemplate)
    nav4.tabBarItem = tab4
    

    self.viewControllers = [nav1, nav2, nav3, nav4]
    
  }
  
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setupTapBar()
//    delegate = self
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupTapBar()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
//    tabBar.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
//    tabBar.layer.shadowRadius = 6
//    tabBar.layer.shadowColor = UIColor.darkGray.cgColor
//    tabBar.layer.shadowOpacity = 0.2
  }
}

//extension TabBarController: UITabBarControllerDelegate {
//  func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
//    let isVCTheSame = viewController == tabBarController.selectedViewController
//    if isVCTheSame, let navigationFeedVC = viewController as? UINavigationController, let vcWithTable = navigationFeedVC.topViewController as? FeedViewController  {
//      vcWithTable.tableView.setContentOffset(CGPoint(x: 0.0, y:-vcWithTable.tableView.contentInset.top), animated: true)
//    } else if isVCTheSame, let navigationFeedVC = viewController as? UINavigationController {
//      navigationFeedVC.popToRootViewController(animated: true)
//    }
//    return !isVCTheSame
//  }
//}

