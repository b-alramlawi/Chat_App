
import 'dart:developer';

import 'package:chat_appx/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'model/user.dart';

IO.Socket socket;
String connectionStatus;

class SocketService {

  void connect() async {
    String id = FirebaseAuth.instance.currentUser.uid;
    UserData currentUser = await DatabaseService().getUserByID(id);

    log(currentUser.uid);

    socket = IO.io("http://192.168.1.242:5000", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": true,
    });
    socket.connect();
    socket.emit("signin", currentUser.uid);
    socket.onConnect((data) {
      connectionStatus = 'online';
    });

    connectionStatus = 'offline';
  }

}
