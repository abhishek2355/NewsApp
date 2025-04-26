import UIKit

class BottomButtons: UIButton {
    let buttonLabel: String
    let buttonBackgroundColor: UIColor
    let buttonLabelColor: UIColor
    
    init(buttonText: String, buttonColor: UIColor, labelColor: UIColor) {
        self.buttonLabel = buttonText
        self.buttonBackgroundColor = buttonColor
        self.buttonLabelColor = labelColor
        
        super.init(frame: .zero)
        
        setupButtonLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupButtonLayout() {
        self.setTitle(self.buttonLabel, for: .normal)
        self.setTitleColor(self.buttonLabelColor, for: .normal)
        self.backgroundColor = self.buttonBackgroundColor
        self.layer.cornerRadius = 30
        self.layer.borderColor = UIColor(red: 76/255, green: 153/255, blue: 0/255, alpha: 1.0).cgColor
        self.layer.borderWidth = 1.0
        self.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.leadingAnchor.constraint(equalTo: leadingAnchor),
            self.trailingAnchor.constraint(equalTo: trailingAnchor),
            self.topAnchor.constraint(equalTo: topAnchor),
            self.bottomAnchor.constraint(equalTo: bottomAnchor),
            self.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
}
