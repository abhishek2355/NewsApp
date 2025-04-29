import UIKit

class DashboardViewController: UIViewController {
    private var newsItems: [NewsItem] = []
    
    private lazy var newsCollectionView: UICollectionView = {
        let layout = NewsFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = AppColorConstants.appBackgroundColor
        collectionView.register(NewsCollectionViewCell.self, forCellWithReuseIdentifier: NewsCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppColorConstants.appBackgroundColor
        setupNavigationBar()
        loadDummyNews()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func setupNavigationBar() {
        self.navigationItem.title = "News App"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.hidesBackButton = true
        self.navigationItem.largeTitleDisplayMode = .always
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bell.badge.fill"), style: .plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItem?.tintColor = .gray
    }
    
    func setupViews() {
        view.addSubview(newsCollectionView)
        
        NSLayoutConstraint.activate([
            newsCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            newsCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            newsCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            newsCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
    
    func loadDummyNews() {
        newsItems = [
            NewsItem(
                title: "iOS 18 Released! The latest version of iOS brings incrediable new features The latest version of iOS brings incrediable new features The latest version of iOS brings incrediable new features The latest version of iOS brings incrediable new features The latest version of iOS brings incrediable new features",
                description: "The latest version of iOS brings incrediable new features The latest version of iOS brings incrediable new features The latest version of iOS brings incrediable new features The latest version of iOS brings incrediable new features The latest version of iOS brings incrediable new features The latest version of iOS brings incrediable new features The latest version of iOS brings incrediable new features The latest version of iOS brings incrediable new features The latest version of iOS brings incrediable new features The latest version of iOS brings incrediable new features The latest version of iOS brings incrediable new features The latest version of iOS brings incrediable new features The latest version of iOS brings incrediable new features The latest version of iOS brings incrediable new features The latest version of iOS brings incrediable new features The latest version of iOS brings incrediable new features The latest version of iOS brings incrediable new features The latest version of iOS brings incrediable new features The latest version of iOS brings incrediable new features The latest version of iOS brings incrediable new features The latest version of iOS brings incrediable new features",
                imageName: "DemoImage"
            ),
            NewsItem(title: "iOS 18 Released!", description: "The latest version of iOS brings incrediable new features", imageName: "DemoImage"),
            NewsItem(title: "iOS 18 Released!", description: "The latest version of iOS brings incrediable new features", imageName: "DemoImage"),
            NewsItem(title: "iOS 18 Released!", description: "The latest version of iOS brings incrediable new features", imageName: "DemoImage"),
            NewsItem(title: "iOS 18 Released!", description: "The latest version of iOS brings incrediable new features", imageName: "DemoImage"),
            NewsItem(title: "iOS 18 Released!", description: "The latest version of iOS brings incrediable new features", imageName: "DemoImage"),
            NewsItem(title: "iOS 18 Released!", description: "The latest version of iOS brings incrediable new features", imageName: "DemoImage"),
            NewsItem(title: "iOS 18 Released!", description: "The latest version of iOS brings incrediable new features", imageName: "DemoImage"),
            NewsItem(title: "iOS 18 Released!", description: "The latest version of iOS brings incrediable new features", imageName: "DemoImage"),
            NewsItem(title: "iOS 18 Released!", description: "The latest version of iOS brings incrediable new features", imageName: "DemoImage"),
            NewsItem(title: "iOS 18 Released!", description: "The latest version of iOS brings incrediable new features", imageName: "DemoImage"),
            NewsItem(title: "iOS 18 Released!", description: "The latest version of iOS brings incrediable new features", imageName: "DemoImage"),
            NewsItem(title: "iOS 18 Released!", description: "The latest version of iOS brings incrediable new features", imageName: "DemoImage"),
            NewsItem(title: "iOS 18 Released!", description: "The latest version of iOS brings incrediable new features", imageName: "DemoImage"),
            NewsItem(title: "iOS 18 Released!", description: "The latest version of iOS brings incrediable new features", imageName: "DemoImage"),
            NewsItem(title: "iOS 18 Released!", description: "The latest version of iOS brings incrediable new features", imageName: "DemoImage"),
            NewsItem(title: "iOS 18 Released!", description: "The latest version of iOS brings incrediable new features", imageName: "DemoImage"),
            NewsItem(title: "iOS 18 Released!", description: "The latest version of iOS brings incrediable new features", imageName: "DemoImage"),
            NewsItem(title: "iOS 18 Released!", description: "The latest version of iOS brings incrediable new features", imageName: "DemoImage"),
            NewsItem(title: "iOS 18 Released!", description: "The latest version of iOS brings incrediable new features", imageName: "DemoImage"),
            NewsItem(title: "iOS 18 Released!", description: "The latest version of iOS brings incrediable new features", imageName: "DemoImage"),
            NewsItem(title: "iOS 18 Released!", description: "The latest version of iOS brings incrediable new features", imageName: "DemoImage"),
            NewsItem(title: "iOS 18 Released!", description: "The latest version of iOS brings incrediable new features", imageName: "DemoImage"),
            NewsItem(title: "iOS 18 Released!", description: "The latest version of iOS brings incrediable new features", imageName: "DemoImage"),
        ]
        newsCollectionView.reloadData()
    }

}

extension DashboardViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCollectionViewCell.identifier, for: indexPath) as? NewsCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: newsItems[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width - 20
        return CGSize(width: width, height: 170)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedNewsData = newsItems[indexPath.item]
        navigationController?.pushViewController(
            NewsDetailViewController(selectedNews: selectedNewsData),
            animated: true
        )
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: any UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        coordinator.animate(alongsideTransition: { _ in
            self.newsCollectionView.collectionViewLayout.invalidateLayout()
        })
    }
}
