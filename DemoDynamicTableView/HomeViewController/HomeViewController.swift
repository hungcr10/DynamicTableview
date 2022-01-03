//
//  HomeViewController.swift
//  DemoDynamicTableView
//
//  Created by CristianoDaoHung on 30/12/2021.
//

import UIKit

class HomeViewController: UIViewController {
    private var contactDatasources: [Model] = [Model(name: "Dao Hung", phone: "0917618517", avt: "hung"),
                                               Model(name: "Pham Toan", phone: "0917618517", avt: "toan"),
                                               Model(name: "Nam Phu", phone: "0917618517", avt: "kiet"),
                                               Model(name: "Van Kiet", phone: "0917618517", avt: "phu"),
                                               Model(name: "Anh Pham", phone: "0917618517", avt: "hoang"),
                                               Model(name: "Anh Tran", phone: "0917618517", avt: "kiet"),
                                               Model(name: "Bao Nam", phone: "0917618517", avt: "hung"),
                                               Model(name: "Bao Tin", phone: "0917618517", avt: "toan"),
                                               Model(name: "Giao Thuy", phone: "0917618517", avt: "phu"),
                                               Model(name: "Kha Le", phone: "0917618517", avt: "hoang"),
                                               Model(name: "Le Tin", phone: "0917618517", avt: "hung"),
                                               Model(name: "Nam Nguyen", phone: "0917618517", avt: "phu"),
                                               Model(name: "Mai Ho", phone: "0917618517", avt: "duy")]
    private var contactSections = [String]()
    private var contactDictionary = [String:[Model]] ()
    
    //MARK: - IBOutlet
    @IBOutlet weak var plusView: UIView!
    @IBOutlet weak var mainSearchBar: UISearchBar!
    @IBOutlet weak var mainTableView: UITableView!
    
}
//MARK: - sortContact
extension HomeViewController {
    private func sortContacts() {
        for contact in contactDatasources {
            let contactKey = String(contact.name.prefix(1))
            if var contactValues = contactDictionary[contactKey] {
                contactValues.append(contact)
                contactDictionary[contactKey] = contactValues
            } else {
                contactDictionary[contactKey] = [contact]
            }
        }
        contactSections = [String](contactDictionary.keys)
        contactSections = contactSections.sorted(by: { $0 < $1 })
    }
}
//MARK: - Life Cycle
extension HomeViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        registerTableViewCell()
        sortContacts()

    }
}

//MARK: - Setup viewDidLoad
extension HomeViewController {
    private func setUpView() {
        plusView.layer.cornerRadius = plusView.frame.height / 2
        mainTableView.sectionIndexColor = .systemGreen
        mainSearchBar.delegate = self
    }
    private func registerTableViewCell() {
        mainTableView.register(UINib(nibName: Contants.nibName, bundle: nil), forCellReuseIdentifier: Contants.identifier)
        mainTableView.dataSource = self
        mainTableView.delegate = self
    }
}

//MARK: - Add Button
extension HomeViewController {
    @IBAction func pressedAddBtn(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        self.present(picker, animated: true, completion: nil)
    }
}


