import UIKit

protocol CheckListItemViewDelegate: AnyObject {
    func handleItemTapped(_ view: ChecklistItemView, _ direction: Direction)
}

class ChecklistItemView: UIView {

    let checkImage = UIImageView()
    let itemTitle = UILabel()
    let itemDescription = UILabel()

    var challenge: StepChallenge
    weak var delegate: CheckListItemViewDelegate?
    
    var stepIndex: Int

    let isChecked: Bool = false

    let checkboxPadding: CGFloat = 30
    
    init(challenge: StepChallenge, stepIndex: Int){
     //   self.info = info
        
        self.challenge = challenge
        self.stepIndex = stepIndex
        
        super.init(frame: .zero)
       
        layer.cornerRadius = 16
    
        
        displayCheckImage()
        displayItemTitle()
        displayItemDescription()
        setupView()
        setupLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        self.addGestureRecognizer(tap)
    }
    
    func displayCheckImage() {
        checkImage.translatesAutoresizingMaskIntoConstraints = false
        addSubview(checkImage)
        
        NSLayoutConstraint.activate([
            checkImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            checkImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: checkboxPadding),
            checkImage.widthAnchor.constraint(equalToConstant: 20),
            checkImage.heightAnchor.constraint(equalTo: checkImage.widthAnchor)
        ])
        
        checkImage.tintColor = UIColor(named: "black")
        
    }
    
    func displayItemTitle() {
        itemTitle.translatesAutoresizingMaskIntoConstraints = false
        addSubview(itemTitle)
        
        NSLayoutConstraint.activate([
            itemTitle.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            itemTitle.leadingAnchor.constraint(equalTo: checkImage.trailingAnchor, constant: checkboxPadding),
            itemTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -checkboxPadding),
        ])
        
        itemTitle.font = UIFont(name: "Ubuntu-Medium", size: 16)
        itemTitle.numberOfLines = 0
       // itemTitle.textColor = UIColor(named: "black")
    }
    
    func displayItemDescription() {
        itemDescription.translatesAutoresizingMaskIntoConstraints = false
        addSubview(itemDescription)
        
        NSLayoutConstraint.activate([
            itemDescription.topAnchor.constraint(equalTo: itemTitle.bottomAnchor, constant: 5),
            itemDescription.leadingAnchor.constraint(equalTo: checkImage.trailingAnchor, constant: checkboxPadding),
            itemDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -checkboxPadding),
            itemDescription.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
        
        itemDescription.font = UIFont(name: "Ubuntu-Regular", size: 12)
        itemDescription.numberOfLines = 0
    }
    
    func setupLayout() {
        itemTitle.textColor = challenge.steps[stepIndex].isComplete ? UIColor(named: "gray") : UIColor(named: "black")
        layer.backgroundColor = self.challenge.steps[stepIndex].isComplete ? UIColor(named: "darkBeige")?.cgColor : UIColor(named: "beige")?.cgColor
        
        let imageName: String
        if challenge.steps[stepIndex].isComplete {
            imageName = "checkmark.square"
        } else if stepIndex == challenge.completedSteps {
            imageName = "square"
        } else {
            imageName = "lock"
        }
        
        checkImage.image = UIImage(systemName: imageName)
        
        itemDescription.textColor = challenge.steps[stepIndex].isComplete ? UIColor.lightGray : UIColor(named: "black")
        
        let strikeThroughTitle: NSMutableAttributedString =  NSMutableAttributedString(string: challenge.steps[stepIndex].description)
        let strikeThroughDescription: NSMutableAttributedString =  NSMutableAttributedString(string: challenge.steps[stepIndex].subtitle)
        
        if challenge.steps[stepIndex].isComplete {
            strikeThroughTitle.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, strikeThroughTitle.length))
            strikeThroughDescription.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, strikeThroughDescription.length))
        } else {
            strikeThroughTitle.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 0, range: NSMakeRange(0, strikeThroughTitle.length))
            strikeThroughDescription.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 0, range: NSMakeRange(0, strikeThroughDescription.length))
        }
        itemTitle.attributedText = strikeThroughTitle
        itemDescription.attributedText = strikeThroughDescription
    }
    
    @objc func handleTap() {
        
        if stepIndex == challenge.completedSteps - 1 {
            delegate?.handleItemTapped(self, .backwards)
        } else if stepIndex == challenge.completedSteps {
            delegate?.handleItemTapped(self, .forward)
        }

    }
}

enum Direction {
    case forward
    case backwards
}
