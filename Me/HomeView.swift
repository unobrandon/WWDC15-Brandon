//
//  HomeView.swift
//  Me
//
//  Created by Brandon Shaw on 4/20/15.
//  Copyright (c) 2015 Brandon Shaw. All rights reserved.
//

import UIKit

class HomeView: UIViewController, UIScrollViewDelegate {
    
    var scrollView: UIScrollView!
    var scrollIf = false
    var containerView = UIView()
    var topBar = UIView(frame: CGRectMake(0, -75, UIScreen.mainScreen().bounds.width, 90))
    var nameLable: UILabel = UILabel()
    var miniImage: UIImageView = UIImageView()
    var topblue = UIView(frame: CGRectMake(0, -447, UIScreen.mainScreen().bounds.width, 930))
    
    
    
    //all you have to do is make a certificate,  an app id, provisioning profile, download the profile and run the app like if you have ever run an app on your phone you have already signed it
    
    
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        //Shake anamation
        // let shake = POPSpringAnimation(propertyNamed: kPOPLayerPosition)
        // shake.springBounciness = 15
        // shake.velocity = NSNumber(int: 1500)
        // self.icon.layer.pop_addAnimation(shake, forKey: "bounceDownIcon")
        
        
        //Screen Size Adjustments
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        //-----------SECTION 1 (Home View) --------------------------------------
        
        
        //Making top blue
        topblue.backgroundColor = UIColorFromRGB(0x00355d)
        
        //Background Image View Section1
        let imageName = "TXwheel.png"
        let image = UIImage(named: imageName)
        let imageView1 = UIImageView(image: image)
        imageView1.contentMode = .ScaleAspectFit
        // imageView.backgroundColor = UIColorFromRGB(0x000000)
        imageView1.frame = CGRect(x: 0, y: topblue.bounds.height - 1105, width: screenWidth, height: screenHeight + 855)
        
        
        //Anamation For Profile Picture
        let trans = POPSpringAnimation(propertyNamed: kPOPLayerTranslationXY)
        trans.toValue = NSValue(CGPoint: CGPointMake(0, 50))
        trans.fromValue = NSValue(CGPoint: CGPointMake(0, -100))
        trans.springSpeed = 5
        trans.springBounciness = 10
        
        //Adding Profile Picture Image
        let proPic = "BrandonFlat.png"
        let thePic = UIImage(named: proPic)
        let profilePicture = UIImageView(image: thePic)
        profilePicture.frame = CGRect(x: screenWidth / 3, y: 50, width: 120, height: 120)
        profilePicture.layer.pop_addAnimation(trans, forKey: "Translation")
        
        /*
        var devProjects = UIButton.buttonWithType(UIButtonType.System) as UIButton
        devProjects.frame = CGRectMake(10, 50, 110, 35)
        devProjects.backgroundColor = UIColor.clearColor()
        devProjects.layer.cornerRadius = 15.0;
        devProjects.layer.borderColor = UIColor.whiteColor().CGColor
        devProjects.tintColor = UIColor.whiteColor()
        devProjects.layer.borderWidth = 1.5
        devProjects.setTitle("Dev Projects", forState: UIControlState.Normal)
        devProjects.addTarget(self, action: "devProjects", forControlEvents: UIControlEvents.TouchUpInside)
        
        var education  = UIButton.buttonWithType(UIButtonType.System) as UIButton
        education.frame = CGRectMake(devProjects.frame.width + 20, 50, 110, 35)
        education.backgroundColor = UIColor.clearColor()
        education.layer.cornerRadius = 15.0;
        education.layer.borderColor = UIColor.whiteColor().CGColor
        education.tintColor = UIColor.whiteColor()
        education.layer.borderWidth = 1.5
        education.setTitle("Education", forState: UIControlState.Normal)
        education.addTarget(self, action: "funn:", forControlEvents: UIControlEvents.TouchUpInside)
        
        var techSkills  = UIButton.buttonWithType(UIButtonType.System) as UIButton
        techSkills.frame = CGRectMake(education.frame.width + devProjects.frame.width + 30, 50, 110, 35)
        techSkills.backgroundColor = UIColor.clearColor()
        techSkills.layer.cornerRadius = 15.0;
        techSkills.layer.borderColor = UIColor.whiteColor().CGColor
        techSkills.tintColor = UIColor.whiteColor()
        techSkills.layer.borderWidth = 1.5
        techSkills.setTitle("Skills", forState: UIControlState.Normal)
        techSkills.addTarget(self, action: "skills1:", forControlEvents: UIControlEvents.TouchUpInside)
        */
        
