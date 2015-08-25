//
//  ViewController.m
//  InstagramViewer
//
//  Created by MCS on 8/18/15.
//  Copyright (c) 2015 MCS. All rights reserved.
//

#import "ViewController.h"
#import "ModalClass.h"
#import "Cell.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark -  ViewDidLoad
- (void)viewDidLoad
{
    // Do any additional setup after loading the view, typically from a nib.
    
    self.urlstandardResArray = [[NSMutableArray alloc ]init];
    
    NSLog(@"view Did Load - Main View Controller");
    
    // NSURLConnection
    Connection * con = [[Connection alloc] init];
    con.delegate = self;
    [con downloadFile];
    
    [super viewDidLoad];
}

-(void) ViewWillAppear
{
    NSLog(@"The view will appear");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Connection to JSON
-(void)connection:(Connection *)connection didFinishWithResultData:(NSData *)xmlData
{
    // XML Parsing
    //XMLParsing *xmlParsing = [[XMLParsing alloc] initWithXMLData:xmlData];
    //xmlParsing.delegate = self;
    //[xmlParsing startParsing];
    
    // JSON Parsing
    NSLog(@"Call connection Method with JSON Parameters");
    JSONParsing * jsonParsing = [[JSONParsing alloc] initWithData:xmlData];
    jsonParsing.delegate = self;
    [jsonParsing startParsing];
    NSLog(@"Did connection to JSON startParsing end");
}

#pragma mark - JSONParsingDelegate

-(void) JSONParsing: (JSONParsing *)jsonParsing didFinishParsingWithResult: (NSDictionary *) resultDict
{
    NSLog(@"JSON Parsing -> ");
    //NSLog(@"%@", resultDict);
    
    NSDictionary * dictionaryFromParse = resultDict;
    
    NSArray * imageArray = [[dictionaryFromParse allValues] objectAtIndex:1];
    NSLog(@"Elements from Dictionary -> %lu", [imageArray count]);
    
    for (NSDictionary * imageInfo in imageArray)
         {
//             NSString * imageDetails = [imageInfo objectForKey:@"data"];
                  NSString * urlPath = [[[imageInfo objectForKey:@"images"] objectForKey:@"standard_resolution"] objectForKey:@"url"];
//                     NSString * user = [[imageInfo objectForKey:@"user"] objectForKey:@"username"];
             
             
//             NSLog (@"urlPath -> %@", urlPath);
//                NSLog (@"user -> %@", user);
             
             ModelClass * newElement = [[ModelClass alloc]init];
                  newElement.urlPath = urlPath;
                     //newElement.user = user;
             
             //NSLog(@"URL Path form ModelClass.newElement.urlPath > %@", newElement.urlPath);
             
             //[self.imageArray addObject:newElement];
             [self.urlstandardResArray addObject:newElement];
             
             //NSLog(@"Array from urlstandardResArray -> %@", self.urlstandardResArray);
         }
    [self.tableView reloadData];
    [self.collectionView reloadInputViews];
    //NSLog(@"*******Array Size -> %lu", (unsigned long)[self.urlstandardResArray count]);
    NSLog(@"End of JSON Parsing");
}


#pragma mark creation of the table and tableView
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    NSLog(@"Return the Number of segment for the Cell for the table View");
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"Table view return array count");
    NSLog(@"Array Size -> %lu", (unsigned long)[self.urlstandardResArray count]);
    return [self.urlstandardResArray count];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSLog(@"Table view Iniciated");
    
    static NSString * simpleTableIdentifier = @"userPost";
    ModelClass * image = (ModelClass *)[self.urlstandardResArray objectAtIndex:indexPath.row];
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ - %@",image.urlPath,image.user];
    return cell;
}


#pragma mark creation of the Collection and image view
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    //#warning Incomplete method implementation -- Return the number of sections
    NSLog(@"Return the Number of segment for the Cell for the table Collection View");
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    //#warning Incomplete method implementation -- Return the number of items in the section
    NSLog(@"Collection view return array count");
    NSLog(@"Array Size -> %lu", (unsigned long)[self.urlstandardResArray count]);
    return [self.urlstandardResArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Configure the cell and it's content");
    
//    NSLog(@"Assign the cell name with ID");
    static NSString * simpleTableIdentifier = @"ImageCell";
    
//    NSLog(@"Create the ModelClass Object for the Array URL");
    ModelClass * imageUrl = (ModelClass *)[self.urlstandardResArray objectAtIndex:indexPath.row];
    
//    NSLog(@"Reusable Cell");
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:simpleTableIdentifier forIndexPath:indexPath];
    
//    NSLog(@"If of if the Cell is null");
    if (cell == nil)
    {
        //cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        cell = [UICollectionViewCell alloc];
    }
    
//    NSLog(@"Assign the URL for the String");
    NSString * urlArtWork = imageUrl.urlPath;
//    NSLog(@"Assign that string to the NSURL");
    NSURL * url = [NSURL URLWithString:urlArtWork];
//    NSLog(@"NSDATA form the NSURL");
    NSData * imageData = [NSData dataWithContentsOfURL:url];
//    NSLog(@"Set the image to the UIImageView");
    self.urlImageView.image=[[UIImage alloc]initWithData:imageData];
//    NSLog(@"Return Cell");
    return cell;
}

@end
