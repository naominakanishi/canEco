
import UIKit

class OpenCardHeaderView: UIView {
    let challengeImage = UIImageView()

    let challenge: Challenge
    
    let margin: CGFloat = 40
    
    init(challenge: Challenge) {
        self.challenge = challenge
        
        super.init(frame: .zero)
        displayChallengeImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func displayChallengeImage() {
        self.translatesAutoresizingMaskIntoConstraints = false
        challengeImage.translatesAutoresizingMaskIntoConstraints = false
        addSubview(challengeImage)
        
        challengeImage.image = UIImage(named: challenge.imageName)
        
        NSLayoutConstraint.activate([
            challengeImage.topAnchor.constraint(equalTo: topAnchor, constant: margin),
            challengeImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: margin),
            challengeImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -margin),
            challengeImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -margin)
        ])
        
        challengeImage.backgroundColor = challenge.category.getColor()
        
    }
}
