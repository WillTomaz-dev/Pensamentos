//
//  QuotesViewController.swift
//  Pensamentos
//
//  Created by William Tomaz on 25/05/20.
//  Copyright © 2020 William Tomaz. All rights reserved.
//

import UIKit

class QuotesViewController: UIViewController {

    @IBOutlet weak var ivPhoto: UIImageView!
    @IBOutlet weak var ivPhotoBackground: UIImageView!
    @IBOutlet weak var lbQuotes: UILabel!
    @IBOutlet weak var lbAuthor: UILabel!
    @IBOutlet weak var lcTop: NSLayoutConstraint!
    
    let quotesManager = QuotesManager()
    var timer: Timer?
    
    let config = Configuration.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "Refresh"), object: nil, queue: nil) { (notification) in
            
            self.formatView()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        prepareQuote()
        formatView()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        formatView()
        prepareQuote()
    }
    
    func prepareQuote() {
        timer?.invalidate()// invalida o agendamento anterior/ qualquer execução ja acionada
        if config.autorefresh {
         timer = Timer.scheduledTimer(withTimeInterval: config.timeInterval, repeats: true) { (timer) in
            self.showRandomQuote() }
            }
        showRandomQuote()
        }
    
    
    func showRandomQuote() {
        let quote = quotesManager.getRandomQuote()
        lbQuotes.text = quote.quote
        lbAuthor.text = quote.author
        ivPhoto.image = UIImage(named: quote.image)
        ivPhotoBackground.image = ivPhoto.image
        
        lbQuotes.alpha = 0.0
        lbAuthor.alpha = 0.0
        ivPhoto.alpha = 0.0
        ivPhotoBackground.alpha = 0.0
        lcTop.constant = 50
        view.layoutIfNeeded()
        
        UIView.animate(withDuration: 2.5){
            self.lbQuotes.alpha = 1.0
            self.lbAuthor.alpha = 1.0
            self.ivPhoto.alpha = 1.0
            self.ivPhotoBackground.alpha = 0.25
            self.lcTop.constant = 10
            self.view.layoutIfNeeded()
        }
    }
    
    func formatView(){
        view.backgroundColor = config.colorScheme == 0 ? .white : UIColor(red: 156.0/255.0, green: 68/255, blue: 15/255, alpha: 1.0)
        lbQuotes.textColor = config.colorScheme == 0 ? .black : .white
        lbAuthor.textColor = config.colorScheme == 0 ? UIColor(red: 192.0/255.0, green: 96/255, blue: 49/255, alpha: 1.0) : .yellow
    }
}
