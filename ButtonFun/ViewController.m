//
//  ViewController.m
//  ButtonFun
//
//  Created by Michael Dautermann on 1/7/13.
//  Copyright (c) 2013 Michael Dautermann. All rights reserved.
//

#import "ViewController.h"
#import "FunView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)handleTap:(UITapGestureRecognizer *)sender
{
    if (sender.state == UIGestureRecognizerStateEnded)
    {
        // handling code
        CGPoint locationOfTap = [sender locationInView: self.view];
        NSInteger xIndex = floorf(locationOfTap.x / 40.f);
        NSInteger yIndex = floorf(locationOfTap.y / 40.f);
        
        // find the view that matches these indexes
        for(FunView * specificSquare in [self.view subviews])
        {
            if((specificSquare.xIndex == xIndex) && (specificSquare.yIndex == yIndex))
            {
                specificSquare.backgroundColor = [ViewController randomColor];
            }
        }
    }
}
    
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGRect frameRect = self.view.frame;
    NSInteger xIndex, yIndex = 0;
    for( CGFloat yPosition = 0.0; yPosition < frameRect.size.height; yPosition+=40.0f )
    {
        // reset xIndex on every iteration
        xIndex = 0;
        for( CGFloat xPosition = 0.0; xPosition < frameRect.size.width; xPosition+=40.0f )
        {
            FunView * randomSquare = [[FunView alloc] initWithFrame: CGRectMake(xPosition, yPosition, 40.f, 40.0f)];

            if(randomSquare)
            {
                randomSquare.backgroundColor = [ViewController randomColor];
                randomSquare.xIndex = xIndex;
                randomSquare.yIndex = yIndex;
                [self.view addSubview: randomSquare];
            }
            xIndex++;
        }
        yIndex++;
    }
    
    mGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    if(mGestureRecognizer)
    {
        [self.view addGestureRecognizer: mGestureRecognizer];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+ (UIColor *) randomColor
{
    UIColor * colorToReturn;
    
    uint32_t randomNumber = random();
    randomNumber = (randomNumber % 10); // a random number between 0 & 10
    
    switch(randomNumber)
    {
        case 0 :
            colorToReturn = [UIColor blueColor];
            break;
        case 1 :
            colorToReturn = [UIColor grayColor];
            break;
        case 2 :
            colorToReturn = [UIColor greenColor];
            break;
        case 3 :
            colorToReturn = [UIColor purpleColor];
            break;
        case 4 :
            colorToReturn = [UIColor redColor];
            break;
        case 5 :
            colorToReturn = [UIColor brownColor];
            break;
        case 6 :
            colorToReturn = [UIColor cyanColor];
            break;
        case 7 :
            colorToReturn = [UIColor orangeColor];
            break;
        case 8 :
            colorToReturn = [UIColor magentaColor];
            break;
        case 9 :
            colorToReturn = [UIColor whiteColor];
            break;
        default :
            colorToReturn = [UIColor blackColor];
            
    }
    return(colorToReturn);
}

@end
