import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
    required this.userCredentials,
  });

  final Map<String, dynamic> userCredentials;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 11.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(userCredentials["AccountName"],
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.w700
              ),
            ),
            const Divider(),
            Text("Phone Number:",
                style: Theme.of(context).textTheme.titleMedium
            ),
            const SizedBox(
              height: 15,
            ),
            Text(userCredentials["Phone1"],
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text("Phone Number:",
                style: Theme.of(context).textTheme.titleMedium
            ),
            const SizedBox(
              height: 15,
            ),
            Text(userCredentials["Phone1"],
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            Text("Email 4:",
                style: Theme.of(context).textTheme.titleMedium
            ),
            const SizedBox(
              height: 15,
            ),
            Text(userCredentials["Email4"],
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text("Email 1:",
                style: Theme.of(context).textTheme.titleMedium
            ),
            const SizedBox(
              height: 15,
            ),
            Text(userCredentials["Email1"],
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text("Email 2:",
                style: Theme.of(context).textTheme.titleMedium
            ),
            const SizedBox(
              height: 15,
            ),
            Text(userCredentials["Email2"],
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text("Email 3:",
                style: Theme.of(context).textTheme.titleMedium
            ),
            const SizedBox(
              height: 15,
            ),
            Text(userCredentials["Email3"],
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            const SizedBox(
              height: 30,
            ),
            const Row(
              children: [
                SizedBox(width: 200,),
                FaIcon(FontAwesomeIcons.gear,
                  size: 30,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
