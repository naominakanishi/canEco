
import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    let challengeImage = UIImageView()
    let categoryLabel = UILabel()
    let challengeTitle = UILabel()
    let infoButton = UIButton()

    let placeholderInformation = UILabel()
    
    let impactTitle = UILabel()
    
    let acceptChallengeButton = UIButton()
    var delegate: CardCollectionViewCellDelegate?
    
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
        displayImpactTitle()
        displayImpactsStackView()
        
        
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
        categoryLabel.topAnchor.constraint(equalTo: challengeImage.bottomAnchor, constant: categoryLabelDistanceToImage * contentView.frame.height).isActive = true
        
        categoryLabel.font = UIFont(name: "Ubuntu-Medium", size: categoryLabelFontSize)
    }
    
    func displayChallengeTitle() {
        print(contentView.frame)
        challengeTitle.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(challengeTitle)
        
        challengeTitle.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: challengeTitleProportionToCardWidth).isActive = true
        challengeTitle.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        challengeTitle.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: challengeTitleDistanceToCategoryLabel * contentView.frame.height).isActive = true
        challengeTitle.heightAnchor.constraint(equalToConstant: challengeTitleHeight * contentView.frame.height).isActive = true
        
        challengeTitle.textAlignment = .center
        challengeTitle.numberOfLines = 2
        challengeTitle.font = UIFont(name: "Ubuntu-Bold", size: challengeTitleFontSize * contentView.frame.height)
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
        
        placeholderInformation.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        placeholderInformation.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        placeholderInformation.topAnchor.constraint(equalTo: challengeTitle.bottomAnchor, constant: phDistanceToChallengeTitle * contentView.frame.height).isActive = true
        
        placeholderInformation.numberOfLines = 0
        placeholderInformation.font = UIFont(name: "Ubuntu-Regular", size: phFontSize * contentView.frame.height)
        placeholderInformation.text = "Duração: 4 semanas"
        placeholderInformation.textColor = UIColor(named: "gray")
        placeholderInformation.textAlignment = .center
    }
    
    func displayImpactTitle() {
        impactTitle.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(impactTitle)
        
        impactTitle.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: impactTitleProportionToCardWidth).isActive = true
        impactTitle.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        impactTitle.topAnchor.constraint(equalTo: placeholderInformation.bottomAnchor, constant: -impactStackBotomDistanceToAcceptButton * contentView.frame.height).isActive = true
        
        impactTitle.numberOfLines = 0
        impactTitle.font = UIFont(name: "Ubuntu-Bold", size: impactTitleFontSize * contentView.frame.height)
        impactTitle.textColor = UIColor(named: "black")
        impactTitle.textAlignment = .center
        impactTitle.text = "Impactos positivos"
        
    }
    
    func displayImpactsStackView(){
        contentView.addSubview(impactsStackView)
        impactsStackView.translatesAutoresizingMaskIntoConstraints = false

        impactsStackView.topAnchor.constraint(equalTo: impactTitle.bottomAnchor, constant: -impactTitleDistanceToBenefitStack * contentView.frame.height).isActive = true
        
        impactsStackView.bottomAnchor.constraint(
            equalTo: acceptChallengeButton.topAnchor,
            constant: impactStackBotomDistanceToAcceptButton * contentView.frame.height
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
            del.didAcceptChallenge(self)
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
            impactsView.setFontSize(12/475 * contentView.frame.height)
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
    
    //MARK: Constants
    //Card Constants
    let cardCornerRadius: CGFloat = 27

    //Challenge Image Constants
    let challangeImageProportionToCardWidth: CGFloat = 0.7
    let challengeImageAspectRatio: CGFloat = 130/235

    //Category Label Constants
    let categoryLabelDistanceToImage: CGFloat = 25 / 475
    let categoryLabelFontSize: CGFloat = 16

    //Challenge Title Constants
    let challengeTitleProportionToCardWidth: CGFloat = 0.7
    let challengeTitleDistanceToCategoryLabel: CGFloat = 25 / 475
    let challengeTitleHeight: CGFloat = 68 / 475
    let challengeTitleFontSize: CGFloat = 30 / 475

    //Info Button Constants
    let infoButtonSize: CGFloat = 25
    let infoButtonDistanceToCardTop: CGFloat = 15
    let infoButtonDistanceToCardTrailing: CGFloat = -15

    //Placeholder Label Constants
    let phDistanceToChallengeTitle: CGFloat = 5 / 475
    let phFontSize: CGFloat = 14 / 475

    //Impact Title Constants
    let impactTitleDistanceToBenefitStack: CGFloat = -10 / 475
    let impactTitleProportionToCardWidth: CGFloat = 0.7
    let impactTitleFontSize: CGFloat = 20 / 475

    //Benefit Stack Constants
    let impactStackBotomDistanceToAcceptButton: CGFloat = -30 / 475
    let impactStackProportionToCardWidth: CGFloat = 0.8
    let impactStackHeight: CGFloat = 80 / 475

    //Accept Button Constants
    let acceptButtonProportionToCardWidth: CGFloat = 0.76
    let acceptButtonAspectRatio: CGFloat = 64/237
    let acceptButtonCornerRadius: CGFloat = 16
    let acceptButtonFontSize: CGFloat = 20

}

protocol CardCollectionViewCellDelegate {
    func didAcceptChallenge(_ sender: UICollectionViewCell)
}
