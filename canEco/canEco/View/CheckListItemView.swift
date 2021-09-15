
import UIKit

class ChecklistItemView: UIView {

    let checkImage = UIImageView()
    let itemTitle = UILabel()
    let itemDescription = UILabel()
    

    let isChecked: Bool = false

    let checkboxPadding: CGFloat = 30
    
    init(){
        super.init(frame: .zero)
        itemTitle.text = "Titulo genérico"
        itemDescription.text = "Embalagens que possam ser lavadas, como por exemplo sacolas e afins."
        layer.cornerRadius = 16
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
            itemTitle.topAnchor.constraint(equalTo: topAnchor, constant: frame.height / 6),
            itemTitle.leadingAnchor.constraint(equalTo: checkImage.trailingAnchor, constant: checkboxPadding),
            itemTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -checkboxPadding),
        ])
    }
    
    func displayItemDescription() {
        itemDescription.translatesAutoresizingMaskIntoConstraints = false
        addSubview(itemDescription)
        
        NSLayoutConstraint.activate([
            itemDescription.topAnchor.constraint(equalTo: itemTitle.bottomAnchor, constant: 10),
            itemDescription.leadingAnchor.constraint(equalTo: checkImage.trailingAnchor, constant: checkboxPadding),
            itemTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -checkboxPadding)
        ])
    }
    
    
}
