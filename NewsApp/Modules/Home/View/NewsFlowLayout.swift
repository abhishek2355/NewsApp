import UIKit

class NewsFlowLayout: UICollectionViewFlowLayout {
    
    override init() {
        super.init()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        scrollDirection = .vertical
        minimumLineSpacing = AppConstants.appConstants_s16
        sectionInset = UIEdgeInsets(
            top: AppConstants.appConstants_s16,
            left: AppConstants.appConstants_s16,
            bottom: AppConstants.appConstants_s16,
            right: AppConstants.appConstants_s16
        )
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}
