import 'package:flutter/material.dart';
import 'package:genuine_tech_assignment/data/utilities/urls.dart';
import 'package:genuine_tech_assignment/ui/Screen/log_in_screen.dart';
import 'package:genuine_tech_assignment/ui/widget/snack_message.dart';
import '../../controller/auth_controller.dart';

class CurrentAppBar extends StatefulWidget {
  const CurrentAppBar({
    super.key,
  });

  @override
  State<CurrentAppBar> createState() => _CurrentAppBarState();
}

class _CurrentAppBarState extends State<CurrentAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black87, width: 2)),
      child: ListTile(
        leading: CircleAvatar(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
              '${URL.imageUrl}/${AuthController.user?.empImagePath ?? Icon(Icons.person)}',
              fit: BoxFit.cover,
              height: 50,
              width: 50,
            ),
          ),
        ),
        title: Center(
          child: Text(
            AuthController.user?.userName ?? "Unknown",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        subtitle: Center(
          child: Column(children: [
            Text(AuthController.user?.email ?? "Unavailable"),
            Text(' (${AuthController.user?.companyName ?? "Unknown"})')
          ]),
        ),
        trailing: IconButton.outlined(
            onPressed: () {
              AlertDialog(
                title: const Text(
                  'Alert',
                  style: TextStyle(color: Colors.red),
                ),
                content: Text(
                  'Are you sure you want to Logout ?',
                ),
                actions: [
                  TextButton(
                      onPressed: () async {
                        AuthController.clearAuthData();
                        if (mounted) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()),
                            (route) => false,
                          );

                          showSnackMessage(context,
                              'Successfully Logged Out. Sign in to continue');
                        }
                      },
                      child: Text(
                        'Yes',
                      )),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'No',
                      )),
                ],
              );
            },
            icon: Icon(
              Icons.logout_outlined,
              color: Colors.green,
            )),
      ),
    );
  }
}
