//
//  NotesViewController.swift
//  BreakingBad
//
//  Created by Zeynep Baştuğ on 2.12.2022.
//

import UIKit

class NotesViewController: UIViewController, NewNoteViewDelegate {
   

    @IBOutlet weak var noteTableView: UITableView!
    
    var noteView:NewNoteView?
    
    var service:ServiceOperations = ServiceOperations()
    
    private let floatingButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 30
        
        let image = UIImage (systemName: "plus", withConfiguration: UIImage.SymbolConfiguration(pointSize: 32, weight: .medium))
        button.setImage(image, for: .normal)
        return button
    }()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        floatingButton.frame = CGRect(x: noteTableView.frame.size.width-60, y: noteTableView.frame.size.width, width: 60, height: 60)
    }
    
    
    var notes:[Notes] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noteTableView.dataSource = self
        noteTableView.delegate = self
        noteTableView.addSubview(floatingButton)
        noteView = NewNoteView()
        noteView?.isHidden = true
        noteTableView.addSubview(noteView!)
        floatingButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        notes = CoreDataManager.shared.getNotes()
     
    }
    
    @objc private func didTapButton(){
        let newNoteView = NewNoteView(frame: CGRect(origin: CGPointMake(view.center.x - 200, view.center.y - 100), size: CGSize(width: 400, height: 400)))
        newNoteView.alpha = 0
        UIView.animate(withDuration: 2.0) {
            newNoteView.alpha = 1
        }
        newNoteView.delegate = self
        view.addSubview(newNoteView)
    }
    
    
}
 

extension NotesViewController:UITableViewDataSource, UITableViewDelegate {
    func savePressed(note: String, season:String, episode:String) {
        notes.append(CoreDataManager.shared.saveNote(text: note, episode: episode, season: season)!)
        noteTableView.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath) as! NoteTableViewCell
        
        cell.season.text = notes[indexPath.row].season
        cell.episode.text = notes[indexPath.row].episode
        cell.note.text = notes[indexPath.row].noteText
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newNoteView = NewNoteView(frame: CGRect(origin: CGPointMake(view.center.x - 200, view.center.y - 100), size: CGSize(width: 400, height: 400)))
        newNoteView.alpha = 0
        UIView.animate(withDuration: 2.0) {
            newNoteView.alpha = 1
        }
        newNoteView.episodeTextField.text = notes[indexPath.row].episode
        newNoteView.seasonTextField.text = notes[indexPath.row].season
        newNoteView.noteTextView.text = notes[indexPath.row].noteText
        newNoteView.delegate = self
        view.addSubview(newNoteView)
    }
    
    
    
}
