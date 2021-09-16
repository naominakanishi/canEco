import UIKit

class ChecklistItemView: UIView {

    let checkImage = UIImageView()
    let itemTitle = UILabel()
    let itemDescription = UILabel()
    
//    var info: (Title: String, Description: String, isDone: Bool){
//        didSet{
//            setupLayout()
//        }
//    }
//
    var challenge: StepChallenge
    
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
        
        
        
       
       // itemTitle.textColor = UIColor(named: "black")
    }
    
    func displayItemDescription() {
        itemDescription.translatesAutoresizingMaskIntoConstraints = false
        addSubview(itemDescription)
        
        NSLayoutConstraint.activate([
            itemDescription.topAnchor.constraint(equalTo: itemTitle.bottomAnchor, constant: 10),
            itemDescription.leadingAnchor.constraint(equalTo: checkImage.trailingAnchor, constant: checkboxPadding),
            itemDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -checkboxPadding),
            itemDescription.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
        
        itemDescription.font = UIFont(name: "Ubuntu-Regular", size: 12)
        
    }
    
    func setupLayout() {
        itemTitle.textColor = challenge.steps[stepIndex].isComplete ? UIColor(named: "gray") : UIColor(named: "black")
        layer.backgroundColor = self.challenge.steps[stepIndex].isComplete ? UIColor(named: "darkBeige")?.cgColor : UIColor(named: "beige")?.cgColor
        
        let image = challenge.steps[stepIndex].isComplete ? "checkmark.square" : "square"
        checkImage.image = UIImage(systemName: image)
        
        itemDescription.textColor = challenge.steps[stepIndex].isComplete ? UIColor.lightGray : UIColor(named: "black")
        
        itemTitle.text = (challenge.steps[stepIndex].description)
        itemDescription.text = (challenge.steps[stepIndex].subtitle)
        
        let strikeThroughTitle: NSMutableAttributedString =  NSMutableAttributedString(string: itemTitle.text!)
        let strikeThroughDescription: NSMutableAttributedString =  NSMutableAttributedString(string: itemDescription.text!)
        
        if challenge.steps[stepIndex].isComplete {
            strikeThroughTitle.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, strikeThroughTitle.length))
            strikeThroughDescription.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, strikeThroughDescription.length))
        } else {
            strikeThroughTitle.removeAttribute(NSAttributedString.Key.strikethroughStyle, range: NSMakeRange(0, strikeThroughTitle.length))
            strikeThroughDescription.removeAttribute(NSAttributedString.Key.strikethroughStyle, range: NSMakeRange(0, strikeThroughDescription.length))
        }
        itemTitle.attributedText = strikeThroughTitle
        itemDescription.attributedText = strikeThroughDescription


    }
    
    @objc func handleTap() {
        if stepIndex == challenge.completedSteps - 1 {
            challenge.undoStep()
        } else if stepIndex == challenge.completedSteps {
            challenge.completeNextStep()
        }
        setupLayout()
    }
}
