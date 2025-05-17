import UIKit

class NewsCollectionViewCell: UICollectionViewCell {
    static let identifier = "NewsCollectionViewCell"
    
    private let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = AppConstants.appConstants_s10
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = FontConstants.subHeading_H1_s16
        label.textColor = .gray
        label.numberOfLines = 3
        return label
    }()
    
    private let publishedDate: UILabel = {
        let label = UILabel()
        label.font = FontConstants.subHeading_H1_s10
        label.textColor = .gray
        label.numberOfLines = 1
        return label
    }()
    
    private let verticalStackView: UIStackView = {
        let vertical = UIStackView()
        vertical.axis = .vertical
        vertical.alignment = .leading
        vertical.spacing = AppConstants.appConstants_s10
        return vertical
    }()
    
    private let horizontalStackView: UIStackView = {
        let horizontal = UIStackView()
        horizontal.axis = .horizontal
        horizontal.alignment = .top
        horizontal.distribution = .fillEqually
        horizontal.spacing = AppConstants.appConstants_s10
        return horizontal
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with item: NewsItem) {
        thumbnailImageView.image = UIImage(named: item.imageName)
        titleLabel.text = item.title
        descriptionLabel.text = item.description
        publishedDate.text = "2024-05-27"
    }
    
    func setupUI() {
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = AppConstants.appConstants_s10
        contentView.clipsToBounds = true
        
        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(descriptionLabel)
        
        horizontalStackView.addArrangedSubview(thumbnailImageView)
        horizontalStackView.addArrangedSubview(verticalStackView)
        
        contentView.addSubview(horizontalStackView)
        contentView.addSubview(publishedDate)
        
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        thumbnailImageView.translatesAutoresizingMaskIntoConstraints = false
        publishedDate.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            thumbnailImageView.heightAnchor.constraint(equalToConstant: AppConstants.appConstants_s150),
            
            horizontalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: AppConstants.appConstants_s10),
            horizontalStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: AppConstants.appConstants_s10),
            horizontalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -AppConstants.appConstants_s10),
            horizontalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -AppConstants.appConstants_s10),
            
            publishedDate.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -AppConstants.appConstants_s10),
            publishedDate.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -AppConstants.appConstants_s10)
        ])
    }
}
