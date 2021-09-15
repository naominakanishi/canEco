import UIKit

class ChecklistItemView: UIView {

    let checkImage = UIImageView()
    let itemTitle = UILabel()
    let itemDescription = UILabel()
    
    var info: (Title: String, Description: String, isDone: Bool){
        didSet{
            setupLayout()
        }
    }

    let isChecked: Bool = false

    let checkboxPadding: CGFloat = 30
    
    init(info: (String, String, Bool)){
        self.info = info
        super.init(frame: .zero)
        
        layer.cornerRadius = 16
        layer.backgroundColor = UIColor(named: "bege")?.cgColor
        
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
        let image = isChecked ? "checkmark.square" : "square"
        checkImage.image = UIImage(systemName: image)
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
        checkImage.backgroundColor = .white
        
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
        itemTitle.textColor = UIColor(named: "black")
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
        itemDescription.textColor = UIColor(named: "black")
    }
    
    func setupLayout() {
        itemTitle.text = info.Title
        itemDescription.text = info.Description
    }
}
