import UIKit
import Contacts

class ViewController: UIViewController {
    
    //MARK: - Properties
    @IBOutlet weak var myTableView: UITableView!
    var itemTitleData = ["Persija", "Persebaya", "Persib", "Persipura", "Arema"]
    var itemDetailData = ["Persatuan Sepak Bola Indonesia Jakarta", "Persatuan Sepak Bola Surabaya", "Persatuan Sepak Bola Indonesia Bandung", "Persatuan Sepak Bola Indonesia Jayapura", "Arema Malang"]
    var cellId = "customTableViewCell"
    var fetchedContacts = [FetchedContact]()
    var nameImage = ""
    var nameLogo = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: cellId)
        fetchingContact()
        self.myTableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchingContact()
        self.myTableView.reloadData()
    }
    
    //MARK: - Fecthing Contact
    func fetchingContact(){
        let store = CNContactStore()
        store.requestAccess(for: .contacts) { (granted, error) in
            if let error = error {
                print("Request Contact Access Failed, \(error)")
                return
            }
            
            if granted {
                let keys = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey]
                let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])
                do{
                    try store.enumerateContacts(with: request, usingBlock: { (contact, pointer) in
                        self.fetchedContacts.append(FetchedContact(firstName: contact.givenName, lastName: contact.familyName, telephone: contact.phoneNumbers.first?.value.stringValue ?? ""))
                    })
                } catch {
                    print("Failed Processing Contact \(error)")
                }
                self.myTableView.reloadData()
            } else {
                print("Access Denied")
            }
        }
        
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemTitleData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCustomCell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CustomTableViewCell
        myCustomCell.initCustomCell(image: "logo_\(indexPath.row)", item: itemTitleData[indexPath.row], detail: itemDetailData[indexPath.row])
        return myCustomCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.nameImage = "image_\(indexPath.row)"
        self.nameLogo = "logo_\(indexPath.row)"
        
        NotificationCenter.default.post(name: NotificationTopic.notificationBroadcast, object: nil, userInfo: ["imageName": nameImage, "logoName": nameLogo])
    }
}
