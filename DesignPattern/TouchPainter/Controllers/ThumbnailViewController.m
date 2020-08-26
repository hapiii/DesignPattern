//
//  ThumbnailViewController.m
//  DesignPattern
//
//  Created by hapii on 2020/1/9.
//  Copyright © 2020 hapii. All rights reserved.
//

#import "ThumbnailViewController.h"
#import "CoordinatingController.h"

@interface ThumbnailViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UINavigationItem *navItem;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ThumbnailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    CGRect statusRect = [[UIApplication sharedApplication] statusBarFrame];
    CGFloat navHeight = statusRect.size.height + 44;
   
    UINavigationBar *navigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, statusRect.size.height, self.view.frame.size.width, statusRect.size.height+44)];
    navigationBar.backgroundColor = [UIColor whiteColor];
    self.navItem = [[UINavigationItem alloc] initWithTitle:@"缩略图"];
    UIButton *close = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [close addTarget:[CoordinatingController sharedInstance] action:@selector(requestViewChangeByObject:)  forControlEvents:UIControlEventTouchUpInside];
    [close setImage:[UIImage imageNamed:@"close_view"] forState:UIControlStateNormal];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:close];
    self.navItem.rightBarButtonItem = rightItem;
     [self.view addSubview:navigationBar];
     [navigationBar setItems:@[self.navItem]];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, navHeight, self.view.frame.size.width, self.view.frame.size.height - navHeight) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    UIColor *backgroundColor = [UIColor colorWithPatternImage:
                                [UIImage imageNamed:@"background_texture"]];
    [self.tableView setBackgroundColor:backgroundColor];
    
    // initialize the scribble manager
    scribbleManager_ = [[ScribbleManager alloc] init];
    
    // show number of scribbles available
    NSInteger numberOfScribbles = [scribbleManager_ numberOfScribbles];
    [self.navItem setTitle:[NSString stringWithFormat:
                        numberOfScribbles > 1 ? @"%ld items" : @"%ld item",
                        (long)numberOfScribbles]];
    
}




#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  // Return the number of sections.
  return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  // Return the number of rows in the section.
  CGFloat numberOfPlaceholders = [ScribbleThumbnailCell numberOfPlaceHolders];
  NSInteger numberOfScribbles = [scribbleManager_ numberOfScribbles];
  NSInteger numberOfRows = ceil(numberOfScribbles / numberOfPlaceholders);
  return numberOfRows;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  
  static NSString *CellIdentifier = @"Cell";
  
  ScribbleThumbnailCell *cell = (ScribbleThumbnailCell *)[tableView
                                                          dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil)
  {
    cell = [[ScribbleThumbnailCell alloc] initWithStyle:UITableViewCellStyleDefault
                                         reuseIdentifier:CellIdentifier];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
  }
  
  // Configure the cell...
  
  // populate  thumbnails in each cell
  
  // get max number of thumbnail a thumbnail
  // cell can support
  NSInteger numberOfSupportedThumbnails = [ScribbleThumbnailCell numberOfPlaceHolders];
  
  // we can only add max numberOfSupportedThumbnails
  // at a time in each cell
  // e.g. numberOfSupportedThumbnails = 3
  // thumbnail index in the scribble manager is (row index *3) +0, +1, +2
  NSUInteger rowIndex = [indexPath row];
  NSInteger thumbnailIndex = rowIndex *numberOfSupportedThumbnails;
  NSInteger numberOfScribbles = [scribbleManager_ numberOfScribbles];
  for (NSInteger i = 0; i < numberOfSupportedThumbnails &&
       (thumbnailIndex + i) < numberOfScribbles; ++i)
  {
    UIView *scribbleThumbnail = [scribbleManager_ scribbleThumbnailViewAtIndex:
                                            thumbnailIndex + i];
    [cell addThumbnailView:scribbleThumbnail atIndex:i];
  }
  
  return cell;
}

#pragma mark -
#pragma mark Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  return 150;
}


@end
