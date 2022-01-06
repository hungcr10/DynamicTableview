//
//  Model.swift
//  DemoDynamicTableView
//
//  Created by CristianoDaoHung on 30/12/2021.
//

import Foundation
import UIKit

struct Contacts {
     let id: String = UUID().uuidString //auto generate id
     var name: String
     var phone: String
     var avt: UIImage
}
struct InfoContacts {
    static var contactDatasources: [Contacts] = [Contacts(name: "Dao Hung", phone: "092828", avt: #imageLiteral(resourceName: "hung")),
                                                Contacts(name: "Nam Phu", phone: "0917618517", avt: #imageLiteral(resourceName: "toan")),
                                                Contacts(name: "Van Kiet", phone: "0917618517", avt: #imageLiteral(resourceName: "hoang")),
                                                Contacts(name: "Anh Pham", phone: "0917618517", avt: #imageLiteral(resourceName: "kiet")),
                                                Contacts(name: "Anh Tran", phone: "0917618517", avt: #imageLiteral(resourceName: "kiet")),
                                                Contacts(name: "Bao Nam", phone: "0917618517", avt: #imageLiteral(resourceName: "toan")),
                                                Contacts(name: "Bao Tin", phone: "0917618517", avt: #imageLiteral(resourceName: "duy")),
                                                Contacts(name: "Giao Thuy", phone: "0917618517", avt: #imageLiteral(resourceName: "phu")),
                                                Contacts(name: "Kha Le", phone: "0917618517", avt: #imageLiteral(resourceName: "hoang")),
                                                Contacts(name: "Le Tin", phone: "0917618517", avt: #imageLiteral(resourceName: "duy")),
                                                Contacts(name: "Nam Nguyen", phone: "0917618517", avt: #imageLiteral(resourceName: "kiet")),
                                                Contacts(name: "Mai Ho", phone: "0917618517", avt: #imageLiteral(resourceName: "hoang"))]
}
