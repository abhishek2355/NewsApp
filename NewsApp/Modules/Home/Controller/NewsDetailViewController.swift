import UIKit

class NewsDetailViewController: UIViewController {
    
    private var detailedNewsItems: NewsItem
    
    private lazy var newsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var newsTitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .justified
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = FontConstants.headingBold_H2_s18
        return label
    }()
    
    private lazy var newsSubTitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .justified
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var verticalBar: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = AppColorConstants.buttonColor_Green
        return view
    }()
    
    init(selectedNews: NewsItem) {
        self.detailedNewsItems = selectedNews
        super.init(nibName: nil, bundle: nil)
        
        self.newsImageView.image = UIImage(named: detailedNewsItems.imageName)
        self.newsTitle.text = detailedNewsItems.title
        self.newsSubTitle.text = detailedNewsItems.description
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppColorConstants.appBackgroundColor
        navigationController?.navigationBar.tintColor = .black
        
        setupLayout()
    }
    
    func setupLayout() {
        view.addSubview(newsImageView)
        view.addSubview(newsTitle)
        view.addSubview(newsSubTitle)
        view.addSubview(verticalBar)
        
        NSLayoutConstraint.activate([
            newsImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            newsImageView.topAnchor.constraint(equalTo: view.topAnchor),
            newsImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            newsImageView.heightAnchor.constraint(equalToConstant: AppConstants.appConstants_s350),
            
            newsTitle.leadingAnchor.constraint(equalTo: verticalBar.trailingAnchor, constant: AppConstants.appConstants_s8),
            newsTitle.topAnchor.constraint(equalTo: newsImageView.bottomAnchor, constant: AppConstants.appConstants_s10),
            newsTitle.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,  constant: -AppConstants.appConstants_s16),
            
            newsSubTitle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,  constant: AppConstants.appConstants_s16),
            newsSubTitle.topAnchor.constraint(equalTo: newsTitle.bottomAnchor, constant: AppConstants.appConstants_s10),
            newsSubTitle.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,  constant: -AppConstants.appConstants_s16),
            newsSubTitle.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            verticalBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: AppConstants.appConstants_s16),
            verticalBar.topAnchor.constraint(equalTo: newsTitle.topAnchor),
            verticalBar.bottomAnchor.constraint(equalTo: newsSubTitle.topAnchor, constant: -AppConstants.appConstants_s10),
            verticalBar.widthAnchor.constraint(equalToConstant: 2),
        ])
    }
}
