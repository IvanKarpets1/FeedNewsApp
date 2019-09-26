import UIKit

class FriendRequestsCell: UICollectionViewCell {
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "zuckerberg")
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14
        )
        label.text = "Mark Zuckerberg"
        return label
    }()
    
    let confirmButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Confirm", for: .normal)
        button.tintColor = UIColor.white
        button.backgroundColor = UIColor.rgb(red: 92, green: 143, blue: 249)
        button.layer.cornerRadius = 3
        button.layer.masksToBounds = true
        return button
    }()
    
    let deleteButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Delete", for: .normal)
        button.tintColor = UIColor(white: 0.7, alpha: 1)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(white: 0.7, alpha: 1).cgColor
        button.layer.cornerRadius = 3
        button.layer.masksToBounds = true
        return button
    }()
    
    let buttonsContainer: UIView = {
        let container = UIView()
        return container
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(buttonsContainer)
        
        addConstraintsWithFormat(format: "H:|-16-[v0(60)]-8-[v1]", views: profileImageView, nameLabel)
        addConstraintsWithFormat(format: "V:|[v0(60)]|", views: profileImageView)
        addConstraintsWithFormat(format: "V:|-4-[v0]-4-[v1]|", views: nameLabel, buttonsContainer)
        addConstraintsWithFormat(format: "H:|-16-[v0(60)]-8-[v1(200)]", views: profileImageView, buttonsContainer)
        buttonsContainer.addSubview(confirmButton)
        buttonsContainer.addSubview(deleteButton)
        buttonsContainer.addConstraintsWithFormat(format: "H:|[v0(v1)]-4-[v1]-4-|", views: confirmButton, deleteButton)
        buttonsContainer.addConstraintsWithFormat(format: "V:|[v0]", views: confirmButton)
        buttonsContainer.addConstraintsWithFormat(format: "V:|[v0]", views: deleteButton)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
