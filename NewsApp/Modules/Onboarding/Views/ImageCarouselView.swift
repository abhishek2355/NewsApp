import UIKit

class ImageCarouselView: UIImageView {
    private let imageURL: String
    
    init(for image: String) {
        self.imageURL = image
        super.init(frame: .zero)
        setupImageCarousel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupImageCarousel() {
        self.image = UIImage(named: self.imageURL)
        self.contentMode = .scaleAspectFill
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.leadingAnchor.constraint(equalTo: leadingAnchor),
            self.trailingAnchor.constraint(equalTo: trailingAnchor),
            self.topAnchor.constraint(equalTo: topAnchor),
            self.bottomAnchor.constraint(equalTo: bottomAnchor),
            self.heightAnchor.constraint(equalToConstant: 450),
        ])
    }
}
