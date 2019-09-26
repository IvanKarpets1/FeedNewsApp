class Post: Decodable {
    var name: String?
    var location: Location?
    var profileImageName: String?
    var statusText: String?
    var statusImageName: String?
    var numLikes: Int?
    var numComments: Int?
    
    init(name: String?, statusText: String?, profileImageName: String?, statusImageName: String?,numLikes: Int?, numComments: Int?) {
        self.name = name
        self.statusText = statusText
        self.profileImageName = profileImageName
        self.statusImageName = statusImageName
        self.numLikes = numLikes
        self.numComments = numComments
    }
}

class Location: Decodable {
    var city: String?
    var state: String?
}

