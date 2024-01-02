class RequestItem {
  RequestItem({required this.iconPath, required this.title, required this.isCompleted});

  final String iconPath;
  final String title;
  final bool isCompleted;
}

final requestList = [
  RequestItem(iconPath: 'assets/images/flight-takeoff.svg', title: 'Business Trip in New York', isCompleted: false),
  RequestItem(iconPath: 'assets/images/gift.svg', title: "Mark's Birthday Party", isCompleted: false),
  RequestItem(iconPath: 'assets/images/gift.svg', title: "Sam's Graduation Gift", isCompleted: true),
  RequestItem(iconPath: 'assets/images/home.svg', title: 'Summer house in the hampton', isCompleted: true),
  RequestItem(iconPath: 'assets/images/ring.svg', title: "Dan and Meg's wedding in October", isCompleted: true),
  RequestItem(iconPath: 'assets/images/shopping-bag.svg', title: "Pick up Tux from DryCleaners", isCompleted: true),

];

List <RequestItem> inProgressList = requestList.where((item) => item.isCompleted == false).toList();
List <RequestItem> completeList = requestList.where((item) => item.isCompleted == true).toList();
