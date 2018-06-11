//
//  EmojiTableViewController.swift
//  EmojiDictionary
//
//  Created by john goure on 5/21/18.
//  Copyright © 2018 john goure. All rights reserved.
//

import UIKit

class EmojiTableViewController: UITableViewController {
    
    var smileysPeople: [Emoji] = [
        Emoji("😀", "Grinning Face", "A typical smiley face.", "happiness"),
        Emoji("😕", "Confused Face", "A confused, puzzled face.", "unsure what to think; displeasure"),
        Emoji("😍", "Heart Eyes", "A smiley face with hearts for eyes.", "love of something; attractive"),
        Emoji("👮", "Police Officer", "A police officer wearing a blue cap with a gold badge.", "person of authority")
    ]
    var animalsNature: [Emoji] = [
        Emoji("🐢", "Turtle", "A cute turtle.", "Something slow"),
        Emoji("🐘", "Elephant", "A grey elephant.", "good memory"),
    ]
    var foodDrink: [Emoji] = [
        Emoji("🍝", "Spaghetti", "A plate of spaghetti.", "spaghetti")
    ]
    var activity: [Emoji] = [
        Emoji("⛺️", "Tent", "A small tent.", "camping"),
        Emoji("🎲", "Die", "A single die.", "taking a risk, change; game"),
        Emoji("📚", "Stack of Books", "Three colored books stacked on each other.", "homework, studying")
    ]
    var symbols: [Emoji] = [
        Emoji("💔", "Broken Heart", "A red, broken heart.", "extreme"),
        Emoji("💤", "Snore", "Three blue \'z\'s", "tired, sleepiness")
    ]
    var flags: [Emoji] = [
        Emoji("🏁", "Checkered Flag", "A black-and-white checkered flag.", "completion")
    ]
    
    var emojis: [[Emoji]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.leftBarButtonItem = self.editButtonItem
        self.emojis.append(self.smileysPeople)
        self.emojis.append(self.animalsNature)
        self.emojis.append(self.foodDrink)
        self.emojis.append(self.activity)
        self.emojis.append(self.symbols)
        self.emojis.append(self.flags)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func editButtonTapped(_ sender: Any) {
        let tableViewEditingMode = tableView.isEditing
        tableView.setEditing(!tableViewEditingMode, animated: true)
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return emojis[0].count
        } else if section == 1 {
            return emojis[1].count
        } else if section == 2 {
            return emojis[2].count
        } else if section == 3 {
            return emojis[3].count
        } else if section == 4 {
            return emojis[4].count
        } else if section == 5 {
            return emojis[5].count
        } else {
            return 0
        }
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection: Int) -> String? {
        switch titleForHeaderInSection {
        case 0:
            return "Smileys and People"
        case 1:
            return "Animals and Nature"
        case 2:
            return "Food and Drink"
        case 3:
            return "Activity"
        case 4:
            return "Symbols"
        case 5:
            return "Flags"
        default:
            return nil
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiCell", for: indexPath) as! EmojiTableViewCell
        
        let emoji = emojis[indexPath.section][indexPath.row]
        cell.update(with: emoji)
        cell.showsReorderControl = true

        return cell
    }
    
    @IBAction func refreshControlActivated(_ sender: UIRefreshControl) {
        tableView.reloadData()
        sender.endRefreshing()
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .delete
    }

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let moveEmoji = emojis[fromIndexPath.section].remove(at: fromIndexPath.row)
        emojis[fromIndexPath.section].insert(moveEmoji, at: to.row)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            emojis[indexPath.section].remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    
    
    @IBAction func unwindToEmojiTableView(segue: UIStoryboardSegue) {
        guard segue.identifier == "saveUnwind" else {return}
        let sourceViewController = segue.source as! AddEditEmojiTableViewController
        
        if let emoji = sourceViewController.emoji {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                emojis[selectedIndexPath.section][selectedIndexPath.row] = emoji
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            } else {
                let newIndexPath = IndexPath(row: emojis[0].count, section: 0)
                emojis[0].append(emoji)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "EditEmoji" {
            let indexPath = tableView.indexPathForSelectedRow!
            let emoji = emojis[indexPath.section][indexPath.row]
            let addEditEmojiTableViewController = segue.destination as! AddEditEmojiTableViewController
            addEditEmojiTableViewController.emoji = emoji
        }
    }

}
