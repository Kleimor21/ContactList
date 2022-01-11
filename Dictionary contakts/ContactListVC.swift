//
//  ViewController.swift
//  Dictionary contakts
//
//  Created by MacBook on 08/01/2022.
//
import SnapKit
import UIKit
import SwiftUI

class ContactListVC: UIViewController {
    
    let tableView = UITableView()
    
    var contacts = [String: [Contact]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
        contacts = Contact.dictionary
        tableView.reloadData()
    
    }
    
    func setupViews() {
        navigationItem.title = "Контакты"
        view.backgroundColor = .white
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        // регистрация таблицы
        // таблица
        
        
        tableView.register(ContactCell.self, forCellReuseIdentifier: ContactCell.reuseId)
        tableView.register(ContactSectionHeader.self, forHeaderFooterViewReuseIdentifier: ContactSectionHeader.reuseId)
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    


}


extension ContactListVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return contacts.keys.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //получаем массив секций из ключей дикшенари(Словарь) , отсортированный
        let sections = contacts.keys.sorted(by: { $0 < $1}) // [A,Б,В,Г ...]
        
        //Получили текущую секцию
        // contactsSection - Контакты Раздел
        let contactsSection = sections[section] // берём Одну сейкию (например А или Б)
        
        //Получили массив контактов в текущей секции с дикшенари ( например все контакты Секции А их 3 шт )
        guard let contactsInSection = contacts[contactsSection] else { return 0 }
        
        return contactsInSection.count
    }
    
    
    
    // установка данных в ячейку
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ContactCell.reuseId, for: indexPath)
        guard let contactCell = cell as? ContactCell else { return cell }
        
        let section = indexPath.section
        let index = indexPath.row
        
        //получаем массив секций из ключей дикшенари(Словарь) , отсортированный
        let sections = contacts.keys.sorted(by: { $0 < $1}) // [A,Б,В,Г ...]
        
        //Получили текущую секцию
        // contactsSection - Контакты Раздел
        let contactsSection = sections[section] // берём Одну сейкию (например А или Б)
        
      guard let contactsInSection = contacts[contactsSection] else { return contactCell }
        
        let contact = contactsInSection[index]
        
        // !!! ЗАПОЛНЕНИЕ ЯЧЕЙКИ ( Вызываем функцию что бы она заполнила себя ) функция configure находится в контактСелл
        
        contactCell.configure(contact: contact)
        
        return contactCell
        
    }
}

extension ContactListVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: ContactSectionHeader.reuseId)
        
        guard let headerCell = cell as? ContactSectionHeader else { return cell }
        
        // так же получаем массив секции из ключей
        let sections = contacts.keys.sorted(by: { $0 < $1 })
        
        let contactsSection = sections[section]
        
        //Устанавливаем в ячейку
        headerCell.configure(section: contactsSection)
        
        return headerCell
         
    }
}
