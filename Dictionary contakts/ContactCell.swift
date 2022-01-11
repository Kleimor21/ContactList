//
//  ContactCell.swift
//  Dictionary contakts
//
//  Created by MacBook on 09/01/2022.
//

import Foundation
import SnapKit

class ContactCell: UITableViewCell {
    
    static let reuseId = String(describing: self)
    
    let firstNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        
        return label
    }()
    
    let lastNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        
        return label
    }()
    
    let phoneLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        
        return label
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        
        return label
    }()
    
    // Добавляем 2 лейба в горизонтальный стек 
    lazy var nameStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [firstNameLabel, lastNameLabel])
        stackView.axis = .horizontal // размещение по горизонтали
        stackView.alignment = .center // размещение по центру
        stackView.distribution = .fillEqually // заполнить повторно
        stackView.spacing = 8  // интервал
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
   
    
    [nameStackView, phoneLabel, emailLabel].forEach(addSubview(_:))
        
        nameStackView.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview().inset(16)
        }
        
        phoneLabel.snp.makeConstraints { make in
            make.top.equalTo(nameStackView.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(16)
            
            emailLabel.snp.makeConstraints { make in
                make.left.right.equalToSuperview().inset(16)
                make.top.equalTo(phoneLabel.snp.bottom).offset(16)
                make.bottom.equalToSuperview().inset(16)
            }
            
        }
    
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Функция очистки
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        firstNameLabel.text = nil
        lastNameLabel.text = nil
        phoneLabel.text = nil
        emailLabel.text = nil
        
    }
    // Функция проверяет все лейблы если они есть то устонавливает их 
    func configure(contact: Contact) {
        
        firstNameLabel.text = contact.firstName
        lastNameLabel.text = contact.lastName
        phoneLabel.text = contact.phone
        emailLabel.text = contact.email
        
        
        
        // при данном коде при отсутствии Эмейла не будет пустого места 
        if contact.email != nil {
            emailLabel.snp.updateConstraints { make in
                make.top.equalTo(phoneLabel.snp.bottom).offset(16)
                }
            } else {
                emailLabel.snp.updateConstraints { make in
                    make.top.equalTo(phoneLabel.snp.bottom).offset(0)
                }
            }
        }
    
}
    
    
    
    