////MARK: - DeleteCell
//extension HomeViewController {
//    private func deleteCell(at index: Int) {
//
//    }
//}
//MARK: - TableViewDataSource
extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return contactSections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let contactKey = contactSections[section]
        if let contactValues = contactDictionary[contactKey] {
            return contactValues.count
        }
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mainTableView.dequeueReusableCell(withIdentifier: Contants.identifier) as! HomeTableViewCell
        let contactKey = contactSections[indexPath.section]
        if let contactValues = contactDictionary[contactKey] {
            cell.avatarImgView.image = contactValues[indexPath.row].imageCovert
            cell.phoneLabel.text = contactValues[indexPath.row].phone
            cell.nameLabel.text = contactValues[indexPath.row].name
            cell.separatorInset = UIEdgeInsets(top: 0, left: 100, bottom: 0, right: 0)
        }
        return cell
    }
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return contactSections
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 15
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return contactSections[section].uppercased()
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let headerSection = view as! UITableViewHeaderFooterView
        headerSection.backgroundColor = .lightGray
        headerSection.textLabel?.textColor = .systemGreen
        headerSection.textLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
    }
    
}
//MARK: - TableViewDelegate
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        mainTableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        // pin
        let pinAction = UIContextualAction(style: .normal, title: "Pin") { action, view, completionHandler in
            completionHandler(true)
        }
        pinAction.image = UIImage(systemName: "pin.fill")
        pinAction.backgroundColor = .systemPurple
        // favorite
        let favoriteAction = UIContextualAction(style: .normal, title: "favorite") { action, view, completionHandler in
            completionHandler(true)
        }
        favoriteAction.image = UIImage(systemName: "star.fill")
        favoriteAction.backgroundColor = .systemPink
        // swipe action
        let swipeLeading = UISwipeActionsConfiguration(actions: [favoriteAction,pinAction])
        swipeLeading.performsFirstActionWithFullSwipe = false
        return swipeLeading
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        // delete
        let deleteAction = UIContextualAction(style: .normal, title: "Delete") { [self] action, view, completionHandler in
            completionHandler(true)
            if contactDictionary[contactSections[indexPath.section]]?.count == 1 {
                contactSections.remove(at: indexPath.section)
                self.mainTableView.deleteSections(NSIndexSet(index: indexPath.section) as IndexSet, with: .fade)
            } else {
                contactDictionary[contactSections[indexPath.section]]?.remove(at: indexPath.row)
                self.mainTableView.deleteRows(at: [indexPath], with: .automatic)
                
            }
            
        }
        deleteAction.image = UIImage(systemName: "trash.fill")
        deleteAction.backgroundColor = .red
        
        // message
        let messageAction = UIContextualAction(style: .normal, title: "Message") { action, view, completionHandler in
            completionHandler(true)
        }
        messageAction.image = UIImage(systemName: "message.fill")
        messageAction.backgroundColor = .systemYellow
        
        // videocall
        let videoCallAction = UIContextualAction(style: .normal, title: "Video Call") { action, view, completionHandler in
            completionHandler(true)
        }
        videoCallAction.image = UIImage(systemName: "video.fill")
        videoCallAction.backgroundColor = .systemBlue
        // more
        let moreAction = UIContextualAction(style: .normal, title: "More") { action, view, completionHandler in
            completionHandler(true)
        }
        moreAction.image = UIImage(systemName: "ellipsis")
        moreAction.backgroundColor = .systemGray
        // swipe action
        let swipeTrailing = UISwipeActionsConfiguration(actions: [moreAction, deleteAction, messageAction,videoCallAction])
        swipeTrailing.performsFirstActionWithFullSwipe = false
        return swipeTrailing
    }
}

//MARK:  - ImgaePicker
extension HomeViewController : UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    // show picker image when click button
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else
        { return }
        picker.dismiss(animated: true, completion: nil)
        var beetweenTextField = UITextField()
        var medialTextField = UITextField()
        let alert = UIAlertController(title: "Add Contact", message: "Please add new contact", preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "Please enter new name..."
            beetweenTextField = textField
        }
        alert.addTextField { textField in
            textField.placeholder = "Please enter new phone..."
            medialTextField = textField
        }
        let doneAction = UIAlertAction(title: "Add", style: .default) {_ in
            guard let nameText = beetweenTextField.text else {return}
            guard let phoneText = medialTextField.text else {return}
            if nameText.isEmpty == false && phoneText.isEmpty == false {
                self.contactDatasources.append(Model(name: nameText, phone: phoneText, avt: image.toPngString()!))
                self.mainTableView.reloadData()
            }
         
        }
        let cancelAction = UIAlertAction(title: "Done", style: .cancel, handler: nil)
        alert.addAction(doneAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    
}
extension UIImage {
    func toPngString() -> String? {
        let data = self.pngData()
        return data?.base64EncodedString(options: .endLineWithLineFeed)
    }
}
//MARK: - searchbar delegate
extension HomeViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchBar.text = ""
        
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 {
            searchBar.resignFirstResponder()
        }
        
    }
}
