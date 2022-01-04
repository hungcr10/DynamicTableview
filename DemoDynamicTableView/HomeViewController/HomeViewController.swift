//
//  HomeViewController.swift
//  DemoDynamicTableView
//
//  Created by CristianoDaoHung on 30/12/2021.
//

import UIKit
class HomeViewController: UIViewController {

    private var contactSections = [String]()
    private var contactDictionary = [String:[Contact]]()
    private var displayContactDictionary = [String:[Contact]]()
    //MARK: - IBOutlet
    @IBOutlet weak var plusView: UIView!
    @IBOutlet weak var mainSearchBar: UISearchBar!
    @IBOutlet weak var mainTableView: UITableView!
}
//MARK: - sortContact
extension HomeViewController {
    private func sortContacts(modelArr: [Contact]) {
        contactDictionary.removeAll()
        for contact in modelArr {
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
        displayContactDictionary = contactDictionary
    }
}
//MARK: - Life Cycle
extension HomeViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        registerTableViewCell()
        sortContacts(modelArr: contactDatasources)
    }
}

//MARK: - Helper
extension HomeViewController {
    private func setUpView() {
        plusView.layer.cornerRadius = plusView.frame.height / 2
        mainTableView.sectionIndexColor = .systemGreen
    }
    private func registerTableViewCell() {
        mainTableView.register(UINib(nibName: Contants.nibName, bundle: nil), forCellReuseIdentifier: Contants.identifier)
        mainTableView.dataSource = self
        mainTableView.delegate = self
        mainSearchBar.delegate = self
    }
}

//MARK: - Add Button
extension HomeViewController {
    @IBAction func pressedAddBtn(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }
}
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
            cell.configure(with: contactValues[indexPath.row])
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
        let pinAction = UIContextualAction(style: .normal, title: "") { action, view, completionHandler in
            completionHandler(true)
        }
        pinAction.image = UIImage(systemName: CellActionImage.pinImg)
        pinAction.backgroundColor = .systemPurple
        // favorite
        let favoriteAction = UIContextualAction(style: .normal, title: "") { action, view, completionHandler in
            completionHandler(true)
        }
        favoriteAction.image = UIImage(systemName: CellActionImage.favoriteImg)
        favoriteAction.backgroundColor = .systemPink
        // swipe action
        let swipeLeading = UISwipeActionsConfiguration(actions: [favoriteAction,pinAction])
        swipeLeading.performsFirstActionWithFullSwipe = false
        return swipeLeading
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        // delete
        let deleteAction = UIContextualAction(style: .normal, title: "") { [self] action, view, completionHandler in
            completionHandler(true)
            if contactDictionary[contactSections[indexPath.section]]?.count == 1 {
                contactSections.remove(at: indexPath.section)
                self.mainTableView.deleteSections(NSIndexSet(index: indexPath.section) as IndexSet, with: .fade)
            } else {
                self.contactDictionary[contactSections[indexPath.section]]?.remove(at: indexPath.row)
                mainTableView.beginUpdates()
                mainTableView.deleteRows(at: [indexPath], with: .automatic)
                mainTableView.endUpdates()
            }
        }
        deleteAction.image = UIImage(systemName: CellActionImage.trashImg)
        deleteAction.backgroundColor = .red
        
        // message
        let messageAction = UIContextualAction(style: .normal, title: "") { action, view, completionHandler in
            completionHandler(true)
        }
        messageAction.image = UIImage(systemName: CellActionImage.messageImg)
        messageAction.backgroundColor = .systemYellow
        
        // videocall
        let videoCallAction = UIContextualAction(style: .normal, title: "") { action, view, completionHandler in
            completionHandler(true)
        }
        videoCallAction.image = UIImage(systemName: CellActionImage.videoCallImg)
        videoCallAction.backgroundColor = .systemBlue
        // more
        let moreAction = UIContextualAction(style: .normal, title: "") { action, view, completionHandler in
            completionHandler(true)
        }
        moreAction.image = UIImage(systemName: CellActionImage.moreImg)
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
        let doneAction = UIAlertAction(title: "Add", style: .default) { [self]_ in
            guard let nameText = beetweenTextField.text else {return}
            guard let phoneText = medialTextField.text else {return}
            if nameText.isEmpty == false && phoneText.isEmpty == false {
                //MARK: - Fix
                // lấy được section-> check lấy row->add
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
        let filterd = contactDatasources.filter({ $0.name.contains(searchBar.text!.uppercased())})
        sortContacts(modelArr: filterd)
        mainTableView.reloadData()
        searchBar.resignFirstResponder()
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 {
            sortContacts(modelArr: contactDatasources)
            mainTableView.reloadData()
            searchBar.resignFirstResponder()
        }
    }
}
