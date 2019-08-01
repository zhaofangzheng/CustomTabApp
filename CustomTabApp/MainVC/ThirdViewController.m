//
//  ThirdViewController.m
//  CustomTabApp
//
//  Created by fzzhao on 2018/11/1.
//  Copyright © 2018年 fzzhao. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    NSString *htmlStr = @"<div><p>文段表达</p> \n<p>假如你是李华，你的美国笔友Tom要来北京和你一起过寒假。请你写信告诉他北京的天气情况、你通常在假期都做什么以及你的感受。（图片信息仅供参考）</p> \n<p>要求：50个词左右。</p> \n<p><img width=\"511\" height=\"101\" data-cke-saved-src=\"http://bz.zhixue.com/dividepaper/img/wordToHtml/47d1c28b-0aca-4bcf-92c9-06411e5f3443.png\" src=\"http://bj.download.cycore.cn/question/addQuestion/596/9b6eb485-5adb-4878-a627-ea6173981c80.png\" shapes=\"Picture_x0020_1\" /></p> \n<p>Dear Tom，</p> \n<p>I am glad that you will come to Beijing!</p> \n<p>___________________________________________________________________________</p> \n<p>___________________________________________________________________________</p> \n<p>___________________________________________________________________________</p> \n<p>___________________________________________________________________________</p> \n<p>___________________________________________________________________________</p> \n<p>___________________________________________________________________________</p> \n<p>Best wishes.</p> \n<p>Yours，</p> \n<p>Li Hua</p></div>";
    NSString *oldStr = [self replaceImageHtml:htmlStr];
    NSAttributedString *strAtt = [[NSAttributedString alloc] initWithData:[oldStr dataUsingEncoding:NSUnicodeStringEncoding] options:@{NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType} documentAttributes:nil error:nil];
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 100, 414, 500)];
    textView.backgroundColor = [UIColor redColor];
//    textView.attributedText = strAtt;
    textView.text = oldStr;
    [self.view addSubview:textView];
}

- (NSString *)replaceImageHtml:(NSString *)oldHtml {
    oldHtml = [self replaceHtmlWithRegex:@"<br />" htmlString:oldHtml replaceString:@"\n"];//生成换行
    oldHtml = [self replaceHtmlWithRegex:@"</?[^>]+>" htmlString:oldHtml replaceString:@""];//剔除<html>标签
    oldHtml = [self replaceHtmlWithRegex:@"<a>\\s*|\t|\r|\n</a>" htmlString:oldHtml replaceString:@""];//剔除字符串中的空格，回车，换行符，制表符
    oldHtml = [self replaceHtmlWithRegex:@"\n\n|\n \n|\n \n" htmlString:oldHtml replaceString:@"\n"];
    return oldHtml;
}

- (NSString *)replaceHtmlWithRegex:(NSString *)regex htmlString:(NSString *)htmlString replaceString:(NSString *)replaceString
{
    NSRegularExpression *regularExpression = [NSRegularExpression regularExpressionWithPattern:regex options:0 error:nil];
    htmlString = [regularExpression stringByReplacingMatchesInString:htmlString options:0 range:NSMakeRange(0, htmlString.length) withTemplate:replaceString];
    return htmlString;
}

@end
