
import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    let challengeImage = UIImageView()
    let challengeTitle = UILabel()
    let infoButton = UIButton()

    let placeholderInformation = UILabel()
    
    let impactTitle = UILabel()
    
    let acceptChallengeButton = UIButton()
    var delegate: NewChallengeViewController?
    
    var challenge: Challenge? {
        didSet {
            setupLabels()
            setupBenefits()
            setupAcceptButton()
        }
    }
    
    var navigateToOpenCard: ((Challenge) -> Void)?
    
    let impactsStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        displayChallengeImage()
        displayChallengeTitle()
        displayInfoButton()
        displayPlaceholderInformation()
        displayImpactTitle()
        displayAcceptChallengeButton()
        displayImpactsStackView()
        
        
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 27
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func displayChallengeImage () {
        challengeImage.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(challengeImage)
        
        challengeImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        challengeImage.centerYAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        challengeImage.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.7).isActive = true
        challengeImage.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 129/232).isActive = true
        
        challengeImage.backgroundColor = .lightGray
    }
    
    func displayChallengeTitle() {
        challengeTitle.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(challengeTitle)
        
        challengeTitle.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.7).isActive = true
        challengeTitle.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        challengeTitle.topAnchor.constraint(equalTo: challengeImage.bottomAnchor, constant: 15).isActive = true
        
        challengeTitle.textAlignment = .center
        challengeTitle.numberOfLines = 0
        challengeTitle.font = UIFont.boldSystemFont(ofSize: 36)
    }
    
    func displayInfoButton() {
        infoButton.addTarget(self, action: #selector(handleInfoButtonTap), for: .touchUpInside)
        infoButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(infoButton)
        
        infoButton.leadingAnchor.constraint(equalTo: challengeImage.trailingAnchor, constant: 10).isActive = true
        infoButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        infoButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        infoButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        infoButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        infoButton.setImage(UIImage(systemName: "info.circle")?.applyingSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 25, weight: .regular)), for: .normal)
        infoButton.tintColor = .black
    }
    
    
    func displayPlaceholderInformation() {
        placeholderInformation.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(placeholderInformation)
        
        placeholderInformation.leadingAnchor.constraint(equalTo: challengeTitle.leadingAnchor).isActive = true
        placeholderInformation.trailingAnchor.constraint(equalTo: infoButton.trailingAnchor).isActive = true
        placeholderInformation.topAnchor.constraint(equalTo: challengeTitle.bottomAnchor, constant: 10).isActive = true
        
        placeholderInformation.numberOfLines = 0
        placeholderInformation.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        placeholderInformation.text = " 87 participantes       4 semanas"
    }
    
    func displayImpactTitle() {
        impactTitle.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(impactTitle)
        
        impactTitle.topAnchor.constraint(equalTo: placeholderInformation.bottomAnchor, constant: 35).isActive = true
        impactTitle.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.7).isActive = true
        impactTitle.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        impactTitle.numberOfLines = 0
        impactTitle.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        impactTitle.textAlignment = .center
        impactTitle.text = "Impactos positivos"
        
    }
    
    func displayImpactsStackView(){
        impactsStackView.distribution = .fillEqually
        impactsStackView.alignment = .center
        
        contentView.addSubview(impactsStackView)
        impactsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        impactsStackView.topAnchor.constraint(
            equalTo: impactTitle.bottomAnchor,
            constant: 10
        ).isActive = true
        
        impactsStackView.bottomAnchor.constraint(
            equalTo: acceptChallengeButton.topAnchor,
            constant: -20
        ).isActive = true
        
        impactsStackView.widthAnchor.constraint(
            lessThanOrEqualTo: contentView.widthAnchor,
            multiplier: 0.8
        ).isActive = true
        
        impactsStackView.centerXAnchor.constraint(
            equalTo: contentView.centerXAnchor
        ).isActive = true
    }
    
    func displayAcceptChallengeButton() {
        acceptChallengeButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(acceptChallengeButton)
        
        acceptChallengeButton.widthAnchor.constraint(
            equalTo: contentView.widthAnchor,
            multiplier: 0.76
        ).isActive = true
        
        acceptChallengeButton.heightAnchor.constraint(
            equalTo: acceptChallengeButton.widthAnchor,
            multiplier: 64/237
        ).isActive = true
        
        acceptChallengeButton.centerYAnchor.constraint(
            equalTo: contentView.bottomAnchor
        ).isActive = true
        
        acceptChallengeButton.centerXAnchor.constraint(
            equalTo: contentView.centerXAnchor
        ).isActive = true
        
        acceptChallengeButton.setTitle("ACEITAR DESAFIO", for: .normal)
        acceptChallengeButton.layer.cornerRadius = 16
        
        acceptChallengeButton.addTarget(self, action: #selector(acceptChallenge), for: .touchUpInside)
    }
    
    @objc func acceptChallenge() {
        let ch = challenge!.copy()
        User.shared.begin(challenge: ch)
        if let del = delegate {
            del.tabBarController?.selectedIndex = 0
        }
    }
    
    func setupLabels() {
        challengeTitle.text = challenge!.name
        challengeImage.image = UIImage(named: "placeholder")
    }
    
    func setupBenefits() {
        impactsStackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
            impactsStackView.removeArrangedSubview($0)}
        challenge?.benefits.forEach {
            let impactsView = ImpactsView(benefit: $0)
            impactsStackView.addArrangedSubview(impactsView)
        }
    }
    
    func setupAcceptButton() {
        acceptChallengeButton.backgroundColor = challenge?.category.getColor()
    }
    
    @objc
    func handleInfoButtonTap() {
        guard let challenge = challenge else { return }
        navigateToOpenCard?(challenge)
    }
}
