//
//  QOPViewController.m
//  WyhViewModel
//
//  Created by 609223770@qq.com on 08/26/2019.
//  Copyright (c) 2019 609223770@qq.com. All rights reserved.
//

#import "QOPViewController.h"
#import <QOP.h>
#import <KVOController/KVOController.h>
#import "QOPDemoData.h"

@interface QOPTestInfo : NSObject

@property (nonatomic, copy) NSString *name;

@end

@implementation QOPTestInfo



@end

@interface QOPViewController () <UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *bindLabel;

@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (nonatomic, strong) QOPTestInfo *info;

@end

@implementation QOPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.info = [[QOPTestInfo alloc]init];
    self.info.name = @"xxx";
    
    self.title = QOPDemoData.instance.identifier;
    
    __weak typeof(self) ws = self;
    [self.qop.bind(QOPDemoData.instance).keypath(@"identifier").options(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) update:^(id observer, id updatedValue) {
        ws.title = updatedValue;
    }];

    [self.qop.bind(self.info).keypath(@"name") update:^(id observer, id updatedValue) {

        ws.bindLabel.text = updatedValue;
    }];
}

- (IBAction)obseAction:(UIButton *)sender {
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)textViewDidChange:(UITextView *)textView {
    
    self.info.name = textView.text;
    
}

@end
