import Foundation


class JsonParser {
    let path = Bundle.main.path(forResource: "posts", ofType: "json")
    var posts = [Post]()
    
    func parseJsonWithPath() {
        do {
            guard let path = Bundle.main.path(forResource: "posts", ofType: "json") else {return}
            
            let data = try NSData(contentsOfFile: path, options: NSData.ReadingOptions.mappedRead) as Data
            
            let posts =  try JSONDecoder().decode([Post].self, from: data)
            self.posts = posts

        } catch let err {
            print(err)
        }
    }
    
    func getPosts() -> [Post] {
        parseJsonWithPath()
        return posts
    }
}
