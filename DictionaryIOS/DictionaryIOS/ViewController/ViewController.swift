//
//  ViewController.swift
//  DictionaryIOS
//
//  Created by SSD on 6/1/17.
//  Copyright © 2017 SSD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTutorial()
        label.text = NSLocalizedString("common_cancel_button", comment: "")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController {
//    - (void)loadTutorials {
//    // 1
//    NSURL *tutorialsUrl = [NSURL URLWithString:@"http://www.raywenderlich.com/tutorials"];
//    NSData *tutorialsHtmlData = [NSData dataWithContentsOfURL:tutorialsUrl];
//    
//    // 2
//    TFHpple *tutorialsParser = [TFHpple hppleWithHTMLData:tutorialsHtmlData];
//    
//    // 3
//    NSString *tutorialsXpathQueryString = @"//div[@class='content-wrapper']/ul/li/a";
//    NSArray *tutorialsNodes = [tutorialsParser searchWithXPathQuery:tutorialsXpathQueryString];
//    
//    // 4
//    NSMutableArray *newTutorials = [[NSMutableArray alloc] initWithCapacity:0];
//    for (TFHppleElement *element in tutorialsNodes) {
//    // 5
//    Tutorial *tutorial = [[Tutorial alloc] init];
//    [newTutorials addObject:tutorial];
//    
//    // 6
//    tutorial.title = [[element firstChild] content];
//    
//    // 7
//    tutorial.url = [element objectForKey:@"href"];
//    }
//    
//    // 8
//    _objects = newTutorials;
//    [self.tableView reloadData];
//    }
    func loadTutorial(){
       let tutorialURL = URL(string: "http://www.oxfordlearnersdictionaries.com/definition/english/noise?q=noise")
            //let tutorialURL = URL(string: "https://www.raywenderlich.com/tutorials")
        do {
            let data = try Data(contentsOf: tutorialURL!)
            let totorialParse = TFHpple(htmlData: data)
            
//            3
            //root: //div[@class='entry']/ol[@class='h-g']
            //title: //div[@class='entry']/ol[@class='h-g']/div[@class='top-container']/div[@class='top-g']/div[@class='webtop-g']/h2[@class='h']
            // title: //div[@class='entry']/ol[@class='h-g']/div[@class='top-container']//h2[@class='h']
            //tl: //div[@class='entry']/ol[@class='h-g']/div[@class='top-container']//div[@class='webtop-g']//span[@class='pos']
            /*phiên âm: //div[@class='entry']/ol[@class='h-g']/div[@class='top-container']//span[@class='pron-g']//span[@class='phon']
             for element in tutorialsNodes! {
             print(((element as! TFHppleElement).children[3] as! TFHppleElement).content)
             }
            */
            
            /*Mô tả từ, chỗ chìa khóa://div[@class='entry']/ol[@class='h-g']/span[@class='sn-gs']/li[@class='sn-g']/span[@class='def']
             Chỗ này lấy theo cụm sau đó mới lấy ra từ từ để tạo model
             //div[@class='entry']/ol[@class='h-g']/span[@class='sn-gs']/li[@class='sn-g']
             
             // get des
             for element1 in (element as! TFHppleElement).children {
             if (element1 as! TFHppleElement).object(forKey: "class") != nil && "def" == (element1 as! TFHppleElement).object(forKey: "class") {
             print((element1 as! TFHppleElement).firstChild.content)
             }
             }
             */
            let tutorialsXpathQueryString = "//div[@class='entry']/ol[@class='h-g']/div[@class='top-container']//span[@class='pron-g']//span[@class='phon']"
            //let tutorialsXpathQueryString = "//div[@class='content-wrapper']/ul/li/a"
            let tutorialsNodes = totorialParse?.search(withXPathQuery: tutorialsXpathQueryString)
            
//4
            for element in tutorialsNodes! {
                print(((element as! TFHppleElement).children[3] as! TFHppleElement).content)
            }
        } catch _ {
            
        }
        
        
        //let tutorialsHtmlData = NSData(dataW)
    }
}
