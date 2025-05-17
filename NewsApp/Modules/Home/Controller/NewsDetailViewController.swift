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
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = FontConstants.headingBold_H2_s18
        return label
    }()
    
    private lazy var newsSubTitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .justified
        label.textColor = .darkGray
        label.font = FontConstants.subHeading_H1_s16
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var verticalBar: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = AppColorConstants.buttonColor_Green
        return view
    }()
    
    private lazy var authorsLogo: UIImageView = {
        let view = UIImageView(image: UIImage(systemName: "person.fill"))
        view.tintColor = .gray
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private lazy var authorName: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .darkGray
        return label
    }()
    
    private lazy var timeDurationLogo: UIImageView = {
        let view = UIImageView(image: UIImage(systemName: "clock.arrow.2.circlepath"))
        view.tintColor = .gray
        return view
    }()
    
    private lazy var timeDate: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .darkGray
        return label
    }()
    
    private lazy var authorsStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [authorsLogo, authorName])
        view.spacing = AppConstants.appConstants_s5
        return view
    }()
    
    private lazy var timeStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [timeDurationLogo, timeDate])
        view.spacing = AppConstants.appConstants_s5
        return view
    }()
    
    private lazy var authorDetailsView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [authorsStackView, timeStackView])
        view.distribution = .equalSpacing
        view.spacing = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var newsDetailedContentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var newsDetailedScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    
    init(selectedNews: NewsItem) {
        self.detailedNewsItems = selectedNews
        super.init(nibName: nil, bundle: nil)
        
        self.newsImageView.image = UIImage(named: detailedNewsItems.imageName)
        self.newsTitle.text = detailedNewsItems.title
        self.newsSubTitle.text = detailedNewsItems.description
        self.authorName.text = detailedNewsItems.authersName
        self.timeDate.text = "\(detailedNewsItems.dateTime)"
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
        newsDetailedContentView.addSubview(newsImageView)
        newsDetailedContentView.addSubview(newsTitle)
        newsDetailedContentView.addSubview(authorDetailsView)
        newsDetailedContentView.addSubview(newsSubTitle)
        newsDetailedContentView.addSubview(verticalBar)
        
        newsDetailedScrollView.addSubview(newsDetailedContentView)
        
        view.addSubview(newsDetailedScrollView)
        
        setupLayoutConstraints()
    }
    
    func setupLayoutConstraints() {
        NSLayoutConstraint.activate([
            newsDetailedScrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            newsDetailedScrollView.topAnchor.constraint(equalTo: view.topAnchor),
            newsDetailedScrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            newsDetailedScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            newsDetailedContentView.leadingAnchor.constraint(equalTo: newsDetailedScrollView.leadingAnchor),
            newsDetailedContentView.topAnchor.constraint(equalTo: newsDetailedScrollView.topAnchor),
            newsDetailedContentView.trailingAnchor.constraint(equalTo: newsDetailedScrollView.trailingAnchor),
            newsDetailedContentView.bottomAnchor.constraint(equalTo: newsDetailedScrollView.bottomAnchor),
            newsDetailedContentView.widthAnchor.constraint(equalTo: newsDetailedScrollView.widthAnchor),
            
            newsImageView.leadingAnchor.constraint(equalTo: newsDetailedContentView.leadingAnchor),
            newsImageView.topAnchor.constraint(equalTo: newsDetailedContentView.topAnchor),
            newsImageView.trailingAnchor.constraint(equalTo: newsDetailedContentView.trailingAnchor),
            newsImageView.heightAnchor.constraint(equalToConstant: AppConstants.appConstants_s250),
            
            newsTitle.leadingAnchor.constraint(equalTo: verticalBar.trailingAnchor, constant: AppConstants.appConstants_s8),
            newsTitle.topAnchor.constraint(equalTo: newsImageView.bottomAnchor, constant: AppConstants.appConstants_s16),
            newsTitle.trailingAnchor.constraint(equalTo: newsDetailedContentView.trailingAnchor,  constant: -AppConstants.appConstants_s16),
            
            authorDetailsView.topAnchor.constraint(equalTo: newsTitle.bottomAnchor, constant: AppConstants.appConstants_s8),
            authorDetailsView.leadingAnchor.constraint(equalTo: newsTitle.leadingAnchor),
            authorDetailsView.trailingAnchor.constraint(equalTo: newsTitle.trailingAnchor),
            
            newsSubTitle.leadingAnchor.constraint(equalTo: newsDetailedContentView.leadingAnchor,  constant: AppConstants.appConstants_s16),
            newsSubTitle.topAnchor.constraint(equalTo: authorDetailsView.bottomAnchor, constant: AppConstants.appConstants_s16),
            newsSubTitle.trailingAnchor.constraint(equalTo: newsDetailedContentView.trailingAnchor,  constant: -AppConstants.appConstants_s16),
            newsSubTitle.bottomAnchor.constraint(lessThanOrEqualTo: newsDetailedContentView.bottomAnchor),
            
            verticalBar.leadingAnchor.constraint(equalTo: newsDetailedContentView.leadingAnchor, constant: AppConstants.appConstants_s10),
            verticalBar.topAnchor.constraint(equalTo: newsTitle.topAnchor),
            verticalBar.bottomAnchor.constraint(equalTo: newsTitle.bottomAnchor),
            verticalBar.widthAnchor.constraint(equalToConstant: 2),
        ])
    }
}
