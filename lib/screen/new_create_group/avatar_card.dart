import 'package:chat_appx/model/user.dart';
import 'package:chat_appx/providers/user_group.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AvatarCard extends StatelessWidget {
  const AvatarCard({Key key, this.user}) : super(key: key);
  final UserData user;

  @override
  Widget build(BuildContext context) {
    final gu = Provider.of<GroupUsers>(context);
    bool selected =
        gu.selectedContacts.any((element) => element.uid == user.uid);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              if (selected) {
                gu.removeFromList(user);
              } else {
                gu.addTOList(user);
              }
            },
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 23,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(27.5),
                    child: (user.image != null)
                        ? Image.network(user.image)
                        : Image.asset('assets/profileAvatar.png'),
                  ),
                  backgroundColor: Colors.blueGrey[200],
                ),
                const Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 11,
                    child: Icon(
                      Icons.clear,
                      color: Colors.white,
                      size: 13,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            user.name ?? user.phone,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