        //Adding main hello lable
        var hello: UITextView = UITextView()
        hello.frame = CGRectMake(screenWidth * 0.001, -75, screenWidth, 400)
        hello.backgroundColor = UIColor.clearColor()
        hello.textColor = UIColor.whiteColor()
        hello.textAlignment = NSTextAlignment.Center
        hello.font = UIFont (name: "Avenir Heavy", size: 30)
        hello.text = "Hello, \r I am Brandon Shaw."
        
        //Adding where I am from label
        var from: UITextView = UITextView()
        from.frame = CGRectMake(screenWidth * 0.001, -75, screenWidth, 400)
        
        from.backgroundColor = UIColor.clearColor()
        from.textColor = UIColor.whiteColor()
        from.textAlignment = NSTextAlignment.Center
        from.font = UIFont (name: "HelveticaNeue-Light", size: 25)
        from.text = "I am from \r Dallas, Texas"
        
        //Anamation for the main Hello lable
        let moveHello = POPSpringAnimation(propertyNamed: kPOPLayerTranslationXY)
        moveHello.toValue = NSValue(CGPoint: CGPointMake(0, 300))
        moveHello.fromValue = NSValue(CGPoint: CGPointMake(0, -30))
        moveHello.springSpeed = 6
        moveHello.springBounciness = 10
        hello.layer.pop_addAnimation(moveHello, forKey: "moveHello")
        
        
        //Anamation for the main Hello lable
        let moveFrom = POPSpringAnimation(propertyNamed: kPOPLayerTranslationXY)
        moveFrom.toValue = NSValue(CGPoint: CGPointMake(0, 415))
        moveFrom.fromValue = NSValue(CGPoint: CGPointMake(0, -30))
        moveFrom.springSpeed = 7
        moveFrom.springBounciness = 14
        from.layer.pop_addAnimation(moveFrom, forKey: "moveHello")
        
        //-----------SECTION 2 --------------------------------------
        
        //Adding App store lable
        var appstore: UITextView = UITextView()
        appstore.frame = CGRectMake(screenWidth * 0.001, 765, screenWidth, 450)
        appstore.backgroundColor = UIColor.clearColor()
        appstore.textColor = UIColor.blackColor()
        appstore.textAlignment = NSTextAlignment.Center
        appstore.font = UIFont (name: "Avenir", size: 20)
        appstore.text = "July 10th, 2008 the App Store \r was announced. I was interested in \r the technology, so I gathered up all my saved money to buy a Mac Mini."
        
        //Adding macMini Image
        let miniPicture = "experience.png"
        let theMini = UIImage(named: miniPicture)
        let macMini = UIImageView(image: theMini)
        macMini.contentMode = .ScaleAspectFit
        macMini.frame = CGRect(x: screenWidth / 2.5, y: 915, width: 80 , height: 80)
        
        var grayArea = UIView(frame: CGRectMake(0, 700, UIScreen.mainScreen().bounds.width, 380))
        grayArea.backgroundColor = UIColorFromRGB(0xE9E9E9)
        
        //-----------SECTION 3 --------------------------------------
        
        //Adding the pen Image
        let penPic = "pen.png"
        let picPen = UIImage(named: penPic)
        let pen = UIImageView(image: picPen)
        pen.contentMode = .ScaleAspectFit
        pen.frame = CGRect(x: screenWidth * 0.77, y: 1120, width: 80 , height: 80)
        
