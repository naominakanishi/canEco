
import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    let challengeImage = UIImageView()
    let categoryLabel = UILabel()
    let challengeTitle = UILabel()
    let infoButton = UIButton()

    let placeholderInformation = UILabel()
    
    let impactTitle = UILabel()
    
    let acceptChallengeButton = UIButton()
    var delegate: NewChallengeViewController?
    
    var challenge: Challenge? {
        didSet {
            if oldValue == nil {
                setupBenefits()
            }
            setupLabels()
            setupAcceptButton()
            infoButton.tintColor = challenge?.category.getColor()
        }
    }
    
    var navigateToOpenCard: ((Challenge) -> Void)?
    
    let impactsStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        displayChallengeImage()
        displayAcceptChallengeButton()
        displayCategoryLabel()
        displayChallengeTitle()
        displayInfoButton()
        displayPlaceholderInformation()
        displayImpactsStackView()
        displayImpactTitle()
        
        
        contentView.backgroundColor = .white
        contentView.layer.masksToBounds = false
        challengeImage.layer.masksToBounds = false
        contentView.layer.cornerRadius = cardCornerRadius
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func displayChallengeImage() {
        challengeImage.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(challengeImage)
        
        challengeImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        challengeImage.centerYAnchor.constraint(equalTo: contentView.topAnchor, constant: 30).isActive = true
        challengeImage.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: challangeImageProportionToCardWidth).isActive = true
        challengeImage.heightAnchor.constraint(equalTo: challengeImage.widthAnchor, multiplier: challengeImageAspectRatio).isActive = true
    }
    
    func displayCategoryLabel() {
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(categoryLabel)
        
        categoryLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        categoryLabel.topAnchor.constraint(equalTo: challengeImage.bottomAnchor, constant: categoryLabelDistanceToImage).isActive = true
        
        categoryLabel.font = UIFont(name: "Ubuntu-Medium", size: categoryLabelFontSize)
    }
    
    func displayChallengeTitle() {
        challengeTitle.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(challengeTitle)
        
        challengeTitle.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: challengeTitleProportionToCardWidth).isActive = true
        challengeTitle.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        challengeTitle.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: challengeTitleDistanceToCategoryLabel).isActive = true
        challengeTitle.heightAnchor.constraint(equalToConstant: challengeTitleHeight).isActive = true
        
        challengeTitle.textAlignment = .center
        challengeTitle.numberOfLines = 2
        challengeTitle.font = UIFont(name: "Ubuntu-Bold", size: challengeTitleFontSize)
        challengeTitle.textColor = UIColor(named: "black")
    }
    
    func displayInfoButton() {
        infoButton.addTarget(self, action: #selector(handleInfoButtonTap), for: .touchUpInside)
        infoButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(infoButton)
        
        infoButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: infoButtonDistanceToCardTop).isActive = true
        infoButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: infoButtonDistanceToCardTrailing).isActive = true
        infoButton.widthAnchor.constraint(equalToConstant: infoButtonSize).isActive = true
        infoButton.heightAnchor.constraint(equalToConstant: infoButtonSize).isActive = true
        
        infoButton.setImage(UIImage(systemName: "info.circle")?.applyingSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: infoButtonSize, weight: .regular)), for: .normal)
    }
    
    
    func displayPlaceholderInformation() {
        placeholderInformation.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(placeholderInformation)
        
        placeholderInformation.leadingAnchor.constraint(equalTo: challengeTitle.leadingAnchor).isActive = true
        placeholderInformation.trailingAnchor.constraint(equalTo: infoButton.trailingAnchor).isActive = true
        placeholderInformation.topAnchor.constraint(equalTo: challengeTitle.bottomAnchor, constant: phDistanceToChallengeTitle).isActive = true
        
        placeholderInformation.numberOfLines = 0
        placeholderInformation.font = UIFont(name: "Ubuntu-Regular", size: phFontSize)
        placeholderInformation.text = " 87 participantes       4 semanas"
        placeholderInformation.textColor = UIColor(named: "gray")
    }
    
    func displayImpactTitle() {
        impactTitle.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(impactTitle)
        
        impactTitle.bottomAnchor.constraint(equalTo: impactsStackView.topAnchor, constant: impactTitleDistanceToBenefitStack).isActive = true
        impactTitle.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: impactTitleProportionToCardWidth).isActive = true
        impactTitle.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        impactTitle.numberOfLines = 0
        impactTitle.font = UIFont(name: "Ubuntu-Bold", size: impactTitleFontSize)
        impactTitle.textColor = UIColor(named: "black")
        impactTitle.textAlignment = .center
        impactTitle.text = "Impactos positivos"
        
    }
    
    func displayImpactsStackView(){
        contentView.addSubview(impactsStackView)
        impactsStackView.translatesAutoresizingMaskIntoConstraints = false

        impactsStackView.bottomAnchor.constraint(
            equalTo: acceptChallengeButton.topAnchor,
            constant: impactStackBotomDistanceToAcceptButton
        ).isActive = true

        impactsStackView.widthAnchor.constraint(
            equalTo: contentView.widthAnchor,
            multiplier: impactStackProportionToCardWidth
        ).isActive = true
        
        impactsStackView.centerXAnchor.constraint(
            equalTo: contentView.centerXAnchor
        ).isActive = true
        
        impactsStackView.spacing = frame.width * 0.8 * 0.35
        impactsStackView.alignment = .leading
    }
    
    func displayAcceptChallengeButton() {
        acceptChallengeButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(acceptChallengeButton)
        
        acceptChallengeButton.widthAnchor.constraint(
            equalTo: contentView.widthAnchor,
            multiplier: acceptButtonProportionToCardWidth
        ).isActive = true
        
        acceptChallengeButton.heightAnchor.constraint(
            equalTo: acceptChallengeButton.widthAnchor,
            multiplier: acceptButtonAspectRatio
        ).isActive = true
        
        acceptChallengeButton.centerYAnchor.constraint(
            equalTo: contentView.bottomAnchor
        ).isActive = true
        
        acceptChallengeButton.centerXAnchor.constraint(
            equalTo: contentView.centerXAnchor
        ).isActive = true
        
        acceptChallengeButton.setTitle("TOPAR DESAFIO", for: .normal)
        acceptChallengeButton.layer.cornerRadius = acceptButtonCornerRadius
        acceptChallengeButton.titleLabel?.font = UIFont(name: "Ubuntu-Medium", size: acceptButtonFontSize)
        
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
        challengeImage.image = UIImage(named: challenge!.imageName)
        categoryLabel.text = challenge?.category.rawValue
        categoryLabel.textColor = challenge?.category.getColor()
    }
    
    func setupBenefits() {
        impactsStackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
            impactsStackView.removeArrangedSubview($0)}
        challenge?.benefits.forEach {
            let impactsView = ImpactsView(benefit: $0)
            impactsView.associetedStackView = impactsStackView
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

//MARK: Constants
//Card Constants
let cardCornerRadius: CGFloat = 27

//Challenge Image Constants
let challangeImageProportionToCardWidth: CGFloat = 0.7
let challengeImageAspectRatio: CGFloat = 130/235

//Category Label Constants
let categoryLabelDistanceToImage: CGFloat = 25
let categoryLabelFontSize: CGFloat = 16

//Challenge Title Constants
let challengeTitleProportionToCardWidth: CGFloat = 0.7
let challengeTitleDistanceToCategoryLabel: CGFloat = 25
let challengeTitleHeight: CGFloat = 68
let challengeTitleFontSize: CGFloat = 30

//Info Button Constants
let infoButtonSize: CGFloat = 25
let infoButtonDistanceToCardTop: CGFloat = 15
let infoButtonDistanceToCardTrailing: CGFloat = -15

//Placeholder Label Constants
let phDistanceToChallengeTitle: CGFloat = 15
let phFontSize: CGFloat = 14

//Impact Title Constants
let impactTitleDistanceToBenefitStack: CGFloat = -15
let impactTitleProportionToCardWidth: CGFloat = 0.7
let impactTitleFontSize: CGFloat = 20

//Benefit Stack Constants
let impactStackBotomDistanceToAcceptButton: CGFloat = -30
let impactStackProportionToCardWidth: CGFloat = 0.8

//Accept Button Constants
let acceptButtonProportionToCardWidth: CGFloat = 0.76
let acceptButtonAspectRatio: CGFloat = 64/237
let acceptButtonCornerRadius: CGFloat = 16
let acceptButtonFontSize: CGFloat = 20
