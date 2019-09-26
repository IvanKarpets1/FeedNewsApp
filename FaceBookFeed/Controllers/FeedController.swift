import UIKit

let cellid = "cellid"
class FeedController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var posts = [Post]()
    let blackBackgroundView = UIView()
    var statusImageView = UIImageView()
    var zoomImageView = UIImageView()
    var navBarCoverView = UIView()
    var tabBarCoverView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "FaceBook"
        collectionView.backgroundColor = UIColor(white: 0.9, alpha: 1)
        collectionView.alwaysBounceVertical = true
        collectionView.register(FeedCell.self, forCellWithReuseIdentifier: cellid)
        
        postsRequest()
        collectionView.reloadData()
    }
    
    func postsRequest() {
        posts = JsonParser().getPosts()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellid, for: indexPath) as! FeedCell
        let post = posts[indexPath.item]
        cell.post
            = post
        cell.feedController = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let statusText = posts[indexPath.item].statusText {
            let rect = NSString(string: statusText).boundingRect(with: CGSize(width: view.frame.width, height: 1000), options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14)], context: nil)
            return CGSize(width: view.frame.width, height: CGFloat(8 + 44 + 4 + 4 + 200 + 8 + 24 + 8 + 0.4 + 44 + rect.height + 24))
        }
        return CGSize(width: view.bounds.width, height: 400)
    }
    
    func animateZoomImageView(statusImageView: UIImageView) {
        
        self.statusImageView = statusImageView
        if let startingFrame = statusImageView.superview?.convert(statusImageView.frame, to: nil) {
            
            statusImageView.alpha = 0
            
            blackBackgroundView.frame = view.frame
            blackBackgroundView.backgroundColor = .black
            blackBackgroundView.alpha = 0
            view.addSubview(blackBackgroundView)
            
            zoomImageView.frame = startingFrame
            zoomImageView.isUserInteractionEnabled = true
            zoomImageView.image = statusImageView.image
            zoomImageView.contentMode = .scaleAspectFill
            zoomImageView.clipsToBounds = true
            zoomImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(animateZoomImageViewOut)))
            view.addSubview(zoomImageView)
            
            let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
            if let navBarHeight = navigationController?.navigationBar.frame.height {
                navBarCoverView.frame = CGRect(x: 0, y: 0, width: 1000, height: statusBarHeight + navBarHeight)
            }
            
            navBarCoverView.backgroundColor = .black
            navBarCoverView.alpha = 0
            
            if let keyWindow = UIApplication.shared.keyWindow {
                keyWindow.addSubview(navBarCoverView)
                
                let tabBarFrame = CustomTabBarController().tabBar.frame
                let safeAreaHeight = keyWindow.safeAreaInsets.bottom
                tabBarCoverView.frame = CGRect(x: 0, y: keyWindow.frame.height-tabBarFrame.height-safeAreaHeight, width: tabBarFrame.width, height: tabBarFrame.height+safeAreaHeight)
                tabBarCoverView.backgroundColor = .black
                tabBarCoverView.alpha = CGFloat(0)
                keyWindow.addSubview(tabBarCoverView)
            }
            

            
            
            UIView.animate(withDuration: 0.75) {
                let height = (self.view.frame.width/startingFrame.width)*statusImageView.frame.height
                let y = (self.view.frame.height/2)-height/2
                self.zoomImageView.frame = CGRect(x: 0, y: y, width: self.view.frame.width, height: height)
                self.blackBackgroundView.alpha = 1
                self.navBarCoverView.alpha = 1
                self.tabBarCoverView.alpha = 1
            }
        }
    }
    
    @objc func animateZoomImageViewOut() {
        if let startingFrame = statusImageView.superview?.convert(statusImageView.frame, to: nil) {
            UIView.animate(withDuration: 0.75, animations: {
                self.blackBackgroundView.alpha = 0
                self.zoomImageView.frame = startingFrame
                self.navBarCoverView.alpha = 0
                self.tabBarCoverView.alpha = 0
            }) { (didComplete) in
                self.zoomImageView.removeFromSuperview()
                self.blackBackgroundView.removeFromSuperview()
                self.statusImageView.alpha = 1
                self.navBarCoverView.removeFromSuperview()
                self.tabBarCoverView.removeFromSuperview()
            }
        }
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        super.willTransition(to: newCollection, with: coordinator)
        collectionView.collectionViewLayout.invalidateLayout()
    }
}