        //Adding Bio Start lable
        var startCoding: UITextView = UITextView()
        startCoding.frame = CGRectMake(screenWidth  - 420, 1105, screenWidth, 450)
        startCoding.backgroundColor = UIColor.clearColor()
        startCoding.textColor = UIColor.blackColor()
        startCoding.textAlignment = NSTextAlignment.Center
        startCoding.font = UIFont (name: "Avenir", size: 22)
        startCoding.text = "At just 13 years old, \rI started to learn how \rto write in Objective-C."
        
        //Adding the background coding image
        let bgCoding = "coding.jpg"
        let code = UIImage(named: bgCoding)
        let codePictre = UIImageView(image: code)
        codePictre.contentMode = .ScaleAspectFit
        codePictre.frame = CGRect(x: 0, y: 885, width: screenWidth , height: 800)
        
        //-----------SECTION 4 --------------------------------------
        
        //Adding the icon for the Growing Tree app
        let iconG = "growingTree.jpeg"
        let growing = UIImage(named: iconG)
        let iconGrowing = UIImageView(image: growing)
        iconGrowing.contentMode = .ScaleAspectFit
        iconGrowing.frame = CGRect(x: screenWidth / 2.5, y: 1575, width: 70 , height: 70)
        
        //Adding Growing Tree Label Bio
        var growingTree: UITextView = UITextView()
        growingTree.frame = CGRectMake(screenWidth * 0.001, 1640, screenWidth, 450)
        growingTree.backgroundColor = UIColor.clearColor()
        growingTree.textColor = UIColor.blackColor()
        growingTree.textAlignment = NSTextAlignment.Center
        growingTree.font = UIFont (name: "Avenir", size: 22)
        growingTree.text = "I soon then released my first app called “Growing Tree” when I was just 14 years old."
        
        //-----------SECTION 5 --------------------------------------
        
        
        //Adding the icon for Solo Drumming app
        let iconS = "DrumIcon512x512.png"
        let solo = UIImage(named: iconS)
        let soloDrum = UIImageView(image: solo)
        soloDrum.contentMode = .ScaleAspectFit
        soloDrum.frame = CGRect(x: screenWidth * 0.73, y: 1800, width: 90 , height: 90)
        
        //Adding Solo Drumming Label
        var soloDrumming: UITextView = UITextView()
        soloDrumming.frame = CGRectMake(10, 1756, 250, 450)
        soloDrumming.backgroundColor = UIColor.clearColor()
        soloDrumming.textColor = UIColor.blackColor()
        soloDrumming.textAlignment = NSTextAlignment.Center
        soloDrumming.font = UIFont (name: "Thonburi", size: 22)
        soloDrumming.text = "Soon after, I then released second app called “Solo Drumming” around February of 2010, at age 14."
        
        //Adding background color for section
        var grayArea2 = UIView(frame: CGRectMake(0, 1750, UIScreen.mainScreen().bounds.width, 220))
        grayArea2.backgroundColor = UIColorFromRGB(0xE9E9E9)
        
        //-----------SECTION 6 --------------------------------------
        
        //Adding the app icon for Zii
        let iconZ = "Zii.jpg"
        let Zii = UIImage(named: iconZ)
        let ZiiImage = UIImageView(image: Zii)
        ZiiImage.contentMode = .ScaleAspectFit
        ZiiImage.frame = CGRect(x: screenWidth / 2.5, y: 2100, width: 70 , height: 70)
        
        //Adding Zii Label
        var ZiiText: UITextView = UITextView()
        ZiiText.frame = CGRectMake(screenWidth * 0.001, 1990, screenWidth, 450)
        ZiiText.backgroundColor = UIColor.clearColor()
        ZiiText.textColor = UIColor.blackColor()
        ZiiText.textAlignment = NSTextAlignment.Center
        ZiiText.font = UIFont (name: "Thonburi", size: 22)
        ZiiText.text = "The same year I released a third app called “Zii” around December of 2010 at age 15."
        
        //-----------SECTION 7 --------------------------------------
        
        //Adding the background 70KFT internship image
        let bg70 = "70kftBG.png"
        let intern = UIImage(named: bg70)
        let devIntern = UIImageView(image: intern)
        devIntern.contentMode = .ScaleAspectFill
        devIntern.frame = CGRect(x: 0, y: 1960, width: screenWidth , height: 300)
        
