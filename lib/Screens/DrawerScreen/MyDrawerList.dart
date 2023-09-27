import 'package:flutter/material.dart';

class MyDrawerList extends StatelessWidget {
  final DrawerSections currentPage;
  final Function(DrawerSections) onMenuItemSelected;

  MyDrawerList({
    required this.currentPage,
    required this.onMenuItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        children: [
          menuItem(1, "Home", Icons.home_sharp,
              currentPage == DrawerSections.dashboard ? true : false),
          menuItem(2, "Search", Icons.search,
              currentPage == DrawerSections.search ? true : false),
          menuItem(3, "About Us", Icons.people_alt_outlined,
              currentPage == DrawerSections.aboutus ? true : false),
          menuItem(4, "Contacts", Icons.message,
              currentPage == DrawerSections.contacts ? true : false),
          menuItem(5, "Privacy Police", Icons.privacy_tip_outlined,
              currentPage == DrawerSections.privacy_policy ? true : false),
          menuItem(6, "Send feedback", Icons.feedback_outlined,
              currentPage == DrawerSections.send_feedback ? true : false),
          menuItem(7, "Logout", Icons.logout,
              currentPage == DrawerSections.logout ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          onMenuItemSelected(DrawerSections.values[id - 1]);
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: "Poppins-Regular",
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  dashboard,
  search,
  aboutus,
  contacts,
  privacy_policy,
  send_feedback,
  logout,
  mobileCategories
}
