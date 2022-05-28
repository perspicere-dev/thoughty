//
//  ItemCell.swift
//  Thoughty
//
//  Created by Przemysław Wnęk on 15/05/2022.
//

import UIKit

class ItemCell: UITableViewCell {
    
    let titleText = UILabel()
    let dateValue = UILabel()
    let bodyText = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell() {
        //set stack view for cell
        let stackView = UIStackView(arrangedSubviews: [titleText, dateValue, bodyText])
        stackView.spacing = 3
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        //set title text label
        titleText.numberOfLines = 3
        titleText.font = UIFont.systemFont(ofSize: 18, weight: .heavy)
        
        //set date text
        dateValue.font = UIFont.systemFont(ofSize: 12)
        dateValue.textColor = .systemGray
        
        // set body label
        bodyText.numberOfLines = 5
        titleText.font = UIFont.systemFont(ofSize: 15)
        
        contentView.addSubview(stackView)
        
        let stackViewConstrians = [
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
        ]
        
        NSLayoutConstraint.activate(stackViewConstrians)
    }
    
    func getCurrentDate() -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YY/MM/dd"
        let currentDate = dateFormatter.string(from: date)

        return currentDate
    }
}
