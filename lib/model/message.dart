class Message {
  String message;
  String time;

  Message({
    this.message,
    this.time,
  });

  Map<String, dynamic> toMap() {
    return {
      "text": message,
      "time": time,
    };
  }

  factory Message.fromMap(Map<String, dynamic> data) {
    return Message(
      message: data["text"],
      time: data["time"],
    );
  }
}