        //Adding 70kft internship Label
        var internText: UITextView = UITextView()
        internText.frame = CGRectMake(screenWidth * 0.001, 2000, screenWidth, 450)
        internText.backgroundColor = UIColor.clearColor()
        internText.textColor = UIColor.whiteColor()
        internText.textAlignment = NSTextAlignment.Center
        internText.font = UIFont (name: "Thonburi", size: 22)
        internText.text = " I had an amazing opportunity to have an internship at 70kft during the summer of 2013 under the development team."
        
        //Adding 70kft internship Label
        var nameIntern: UITextView = UITextView()
        nameIntern.frame = CGRectMake(screenWidth * 0.001, 2140, screenWidth, 450)
        nameIntern.backgroundColor = UIColor.clearColor()
        nameIntern.textColor = UIColor.whiteColor()
        nameIntern.textAlignment = NSTextAlignment.Center
        nameIntern.font = UIFont (name: "Helvetica-Bold", size: 55)
        nameIntern.text = "70kft"
        
        //-----------SECTION 8 --------------------------------------
        
        //Adding the icon for the Growing Tree app
        let iconJ = "JJ.png"
        let JJ = UIImage(named: iconJ)
        let jumpyJet = UIImageView(image: JJ)
        jumpyJet.contentMode = .ScaleAspectFit
        jumpyJet.frame = CGRect(x: screenWidth / 2.5, y: 2300, width: 90 , height: 90)
        
        //Adding Growing Tree Label Bio
        var JummpyLabel: UITextView = UITextView()
        JummpyLabel.frame = CGRectMake(screenWidth * 0.001, 2400, screenWidth, 450)
        JummpyLabel.backgroundColor = UIColor.clearColor()
        JummpyLabel.textColor = UIColor.blackColor()
        JummpyLabel.textAlignment = NSTextAlignment.Center
        JummpyLabel.font = UIFont (name: "Thonburi", size: 22)
        JummpyLabel.text = "In late March of 2014, I released an app called Jumpy Jetpack using Sprite Kit based off the popular game Flappy Bird."
        
        //-----------SECTION 9 --------------------------------------
        
        //Adding the background for high school
        let gra = "graduate.jpeg"
        let grad = UIImage(named: gra)
        let gradBG = UIImageView(image: grad)
        gradBG.contentMode = .ScaleAspectFit
        gradBG.frame = CGRect(x: 0, y: 2700, width: screenWidth , height: 800)
        
        //Adding high school gram text
        var disGrad: UITextView = UITextView()
        disGrad.frame = CGRectMake(screenWidth * 0.001, 2690, screenWidth, 450)
        disGrad.backgroundColor = UIColor.clearColor()
        disGrad.textColor = UIColor.whiteColor()
        disGrad.textAlignment = NSTextAlignment.Center
        disGrad.font = UIFont (name: "Thonburi", size: 22)
        disGrad.text = "I graduated High School  from Lakehill Preparatory School in May of 2014."
        
        //Adding background color for section
        var blackArea = UIView(frame: CGRectMake(0, 2570, UIScreen.mainScreen().bounds.width, 325))
        blackArea.backgroundColor = UIColorFromRGB(0x000000)
        
        //-----------SECTION 10 --------------------------------------
        
        //Adding background color for section
        var lightblueArea = UIView(frame: CGRectMake(0, 3300, UIScreen.mainScreen().bounds.width, 425))
        lightblueArea.backgroundColor = UIColorFromRGB(0x5c78a7)
        
        //Adding high school gram text
        var TextCollege: UITextView = UITextView()
        TextCollege.frame = CGRectMake(screenWidth * 0.001, 3350, screenWidth, 450)
        TextCollege.backgroundColor = UIColor.clearColor()
        TextCollege.textColor = UIColor.blackColor()
        TextCollege.textAlignment = NSTextAlignment.Center
        TextCollege.font = UIFont (name: "Thonburi", size: 22)
        TextCollege.text = " I am currently attending college, as a freshman, at High Point University in North Carolina with a major in business administration and minor in entrepreneurship."
        
        
        //Adding the background for high school
        let college = "hpuBG.png"
        let HighCollege = UIImage(named: college)
        let HighPoint = UIImageView(image: HighCollege)
        HighPoint.contentMode = .ScaleAspectFill
        HighPoint.frame = CGRect(x: 0, y: 3620, width: screenWidth , height: 200)
        
