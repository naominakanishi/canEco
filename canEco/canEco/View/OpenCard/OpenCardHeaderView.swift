
import UIKit

class OpenCardHeaderView: UIView {
    let challengeImage = UIImageView()
    let progressTitle = UILabel()
    var progressBar: ProgressBar!

    let challenge: Challenge
    let isOngoingChallenge: Bool!
    
    
    let margin: CGFloat = 40
    
    init(challenge: Challenge) {
        self.challenge = challenge
        isOngoingChallenge = User.shared.ongoingChallenges.first { $0.name == challenge.name } != nil
        
        super.init(frame: .zero)
        displayChallengeImage()
        
        if isOngoingChallenge {
            if let ch = challenge as? StepCounter {
                progressBar = ProgressBar(highlightColor: .white.withAlphaComponent(0.4), stepCount: ch.totalSteps)
                progressBar.completedStepCount = ch.completedSteps
                progressBar.emptyColor = (UIColor(named: "black")?.withAlphaComponent(0.2))!
                displayProgressBar()
                displayProgressTitle()
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func displayChallengeImage() {
        self.translatesAutoresizingMaskIntoConstraints = false
        challengeImage.translatesAutoresizingMaskIntoConstraints = false
        addSubview(challengeImage)
        
        challengeImage.image = UIImage(named: challenge.imageName + "-white")
        
        NSLayoutConstraint.activate([
            challengeImage.topAnchor.constraint(equalTo: topAnchor, constant: margin),
            challengeImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: margin),
            challengeImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -margin),
            challengeImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: isOngoingChallenge ? -margin-30: -margin)
        ])
        
        challengeImage.backgroundColor = challenge.category.getColor()
        
    }
    
    func displayProgressBar() {
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        addSubview(progressBar)
        
        NSLayoutConstraint.activate([
            progressBar.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            progressBar.centerXAnchor.constraint(equalTo: centerXAnchor),
            progressBar.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.83),
            progressBar.heightAnchor.constraint(equalToConstant: 6)
        ])
        
    }
    
    func displayProgressTitle() {
        progressTitle.translatesAutoresizingMaskIntoConstraints = false
        addSubview(progressTitle)
        
        progressTitle.textAlignment = .center
        progressTitle.text = "Seu progresso no desafio"
        progressTitle.font = UIFont(name: "Ubuntu-Regular", size: 14)
        progressTitle.textColor = .white.withAlphaComponent(0.4)
        
        NSLayoutConstraint.activate([
            progressTitle.bottomAnchor.constraint(equalTo: progressBar.topAnchor, constant: -5),
            progressTitle.centerXAnchor.constraint(equalTo: centerXAnchor),
            progressTitle.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.83)
        ])
    }
  
    
}
