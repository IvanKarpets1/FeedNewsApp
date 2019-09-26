import Foundation

class DataBaseController {
    static var posts = [
        Post(name: "Mark Zuckerberg", statusText: "In today's tutorial, we'll look at how to support dynamic cell content within our UICollectionView. Oh well", profileImageName: "zuckerberg", statusImageName: "mercedes", numLikes: 0, numComments: 0),
        Post(name: "Mark Zuckerberg", statusText: "In today's tutorial, we'll look at how to support dynamic cell content within our UICollectionView. Oh well", profileImageName: "zuckerberg", statusImageName: "mercedes", numLikes: 0, numComments: 0),
        Post(name: "Mark Zuckerberg", statusText: "In today's tutorial, we'll look at how to support dynamic cell content within our UICollectionView. Oh well", profileImageName: "zuckerberg", statusImageName: "mercedes", numLikes: 0, numComments: 0),
        Post(name: "Mark Zuckerberg", statusText: "In today's tutorial, we'll look at how to support dynamic cell content within our UICollectionView. Oh well", profileImageName: "zuckerberg", statusImageName: "mercedes", numLikes: 0, numComments: 0),Post(name: "Mark Zuckerberg", statusText: "In today's tutorial, we'll look at how to support dynamic cell content within our UICollectionView. Oh well", profileImageName: "zuckerberg", statusImageName: "mercedes", numLikes: 0, numComments: 0)]
    
    static func getPosts() -> [Post] {
        return posts
    }
}
