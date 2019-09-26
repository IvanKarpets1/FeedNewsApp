import Foundation
import UIKit

class CustomTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let feedController = FeedController(collectionViewLayout: UICollectionViewFlowLayout())
        let feedNavigationController = UINavigationController(rootViewController: feedController)
        
        feedNavigationController.tabBarItem.title = "News Feed"
        feedNavigationController.tabBarItem.image = UIImage(named: "feed-icon")
        
        let friendRequestController = FriendRequestController(collectionViewLayout: UICollectionViewFlowLayout())
        let friendRequestNavController = UINavigationController(rootViewController: friendRequestController)
        friendRequestNavController.tabBarItem.title = "Requests"
        friendRequestNavController.tabBarItem.image = UIImage(named: "friend-request-icon")
        
        viewControllers = [feedNavigationController, friendRequestNavController]
        
        tabBar.isTranslucent = false
        
        let topBorder = CALayer()
        topBorder.frame = CGRect(x: 0, y: 0, width: 1000, height: 0.5)
        topBorder.backgroundColor = UIColor.rgb(red: 229, green: 231, blue: 235).cgColor
        tabBar.layer.addSublayer(topBorder)
        tabBar.clipsToBounds = true
    }
    
}