        //-----------SECTION 11 --------------------------------------
        
        //Adding background color for section
        var blackArea1 = UIView(frame: CGRectMake(0, 3970, UIScreen.mainScreen().bounds.width, 1025))
        blackArea1.backgroundColor = UIColorFromRGB(0x000000)
        
        //Adding background color for section
        var darkBlueArea = UIView(frame: CGRectMake(0, 3850, UIScreen.mainScreen().bounds.width, 125))
        darkBlueArea.backgroundColor = UIColorFromRGB(0x050716)
        
        var overall: UITextView = UITextView()
        overall.frame = CGRectMake(screenWidth * 0.001, 3890, screenWidth, 450)
        overall.backgroundColor = UIColor.clearColor()
        overall.textColor = UIColor.whiteColor()
        overall.textAlignment = NSTextAlignment.Center
        overall.font = UIFont (name: "Thonburi", size: 22)
        overall.text = "Overall, I am a 19 year old teen from Dallas, Texas that has a strong passion for technology and hopes to, one day, create something inspiring."
        
        var appleWatch: UITextView = UITextView()
        appleWatch.frame = CGRectMake(screenWidth * 0.001, 4530, screenWidth, 450)
        appleWatch.backgroundColor = UIColor.clearColor()
        appleWatch.textColor = UIColor.whiteColor()
        appleWatch.textAlignment = NSTextAlignment.Center
        appleWatch.font = UIFont (name: "Thonburi", size: 14)
        appleWatch.text = "Check you  watch for more info"
        
        
        //Adding the background for myself
        let my = "myself.jpeg"
        let mself = UIImage(named: my)
        let myself = UIImageView(image: mself)
        myself.contentMode = .ScaleAspectFit
        myself.frame = CGRect(x: 0, y: 3850, width: screenWidth , height: 1000)
        
        containerView = UIView()
        
        
        //Adding the scroll view
        self.scrollView = UIScrollView()
        self.scrollView.delegate = self
        self.scrollView.contentSize = CGSizeMake(scrollView.contentOffset.x, 4600)
        
        //Assigning the parts to the views and scroll view
        containerView.addSubview(topblue)
        scrollView.addSubview(containerView)
        view.addSubview(scrollView)
        
