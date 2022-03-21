//
//  FeedViewController.swift
//  immi
//
//  Created by user217004 on 3/19/22.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    ///MARK: - Properties
    private let tableView : UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    private var sections = [Section]()
    var safeArea : UILayoutGuide!
    
    //this postButton is in the tabbarviewcontroller as it will show up in all the controllers
    let postButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.backgroundColor = .cyan
        button.setImage(UIImage(systemName: "message"), for:.normal)
        button.addTarget(self,action:#selector(postButtonTapped), for: .touchUpInside)
        return button
    }()
    
    //MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.frame = view.bounds
        view.backgroundColor = .white
        safeArea = view.layoutMarginsGuide
        configureUI()
        setupTableView()
        assignData()
        addPostButton()
        
    }
    
    
    
    private func assignData() {
        
        sections = [Section(title: "Immigration to Canada", items:[1,2,3].compactMap({return "Cell \($0)"})),
                   Section(title: "Moving to Canada From US", items:[1,2,3].compactMap({return "Cell \($0)"})),
                    Section(title: "Settlement in Canada", items:[1,2,3].compactMap({return "Cell \($0)"})),
                    Section(title: "Working in Canada", items:[1,2,3].compactMap({return "Cell \($0)"})),
                    Section(title: "Canada Visa Office", items:[1,2,3].compactMap({return "Cell \($0)"})),
                    Section(title: "Studying in Canada", items:[1,2,3].compactMap({return "Cell \($0)"})),
                    Section(title: "Temporary Entry to Canada", items:[1,2,3].compactMap({return "Cell \($0)"}))        ]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = sections[section]
        
        if section.isHidden {
            return 1
        }else{
            return section.items.count + 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if indexPath.row == 0 {
            cell.textLabel?.text = sections[indexPath.section].title
            cell.backgroundColor = .red
        }else{
            cell.textLabel?.text = sections[indexPath.section].items[indexPath.row-1]
            
        }
        return cell
        }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("tapped section title")
        if indexPath.row == 0 {
            sections[indexPath.section].isHidden = !sections[indexPath.section].isHidden
            tableView.reloadSections([indexPath.section], with: .none)
        }else{
            print("tapped sub cell")
        }
    }
    
    //MARK: - Selectors
    @objc func postButtonTapped() {
        print(123)
    }
       
    //MARK: - Helpers
    
    func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo:view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
    }
    func configureUI() {
        
        let imageLogo = UIImageView(image: UIImage(systemName: "location"))
        imageLogo.tintColor = .purple
        navigationItem.titleView = imageLogo
    }
    
    func addPostButton(){
        view.addSubview(postButton)
        postButton.translatesAutoresizingMaskIntoConstraints = false
        postButton.heightAnchor.constraint(equalToConstant: 56).isActive = true
        postButton.widthAnchor.constraint(equalToConstant:56).isActive = true
        postButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant:-64).isActive = true
        //safeAreaLayoutGuide anchors the button for iphones of all sizes
        postButton.rightAnchor.constraint(equalTo: view.rightAnchor,constant:-16).isActive = true
        postButton.layer.cornerRadius = 56 / 2
        
    }}



