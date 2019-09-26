import UIKit

class SectionHeaderView: UICollectionViewCell {
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = UIColor(white: 0.6, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(white: 0.95, alpha: 1)
        
        setupViews()
    }
    
    func setupViews() {
        addSubview(headerLabel)
        
        addConstraintsWithFormat(format: "H:|-8-[v0]", views: headerLabel)
        addConstraintsWithFormat(format: "V:|-5-[v0(20)]-5-|", views: headerLabel)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