        // self.containerView.addSubview(devProjects)
        // containerView.addSubview(education)
        // containerView.addSubview(techSkills)
        containerView.addSubview(profilePicture)
        containerView.addSubview(imageView1)
        //containerView.sendSubviewToBack(imageView)
        containerView.addSubview(from)
        containerView.addSubview(hello)
        containerView.addSubview(grayArea)
        containerView.addSubview(appstore)
        containerView.addSubview(macMini)
        containerView.addSubview(codePictre)
        containerView.addSubview(pen)
        containerView.addSubview(startCoding)
        containerView.addSubview(growingTree)
        containerView.addSubview(iconGrowing)
        containerView.addSubview(grayArea2)
        containerView.addSubview(soloDrum)
        containerView.addSubview(soloDrumming)
        containerView.addSubview(ZiiImage)
        containerView.addSubview(ZiiText)
        containerView.addSubview(devIntern)
        containerView.addSubview(internText)
        containerView.addSubview(nameIntern)
        containerView.addSubview(jumpyJet)
        containerView.addSubview(JummpyLabel)
        containerView.addSubview(blackArea)
        containerView.addSubview(gradBG)
        containerView.addSubview(disGrad)
        containerView.addSubview(lightblueArea)
        containerView.addSubview(HighPoint)
        containerView.addSubview(TextCollege)
        containerView.addSubview(blackArea1)
        containerView.addSubview(darkBlueArea)
        containerView.addSubview(myself)
        containerView.addSubview(overall)
        containerView.addSubview(appleWatch)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollView.frame = view.bounds
        containerView.frame = CGRectMake(0, 0, scrollView.contentSize.width, scrollView.contentSize.height)
    }
    
    
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        //Screen Size Adjustments
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        let scrollContentSizeHeight = scrollView.contentSize.height
        let scrollViewHeight = scrollView.frame.height
        let scrollOffset = scrollView.contentOffset.y
        
        if !scrollIf && scrollOffset > self.scrollView.frame.height * 0 + 220   {
            
            scrollIf = true
            
            //Making the Top Bar
            topBar.backgroundColor = UIColor.blackColor()
            view.addSubview(topBar)
            topBar.alpha = 0.7
            
            //Adding the mini profile picture
            let miniproPic = "wwdcIcon.png"
            let minithePic = UIImage(named: miniproPic)
            miniImage = UIImageView(image: minithePic)
            miniImage.frame = CGRect(x: 15, y: -60, width: 50, height: 50)
            view.addSubview(miniImage)
            
            //Anamation For mini profile picture
            let miniMove = POPSpringAnimation(propertyNamed: kPOPLayerTranslationXY)
            miniMove.toValue = NSValue(CGPoint: CGPointMake(0, 80))
            miniMove.fromValue = NSValue(CGPoint: CGPointMake(0, -90))
            miniMove.springSpeed = 2
            miniMove.springBounciness = 6
            miniImage.layer.pop_addAnimation(miniMove, forKey: "miniTranslation")
            
            //Adding Brandon Shaw Lable
            nameLable.frame = CGRectMake(screenWidth * 0.001, -75, screenWidth, 100)
            nameLable.backgroundColor = UIColor.clearColor()
            nameLable.textColor = UIColor.whiteColor()
            nameLable.textAlignment = NSTextAlignment.Center
            nameLable.font = UIFont (name: "HelveticaNeue-Light", size: 30)
            nameLable.text = "Brandon Shaw"
            view.addSubview(nameLable)
            
            
            //Anamation For mini profile picture
            let buttonMove = POPSpringAnimation(propertyNamed: kPOPLayerTranslationXY)
            buttonMove.toValue = NSValue(CGPoint: CGPointMake(0, 110))
            buttonMove.fromValue = NSValue(CGPoint: CGPointMake(0, -90))
            buttonMove.springSpeed = 2
            buttonMove.springBounciness = 3
            
            /*
            
            devProjects1.frame = CGRectMake(10, -35, 110, 35)
            devProjects1.backgroundColor = UIColor.clearColor()
            devProjects1.layer.cornerRadius = 15.0;
            devProjects1.layer.borderColor = UIColor.whiteColor().CGColor
            devProjects1.tintColor = UIColor.whiteColor()
            devProjects1.layer.borderWidth = 1.5
            devProjects1.setTitle("Dev Projects", forState: UIControlState.Normal)
            devProjects1.addTarget(self, action: "devProjects", forControlEvents: UIControlEvents.TouchUpInside)
            view.addSubview(devProjects1)
            devProjects1.layer.pop_addAnimation(buttonMove, forKey: "moveEduButton")
            
            
            
            
            education1.frame = CGRectMake(UIScreen.mainScreen().bounds.width * 0.35, -35, 110, 35)
            education1.backgroundColor = UIColor.clearColor()
            education1.layer.cornerRadius = 15.0;
            education1.layer.borderColor = UIColor.whiteColor().CGColor
            education1.tintColor = UIColor.whiteColor()
            education1.layer.borderWidth = 1.5
            education1.setTitle("Education", forState: UIControlState.Normal)
            education1.addTarget(self, action: "education", forControlEvents: UIControlEvents.TouchUpInside)
            view.addSubview(education1)
            education1.layer.pop_addAnimation(buttonMove, forKey: "moveEduButton")
            
            
            techSkills1.frame = CGRectMake(UIScreen.mainScreen().bounds.width * 0.675, -35, 110, 35)
            techSkills1.backgroundColor = UIColor.clearColor()
            techSkills1.layer.cornerRadius = 15.0;
            techSkills1.layer.borderColor = UIColor.whiteColor().CGColor
            techSkills1.tintColor = UIColor.whiteColor()
            techSkills1.layer.borderWidth = 1.5
            techSkills1.setTitle("Skills", forState: UIControlState.Normal)
            techSkills1.addTarget(self, action: "skills2", forControlEvents: UIControlEvents.TouchUpInside)
            view.addSubview(techSkills1)
            techSkills1.layer.pop_addAnimation(buttonMove, forKey: "moveEduButton")
            
            
            */
            
            //Anamation For Name
            let dropLable = POPSpringAnimation(propertyNamed: kPOPLayerTranslationXY)
            dropLable.toValue = NSValue(CGPoint: CGPointMake(0, 70))
            dropLable.fromValue = NSValue(CGPoint: CGPointMake(0, -70))
            dropLable.springSpeed = 2
            dropLable.springBounciness = 6
            nameLable.layer.pop_addAnimation(dropLable, forKey: "dropLable")
            
            //Anamation For Profile Picture
            let dropTopBar = POPSpringAnimation(propertyNamed: kPOPLayerTranslationXY)
            dropTopBar.toValue = NSValue(CGPoint: CGPointMake(0, 70))
            dropTopBar.fromValue = NSValue(CGPoint: CGPointMake(0, -70))
            dropTopBar.springSpeed = 2
            dropTopBar.springBounciness = 2
            topBar.layer.pop_addAnimation(dropTopBar, forKey: "dropDownBar")
            
            
        }
        if scrollIf && scrollOffset < self.scrollView.frame.height * 0 + 220   {
            
            scrollIf = false
            
            //Anamation For Profile Picture
            let dropUpBar = POPSpringAnimation(propertyNamed: kPOPLayerTranslationXY)
            dropUpBar.toValue = NSValue(CGPoint: CGPointMake(0, -70))
            dropUpBar.fromValue = NSValue(CGPoint: CGPointMake(0, 50))
            dropUpBar.springSpeed = 2
            dropUpBar.springBounciness = 0
            topBar.layer.pop_addAnimation(dropUpBar, forKey: "dropUpBar")
            
            //Anamation For Name
            let dropLable = POPSpringAnimation(propertyNamed: kPOPLayerTranslationXY)
            dropLable.toValue = NSValue(CGPoint: CGPointMake(0, -1))
            dropLable.fromValue = NSValue(CGPoint: CGPointMake(0, 50))
            dropLable.springSpeed = 2
            dropLable.springBounciness = 0
            nameLable.layer.pop_addAnimation(dropLable, forKey: "dropUpLable")
            
            //Anamation For mini profile picture
            let miniMoveUp = POPSpringAnimation(propertyNamed: kPOPLayerTranslationXY)
            miniMoveUp.toValue = NSValue(CGPoint: CGPointMake(0, -80))
            miniMoveUp.fromValue = NSValue(CGPoint: CGPointMake(0, 50))
            miniMoveUp.springSpeed = 2
            miniMoveUp.springBounciness = 0
            miniImage.layer.pop_addAnimation(miniMoveUp, forKey: "miniTranslation")
            
            //Anamation For mini profile picture
            let buttonMoveUp = POPSpringAnimation(propertyNamed: kPOPLayerTranslationXY)
            buttonMoveUp.toValue = NSValue(CGPoint: CGPointMake(0, 0))
            buttonMoveUp.fromValue = NSValue(CGPoint: CGPointMake(0, 90))
            buttonMoveUp.springSpeed = 2
            buttonMoveUp.springBounciness = 0
            
            
            //  education1.layer.pop_addAnimation(buttonMoveUp, forKey: "EdMoveUp")
            //  devProjects1.layer.pop_addAnimation(buttonMoveUp, forKey: "DevMoveUp")
            // techSkills1.layer.pop_addAnimation(buttonMoveUp, forKey: "TechMoveUp")
            
            
            
            
        }
        
    }
    
}
