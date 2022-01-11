//
//  ContactSectionHeader.swift
//  Dictionary contakts
//
//  Created by MacBook on 10/01/2022.
//

import Foundation
import UIKit

class ContactSectionHeader: UITableViewHeaderFooterView {
    
    static let reuseId = String(describing: self)
    
    // Лейбл это то чем мы наполняем хедр
    let lebel = UILabel()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        addSubview(lebel)
        
        lebel.snp.updateConstraints { make in
            make.left.right.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(section: String) {
        lebel.text = section
    }
    
}
